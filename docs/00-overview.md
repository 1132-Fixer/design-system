# Overview

1132 Fixer is a **Zoom diagnostic & repair utility**: it checks network/VPN/DNS state, resets Zoom app data, and launches Zoom in a known-good configuration. This design system is the single source of truth for how the brand and UI show up across four surfaces:

- **Chrome extension** — popup, see [`platforms/chrome-extension.md`](platforms/chrome-extension.md).
- **macOS app** — native window chrome, see [`platforms/macos.md`](platforms/macos.md).
- **Website** — marketing + download page, see [`platforms/website.md`](platforms/website.md).
- **Windows app** — compact single-task panel, see [`platforms/windows.md`](platforms/windows.md).

The products are equal. This list is in alphabetical order, and no product is the default for another: a value that differs by product lives in that product's token file or platform doc.

## Who this is for

- **Designers** extending the UI to new screens or platforms.
- **Developers** implementing components in any of the four codebases.
- **AI coding agents** generating or reviewing UI code — see [`11-ai-rules.md`](11-ai-rules.md) for hard rules.

## How docs are organized

| Layer | Files | Answers |
|---|---|---|
| Tokens | `tokens/*.json` | Raw values: color, spacing, radius, typography |
| Foundations | `docs/01`–`docs/07` | How tokens are used: brand, color, type, spacing, layout, icons, motion |
| Components | `docs/08-components.md` | Reusable UI pieces built from foundations |
| Cross-cutting | `docs/09-accessibility.md`, `docs/11-ai-rules.md` | Rules that apply to every component and platform |
| Marketing | `docs/10-marketing.md` | Brand in non-product contexts |
| Platforms | `docs/platforms/*.md` | Platform-specific rules and constraints |

## Cross-reference map

Use this to find what governs a given surface without reading everything:

- Building a **button, input, or card** anywhere → [`08-components.md`](08-components.md), which points back to [`02-colors.md`](02-colors.md), [`04-spacing.md`](04-spacing.md), [`../tokens/radius.json`](../tokens/radius.json).
- Building the **macOS app** → [`platforms/macos.md`](platforms/macos.md) for chrome/vibrancy rules, then `08-components.md` for the components themselves.
- Building the **Windows app** → [`platforms/windows.md`](platforms/windows.md), same pattern.
- Building the **Chrome extension** → [`platforms/chrome-extension.md`](platforms/chrome-extension.md) for popup constraints, then reuse desktop components as-is unless the platform doc says otherwise.
- Building **accordions, navigation, forms, tables, or other website elements** → [website component catalog](08-components.md#website-component-catalog) for behavior, states, and accessibility.
- Building the **website** → [`platforms/website.md`](platforms/website.md) plus [`10-marketing.md`](10-marketing.md) for brand-in-marketing rules.
- Any **color decision** → [`02-colors.md`](02-colors.md) is the only place hex values are stated; everywhere else references token names.
- Any **accessibility question** → [`09-accessibility.md`](09-accessibility.md), which layers on top of every other doc rather than duplicating it.
- Shipping or changing a **brand asset** → [`12-brand-assets.md`](12-brand-assets.md) for canonical exports, sync, CI, and review requirements.

## Source assets

Real brand assets live in `/assets` (app icon, gear mark) and `/screenshots` (shipped UI of the macOS app, the website and the Windows app, one folder each, used as the reference for current specs in this system). See [`01-brand.md`](01-brand.md) for how to use them.
