# Motion

## Principle

1132 Fixer is a diagnostic tool — motion should reinforce **speed and reliability**, not decorate. Avoid animation that makes the tool feel slower or less serious than the checks it's running.

## Scale

| Token | Duration | Easing | Use |
|---|---|---|---|
| `fast` | 150ms | ease-out | Hover/press state changes, tag pill color shifts |
| `base` | 200ms | ease-in-out | Panel/card transitions, modal open/close |
| `slow` | 250ms | ease-in-out | Full-screen state changes (e.g. entering a results view) |

All durations sit within the product's 150–250ms range — nothing should animate slower than 250ms.

## Rules

- Status changes (checkmark appearing, pill color changing from pending → success/error) use `fast` — the user is watching a live check resolve; don't make them wait on animation.
- Never animate the Activity Log — log lines should append instantly, no fade-in per line.
- Loading states (Dry Run in progress) use a simple indeterminate spinner or progress bar, not a custom animated illustration.
- Respect `prefers-reduced-motion` on web/extension: fall back to instant state changes (no transition) rather than a shortened animation. Native apps should read the equivalent OS-level setting (Reduce Motion on macOS, animation settings on Windows).
