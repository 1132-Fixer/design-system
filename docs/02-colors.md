# Colors

Dark theme only — 1132 Fixer does not support a light theme. All values live in [`../tokens/colors.json`](../tokens/colors.json); this page is the only place hex values should be written. Everywhere else, reference the token name.

## Palette

| Token | Hex | Role |
|---|---|---|
| `background` | `#0F1724` | App window / page background |
| `surface` | `#202B3D` | Cards, panels, list rows |
| `surface-modal` | `#2A2530` | Modals/dialogs — a distinct, warmer elevation tier (see note below) |
| `primary` | `#2E78D6` | CTAs, links, active/focused states, selection |
| `success` | `#3CCF6E` | Passed checks, "supported" tags, positive status |
| `warning` | `#FFB547` | Caution states, non-blocking issues |
| `error` | `#EF5350` | Failed checks, "unsupported" tags, destructive actions |
| `text-primary` | `#F5F7FA` | Primary text on `background`/`surface` |
| `text-secondary` | `#9AA5B4` | Secondary/muted text, captions, placeholders |
| `border` | `#33415A` | Card/input borders, dividers |
| `overlay` | `rgba(15,23,36,0.72)` | Scrim behind modals |
| `gradient-brand-start` / `gradient-brand-end` | `#FFD24C` / `#E8552A` | Logo wordmark gradient — logo/icon use only, never UI |

`text-primary` on `background` and `surface` both exceed WCAG AA (4.5:1) for body text; verify any new color pairing against [`09-accessibility.md`](09-accessibility.md) before shipping.

## `surface-modal`: why it's separate

The shipped Report-a-bug dialog uses a warmer, slightly plum-toned dark (`#2A2530`) instead of the app's navy `surface`. This is treated as an **intentional elevation tier** — modals sit visually apart from the main window — rather than normalized away. Any new modal/dialog should use `surface-modal`, not `surface`.

## Usage rules

- `primary` is reserved for interactive elements (buttons, links, focus rings, active tab/selection). Never use it for large decorative fills.
- `success` / `warning` / `error` communicate **status only** — a check result, a tag, a validation message. Don't use them as generic accent colors.
- `gradient-brand-*` tokens exist only for reproducing the logo wordmark in icons/marketing assets. Never apply the gradient to UI text, buttons, or backgrounds.

## States

Derive interactive states from base tokens rather than adding new hardcoded colors:

- **Hover**: `primary` at 90% opacity, or `surface` lightened ~6%.
- **Pressed**: `primary` at 80% opacity, or `surface` lightened ~3%.
- **Disabled**: `text-secondary` for label, `border` for outline, no fill.
- **Focus ring**: 2px `primary`, see [`09-accessibility.md`](09-accessibility.md).

## Future light theme

Not planned currently — product ships dark-only. If a light theme is requested later, derive it as a parallel token set (`background-light`, `surface-light`, etc.) rather than replacing dark values.
