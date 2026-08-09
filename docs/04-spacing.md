# Spacing

Values live in [`../tokens/spacing.json`](../tokens/spacing.json) — an 8-point scale plus a `4` half-step: `4, 8, 12, 16, 24, 32, 48, 64`.

## Usage rules

| Step | Use |
|---|---|
| `4` | Icon-to-label gap, tight inline spacing |
| `8` | Gap between related items in a row (tag pills, checklist icon+text) |
| `12` | Gap between form label and field, small internal button padding |
| `16` | Default card internal padding, gap between stacked fields |
| `24` | Gap between cards/sections within a panel |
| `32` | Section-level spacing (e.g. between "Preflight Checks" and "Zoom Location" cards) |
| `48` | Page-level top/bottom margins on wider screens |
| `64` | Website hero/section spacing only — not used in-app |

## Rules

- Reference the token name in specs and code (`spacing.16`, not `16px`) so a future rescale doesn't require hunting for raw numbers.
- Component **padding** should use `12`–`16`; **layout gutters** between components should use `16`–`24`; **section spacing** should use `24`+.
- Don't invent in-between values (e.g. `20px`) — pick the nearest step down.
