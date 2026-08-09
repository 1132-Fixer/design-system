# AGENTS.md

This repo is a design system, not an app — no build/test/lint commands exist. Your job here is almost always reading or editing docs and tokens.

## Start here

Read [`docs/00-overview.md`](docs/00-overview.md) first — cross-reference map to every other doc. Then [`docs/11-ai-rules.md`](docs/11-ai-rules.md) before generating or reviewing any UI code against this system. Both apply regardless of which agent or tool you are.

## Hard rules

1. **Never invent components.** Missing from [`docs/08-components.md`](docs/08-components.md)? Stop, flag it, propose an addition there first — don't design inline.
2. **Cite tokens by name, never raw values.** Reference `tokens/colors.json`, `tokens/spacing.json`, `tokens/radius.json`, `tokens/typography.json` keys. Exception: [`docs/02-colors.md`](docs/02-colors.md), the canonical place hex values are defined.
3. **Preserve platform consistency.** Windows/macOS/Chrome-extension/website behave identically unless a `docs/platforms/*.md` file says otherwise. Platform doc silent on something → defer to `08-components.md` default, don't guess a variant into existence.
4. **Never fabricate assets.** Logo/icon/screenshot missing from `/assets` or `/screenshots` → flag it, don't generate a placeholder that could ship.
5. **Dark theme only.** No light-mode variants, ever.
6. **Zoom-repair specificity in copy.** Reference concrete checkable things (network state, VPN, DNS, Zoom app data) — not generic "optimize/boost/clean" utility marketing language. See [`docs/01-brand.md`](docs/01-brand.md).
7. **Extension icon:** Chrome extension always uses `assets/gear.png`, never the standard app icon — app icon reads too small at extension-icon sizes.

## Repo layout

| Path | Contents |
|---|---|
| `tokens/*.json` | Raw values: color, spacing, radius, typography |
| `docs/01`–`07` | Foundations: brand, color, type, spacing, layout, icons, motion |
| `docs/08-components.md` | Reusable UI components |
| `docs/09-accessibility.md`, `docs/11-ai-rules.md` | Cross-cutting rules for every component/platform |
| `docs/10-marketing.md` | Brand in non-product contexts |
| `docs/platforms/*.md` | Per-platform rules (macOS, Windows, Chrome extension, website) |
| `assets/`, `screenshots/` | Real brand assets and shipped-UI references |
| `examples/component-checklist.md` | Worked example (Button) — copy this shape for new components |

## Adding or changing anything

1. Extend an existing token before adding a new one — check `tokens/` for something close first.
2. New component → fill out [`examples/component-checklist.md`](examples/component-checklist.md) shape, add result to `docs/08-components.md`.
3. Behavior differs per platform → note it in `docs/platforms/*.md`, not invented elsewhere.
