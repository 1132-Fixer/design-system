# Windows

Windows 11 conventions. No shipped Windows UI exists yet — this page defines the target spec, derived from the macOS reference (`screenshots/mac/*.png`) adapted to Windows norms. Flag any deviation discovered during implementation rather than silently changing this doc.

## Chrome

- Custom titlebar (not the default Win32 titlebar) matching the app's `background` token, with minimize/maximize/close controls right-aligned per Windows convention (opposite of macOS's left-aligned traffic lights).
- Titlebar height: 32px.
- Corner radius: use system-default rounded corners (Windows 11 auto-rounds top-level windows) — don't override with a custom radius.

## Surfaces

- Mica/acrylic materials are **not used** — the brand's flat dark navy (`background`/`surface` tokens) takes precedence over Windows' translucent materials. This keeps the app visually consistent with macOS rather than adopting Windows-specific chrome effects.
- All card/panel specs from [`../08-components.md`](../08-components.md) apply unchanged.

## Typography

Segoe UI Variable per [`../03-typography.md`](../03-typography.md) — same type scale (sizes/weights) as macOS, only the font family changes.

## Icons

- App icon: multi-resolution `.ico` (16/24/32/48/256) generated from `assets/1132-Fixer-App-Icon-1024x1024@1x.png` — see [`../06-icons.md`](../06-icons.md).
- System tray icon: 16/20/24/32px, simplified `gear.png` glyph (not the full wordmark badge — too detailed at tray size).
- Tray icon needs an accessible name distinct from "1132 Fixer" for Narrator — see [`../09-accessibility.md`](../09-accessibility.md).

## First-run / installer

- Installer background uses `background` token, full gear+wordmark badge centered, matching the marketing mark rules in [`../01-brand.md`](../01-brand.md).
- No light-mode installer variant — dark only, consistent with the rest of the product.
