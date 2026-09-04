# Windows

Windows 11 conventions for the shipped Electron app
[1132-Fixer/windows](https://github.com/1132-Fixer/windows). A Windows UI has
shipped since 6.2.0; the values below are the ones it ships, taken from that
repository's `index.html` `:root` block and recorded here so this document and
the app agree. Where they differ from the cross-platform defaults, the
Windows-specific value is stated in [`../../tokens/windows.json`](../../tokens/windows.json)
and the reason is given. Flag any further deviation discovered during
implementation rather than silently changing this doc or the app.

Reference renders (headless-Chromium renders of the shipped page files with a
mocked IPC layer, 520×600 at 100 %): [`../../screenshots/windows/ready.png`](../../screenshots/windows/ready.png),
[`details.png`](../../screenshots/windows/details.png),
[`fixing.png`](../../screenshots/windows/fixing.png),
[`complete.png`](../../screenshots/windows/complete.png).

## Window and chrome

- Frameless window, `background` token as the window colour. Default size
  **520×600**, minimum **440×520** (device-independent pixels; Windows display
  scaling raises the device pixel ratio and does not shrink the CSS viewport).
  This is deliberately smaller than the desktop default in
  [`../05-layout.md`](../05-layout.md): the app is a single-task utility, not a
  dashboard, and the compact panel replaced the earlier card layout.
- No Win32 titlebar and no custom minimize/maximize row. One **56px app
  header** in every state: a Back action on the left (Details view only), the
  product mark (44px, `assets/brand/app-mark.png`) absolutely centered against
  the full window width, Exit on the right. The header row is the drag region.
- One **48px footer** in every state: version and the exact independence line
  on the left, Support · Feedback · About on the right. Explore is reachable
  only from the About dialog.
- Content is one centered column capped at **420px**, vertically centered
  with a slight optical lift. Nothing on a primary surface scrolls.
- Mica/acrylic materials are **not used** — flat dark navy throughout.
- Corner radius on the window is the system default (Windows 11 auto-rounds).

## Surfaces and colour (Windows overlay)

The Windows app uses a navy-only elevation scheme with two surface tiers and
no warm modal tint, and slightly brighter interactive/status colours for
contrast on the darker surfaces. Hex values are listed in
[`../02-colors.md`](../02-colors.md) § "Windows shipped palette"; the token
names below are the Windows overlay keys.

| Role | Cross-platform token | Windows token |
|---|---|---|
| App background | `background` | `background` (same) |
| Card / panel | `surface` | `surface`, `surface-2` (second tier) |
| Modal | `surface-modal` | `surface-2` — one navy theme, no plum tier |
| Hover / pressed fill | derived | `surface-hover`, `surface-pressed` |
| Border | `border` | `border`, `border-strong` |
| Primary / hover / pressed | `primary` (+ derived) | `primary`, `primary-hover`, `primary-pressed` |
| Focus ring | 2px `primary` | 2px `focus` on a 2px `background` gap (`0 0 0 2px background, 0 0 0 4px focus`) — equivalent contrast, tuned for the darker surfaces |
| Success / warning / error | `success` / `warning` / `error` | same names, Windows values |
| Text | `text-primary` / `text-secondary` | `text-primary`, `text-secondary`, `text-muted` |

## Radius and spacing (Windows overlay)

- Radii: `control` 10 (buttons, inputs, quiet actions), `card` 14, `modal`
  18, `pill` 999 (status chips only). More restrained than
  [`../../tokens/radius.json`](../../tokens/radius.json) (16/24/28) because the
  520px window cannot afford 24px corners on nested surfaces.
- Spacing: the shared scale plus `20` and `40`, used only by the Explore and
  feedback dialogs (the compact panel itself uses 4/8/12/16/24/32).

## Typography

Segoe UI Variable per [`../03-typography.md`](../03-typography.md) — same type
scale as macOS, only the font family changes. Screen title is 24/32/700
(between `heading` and `display`); Details heading is `heading` 20/26.

## Screens and controls

Primary states are exactly Checking, Ready, Fixing, Complete, Unable (plus
Blocked/action-required and Cancelled). Each state shows only the controls on
its allowlist (`screen-actions.js` in the app); `Fix now` is the single filled
primary on Ready; `Open Zoom` appears only after a verified repair.

**View details** opens an in-place Details view with a header Back control:
a readiness headline, one row per category, then one category at a time.
Every check has a plain-English label and one of four status words —
Checking · Ready · Needs attention · Unable to verify — with Lucide
`check-circle` / `alert-circle` / `help-circle` / `circle` marks. Checklist
rows are single-column (the two-column rule in
[`../08-components.md`](../08-components.md) applies above the 720px minimum
window, which Windows never reaches).

## Icons

- App icon: multi-resolution `.ico` (16/24/32/48/256) generated from
  `assets/1132-Fixer-App-Icon-1024x1024@1x.png` — see
  [`../06-icons.md`](../06-icons.md).
- In-app product mark: `assets/brand/app-mark.png` (managed export, see
  [`../12-brand-assets.md`](../12-brand-assets.md)).
- System tray icon (if added): 16/20/24/32px simplified `gear.png` glyph with
  an accessible name distinct from "1132 Fixer" — see
  [`../09-accessibility.md`](../09-accessibility.md).

## Installer

- Installer background uses `background`, full gear+wordmark badge centered,
  matching the marketing mark rules in [`../01-brand.md`](../01-brand.md).
- No light-mode installer variant — dark only.
