#!/usr/bin/env bash
set -euo pipefail

usage() {
  echo "usage: $0 check|sync <consumer-root> <manifest>" >&2
  exit 2
}

[[ $# -eq 3 ]] || usage
mode=$1
consumer_root=$2
manifest=$3
[[ $mode == check || $mode == sync ]] || usage

design_system_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)

if [[ ! -s "$design_system_root/assets/1132-Fixer-App-Icon-1024x1024@1x.png" || ! -s "$design_system_root/assets/gear.png" ]]; then
  echo "brand guard: design-system submodule is missing or empty" >&2
  exit 1
fi

if [[ ! -s "$manifest" ]]; then
  echo "brand guard: manifest is missing or empty: $manifest" >&2
  exit 1
fi

failed=0
managed_targets=$(mktemp)
trap 'rm -f "$managed_targets"' EXIT
while IFS=$'\t' read -r canonical target; do
  [[ -z ${canonical:-} || ${canonical:0:1} == "#" ]] && continue
  source_path="$design_system_root/$canonical"
  target_path="$consumer_root/$target"
  printf '%s\n' "$target" >> "$managed_targets"

  if [[ ! -s "$source_path" ]]; then
    echo "brand guard: canonical asset missing: $canonical" >&2
    failed=1
    continue
  fi

  if [[ $mode == sync ]]; then
    mkdir -p "$(dirname "$target_path")"
    cp "$source_path" "$target_path"
  elif [[ ! -s "$target_path" ]]; then
    echo "brand guard: shipped asset missing: $target" >&2
    failed=1
  elif ! cmp -s "$source_path" "$target_path"; then
    echo "brand guard: shipped asset differs from design-system: $target" >&2
    failed=1
  fi
done < "$manifest"

if git -C "$consumer_root" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  while IFS= read -r candidate; do
    [[ $candidate == design-system/* ]] && continue
    if ! grep -Fqx "$candidate" "$managed_targets"; then
      echo "brand guard: unmanaged possible brand asset: $candidate" >&2
      failed=1
    fi
  done < <(git -C "$consumer_root" ls-files | grep -Ei '(^|/)[^/]*(favicon|logo|icon|badge|preview|tray|shortcut)[^/]*\.(png|svg|ico|icns)$' || true)
fi

if [[ $failed -ne 0 ]]; then
  echo "Run: design-system/scripts/brand-assets.sh sync . .brand-assets.tsv" >&2
  exit 1
fi

echo "brand assets $mode passed"
