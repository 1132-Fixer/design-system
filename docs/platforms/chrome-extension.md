# Chrome Extension

## Popup

- Fixed width: **420px**.
- Height: **480–600px**, scrolling internally past 600px (see [`../05-layout.md`](../05-layout.md)) — a Chrome popup can't reliably grow beyond the visible viewport across all screen sizes.
- No custom titlebar — the popup has no window chrome to theme; content starts directly with the app header pattern from [`../08-components.md`](../08-components.md) (glyph + name, no traffic lights/min/max/close since Chrome owns that container).

## Components

Reuse desktop components as-is (buttons, cards, status pills, checklist rows) — no extension-specific variants unless a component genuinely can't fit 420px width (e.g. the two-column checklist row from `08-components.md` should collapse to single-column at this width, same as the minimum-window-width rule for desktop).

## Icons

MV3 `action` icon: 16, 32, 48, 128px PNGs generated from `assets/gear.png`, not the full app-icon badge — extension icons render very small (toolbar size is effectively 16–32px), and the full badge's "1132 FIXER" wordmark is illegible at that size. `gear.png` alone stays legible down to 16px. See [`../06-icons.md`](../06-icons.md).

## Options page

If an options page is added, it behaves like a scaled-down website page (full-width, responsive), not a popup — see [`../05-layout.md`](../05-layout.md) website breakpoints, not the popup constraints above.

## Badge / notifications

- Extension badge (small overlay on the toolbar icon) uses `error`/`warning`/`success` tokens for its background color depending on state (e.g. red badge if a check fails), white text.
- Browser notifications (if used) follow the same voice/tone rules as in-product copy — see [`../01-brand.md`](../01-brand.md): concrete and checkable ("VPN detected — may affect Zoom connection"), not vague.

## Accessibility

Popup DOM needs a logical heading structure — see [`../09-accessibility.md`](../09-accessibility.md).
