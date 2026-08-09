# Layout

## Desktop apps (Windows / macOS)

- Minimum window size: 720×640 — below this, card content in `08-components.md` patterns (two-column checklist rows) starts wrapping badly.
- Default window size: 900×760, matching the proportions in `screenshots/mac/main.png`.
- Content max-width inside the window: unconstrained — cards stretch to fill available width, unlike the website which caps line length.

## Chrome extension

- Popup: fixed width **420px**, height range **480–600px** (scrolls internally past 600px rather than growing further — popups can't exceed the visible viewport reliably across screen sizes).
- Options page (if/when needed): behaves like a scaled-down website page, not a popup — full-width layout, use website breakpoints below.

## Website

- Breakpoints: `640px` (mobile → tablet), `1024px` (tablet → desktop), `1280px` (max content width).
- Content max-width: `1280px`, matching desktop margins.
- Grid: single column below `640px`, 12-column grid at `1024px`+.

## Shared rule

Every surface uses the same [`04-spacing.md`](04-spacing.md) scale for internal spacing — only the outer container constraints differ per platform.
