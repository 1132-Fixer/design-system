# Accessibility

## Contrast

All `text-primary`/`text-secondary` on `background`/`surface`/`surface-modal` combinations must meet WCAG AA (4.5:1 for body text, 3:1 for large text ≥24px). Verify any new color pairing against [`02-colors.md`](02-colors.md) tokens before shipping — don't introduce a new text color to fix a contrast issue; adjust which token is used instead.

Status color alone is never sufficient — every `success`/`warning`/`error` state must also carry a text label or icon (already true of shipped checklist rows: icon + label + value, not just a colored dot).

## Keyboard

- Every interactive element (buttons, inputs, tag pills if interactive) must be reachable via Tab in visual order.
- `Enter`/`Space` activates buttons; `Esc` closes modals (Report a bug dialog).
- Focus ring: 2px solid `primary`, offset 2px, visible on every focusable element — never suppressed with `outline: none` without a replacement.

## Platform-specific notes

- **Windows (Narrator)**: label all icon-only buttons with accessible names; system tray icon needs a tooltip/name distinct from the app name.
- **macOS (VoiceOver)**: native titlebar and controls (see [`platforms/macos.md`](platforms/macos.md)) inherit VoiceOver support for free — don't replace them with custom-drawn equivalents that lose it.
- **Chrome extension**: popup DOM must have a logical heading structure (`h1`/`h2`) since some accessibility trees announce popups without a page title otherwise.
- **Website**: standard web a11y — semantic HTML, alt text on all screenshots/marketing imagery, skip-to-content link if nav grows past a simple header.

## Motion

Respect `prefers-reduced-motion` — see [`07-motion.md`](07-motion.md).
