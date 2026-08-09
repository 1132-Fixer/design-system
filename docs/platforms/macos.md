# macOS

Primary reference platform — the shipped UI (`screenshots/mac/main.png`, `screenshots/mac/report-bug.png`) is the current source of truth for this system's components and tokens.

## Chrome

- **Native titlebar** — confirmed as the current pattern (real traffic-light controls visible in `main.png`, not custom-drawn). This is the rule, not an option: don't replace it with a custom titlebar. Native chrome gets VoiceOver support for free (see [`../09-accessibility.md`](../09-accessibility.md)).
- Traffic-light spacing: standard macOS positioning (leave system defaults, don't reposition).

## Materials

- Vibrancy/translucency materials are used sparingly, only where macOS convention expects them (e.g. sidebar material if a sidebar is added later) — the main content surfaces stay flat `background`/`surface`, matching the shipped UI. Don't apply vibrancy to cards or buttons.
- Modals use `surface-modal` (see [`../02-colors.md`](../02-colors.md)) — this is a real, intentional difference from the main window's `surface`, confirmed from `report-bug.png`. Don't reconcile the two into one tone; document them as distinct elevation tiers.

## Typography

SF Pro Text per [`../03-typography.md`](../03-typography.md).

## Icons

- Dock icon: `assets/1132-Fixer-App-Icon-1024x1024@1x.png`, exported to `.icns` at 16–1024px — see [`../06-icons.md`](../06-icons.md).
- Menu bar icon (if added): template image (monochrome, alpha-only) derived from `gear.png`, 16/32px @1x/@2x.

## Sandboxing / entitlements

The app performs system-level actions (resets Zoom app data, reads network interface state) — if sandboxed, entitlements must be declared for file access to `~/Library/Application Support/zoom.us` and network state queries. This affects first-run permission prompts, which should use the app's standard modal styling (`surface-modal`), not a system alert style, wherever a custom prompt is used instead of a required system dialog.
