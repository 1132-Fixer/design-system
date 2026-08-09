
# 1132 Fixer Design System

A complete cross-platform design system for:

- macOS
- Windows
- Chrome Extension
- Website

This repository is the single source of truth for designers, developers and AI coding agents. 1132 Fixer is a Zoom diagnostic & repair utility — dark theme only.

## Documentation

Start at [`docs/00-overview.md`](docs/00-overview.md) — it has a cross-reference map pointing to every other doc based on what you're building. Tokens (raw values) live in [`tokens/`](tokens/); everything else in [`docs/`](docs/) references them by name.

If you're an AI coding agent, read [`docs/11-ai-rules.md`](docs/11-ai-rules.md) before generating any UI code.

## Contributing

1. **Extend tokens before adding new ones.** If a value you need is close to an existing token in [`tokens/`](tokens/), use it — don't add a near-duplicate. If nothing fits, add a new token and document its role in the relevant `docs/0X-*.md` file.
2. **Run every new component through the checklist.** Copy the worked example in [`examples/component-checklist.md`](examples/component-checklist.md) (Button) and fill in the same sections for your component, then add it to [`docs/08-components.md`](docs/08-components.md).
3. **Update platform docs if behavior differs per platform.** The default is that a component behaves identically on Windows/macOS/Chrome Extension/Website. Only add a platform-specific note in `docs/platforms/*.md` when there's a real, deliberate difference (e.g. native titlebar on macOS vs custom on Windows) — don't invent a difference that doesn't need to exist.
4. **Cite tokens by name, not raw values**, in any doc, code, or design file — the only exception is [`docs/02-colors.md`](docs/02-colors.md), which is the canonical place hex values are defined.
