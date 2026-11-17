# CSS tokens

Products that render with web technology take their tokens from generated CSS
files, not from hand-copied values.

| File | Product | Sources |
|---|---|---|
| `css/tokens.extension.css` | Chrome extension | shared token files |
| `css/tokens.website.css` | Website | shared token files |
| `css/tokens.windows.css` | Windows app | shared token files, then `tokens/windows.json` |

The products are equal. Each file is the shared tokens plus that product's own
token file, when it has one. No product is the base of another. The macOS app
is native and reads `tokens/macos.json` directly, so it has no CSS file.

## What a file contains

One `:root` block of custom properties:

| Property | Source |
|---|---|
| `--color-<name>` | `tokens/colors.json`, then the product's `colors` |
| `--space-<n>` | `tokens/spacing.json`, then the product's `spacing` |
| `--radius-<name>` | `tokens/radius.json`, then the product's `radius` |
| `--font-sans`, `--font-mono` | `tokens/typography.json` `fontStack` |
| `--type-<role>-size`, `-line-height`, `-weight` | `tokens/typography.json` `scale` |
| `--motion-<name>-duration`, `-easing` | `tokens/motion.json` |
| `--window-<name>` | the product's `window`, when it has one |

## Rules

1. Never edit a file in `css/`. Change the token file, then run
   `node scripts/build-css.mjs` and commit both.
2. CI runs `node scripts/build-css.mjs --check` and fails when a committed
   file is out of date.
3. A product copies its file without changes and keeps the copy equal to this
   repository at its pinned commit. Use the brand-asset manifest for that
   (`docs/12-brand-assets.md`): map `css/tokens.<product>.css` to the shipped
   path, and the same `check` and `sync` commands cover it.
4. A product stylesheet uses these properties by name. It does not declare a
   colour, a spacing step, a radius, a font or a duration of its own. When a
   product needs a value that is not here, add the token here first.
