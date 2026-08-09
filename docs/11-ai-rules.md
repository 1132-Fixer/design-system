# AI Agent Rules

These rules apply to any AI coding agent generating or reviewing UI code against this design system.

1. **Never invent components.** If a needed component isn't in [`08-components.md`](08-components.md), stop and flag it rather than designing a new one inline. Propose an addition to `08-components.md` first.
2. **Reuse tokens, always cite by name.** Never write a raw hex value, px number, or font name in code or docs — reference `tokens/colors.json`, `tokens/spacing.json`, `tokens/radius.json`, `tokens/typography.json` entries by key. The only exception is [`02-colors.md`](02-colors.md) itself, which is the canonical place hex values are defined.
3. **Preserve platform consistency.** A component's behavior should match across Windows/macOS/Chrome extension/website unless a platform doc explicitly says otherwise (e.g. native titlebar on macOS vs custom on Windows). When a platform doc is silent on something, defer to the component's default spec in `08-components.md` — don't guess a platform-specific variant into existence.
4. **Never fabricate missing assets.** If a logo, icon, or screenshot referenced by a doc doesn't exist in `/assets` or `/screenshots`, flag it as missing rather than generating a placeholder that might get shipped.
5. **Dark theme only.** Do not generate light-mode variants of any component or token — this product has no light theme.
6. **Zoom-repair specificity.** Copy generated for this product should reference concrete, checkable things (network state, VPN, DNS, Zoom app data) — not generic "optimize/boost/clean" utility marketing language. See [`01-brand.md`](01-brand.md).