# Components

Every component below follows the checklist structure defined in [`../examples/component-checklist.md`](../examples/component-checklist.md) — see that file for a fully worked example (Button). New components must be run through the same checklist before shipping.

Specs are based directly on the shipped macOS UI (`screenshots/mac/main.png`, `screenshots/mac/report-bug.png`) — treat these as the reference implementation, not just inspiration.

## Button

- **Primary** (e.g. "Choose Location…"): `primary` fill, `text-primary` label, `radius.md`, `spacing.12`/`spacing.16` padding.
- **Panel/card button** (e.g. "Start Zoom", "Dry Run"): full-card hit area, `surface` background with `primary` border when active/selected (see "Start Zoom" panel in `main.png`), icon + `subheading` title + `body` description stacked, trailing arrow icon (Lucide `arrow-right`).
- **Secondary/ghost** (e.g. "Copy", "Clear", "Cancel"): `surface` fill, `border` outline, `text-primary` label.
- States: hover/pressed/disabled per [`02-colors.md`](02-colors.md) state rules; transitions use `fast` from [`07-motion.md`](07-motion.md).

## Input (text field)

- `surface-modal` or `surface` background (matches parent container — modal inputs use `surface-modal`, as seen in the Report-a-bug email field), `border` outline, `radius.md`.
- Focus state: `primary` border/ring, per [`09-accessibility.md`](09-accessibility.md).
- Placeholder text uses `text-secondary`.
- Multi-line variant (Report-a-bug "Message" field): same rules, min-height ~4 lines, resizable.

## Card

- `surface` background, `radius.lg`, `spacing.16` internal padding, `spacing.24` gap between sibling cards.
- Optional header: icon chip (small rounded square, `surface` background) + `heading` text, left-aligned.

## Modal / Dialog

- `surface-modal` background (not `surface` — see [`02-colors.md`](02-colors.md) for why this is a distinct token), `overlay` scrim behind it, `radius.lg`.
- Title (`heading`), optional description (`body`, `text-secondary`), form content, action row (secondary button left, primary button right).
- Opens/closes with `base` duration from [`07-motion.md`](07-motion.md). Dismissible via `Esc` and scrim click.

## Status pill / tag

- Pill shape (`radius.xl` or fully rounded), `caption`-size text, `spacing.4`/`spacing.8` padding.
- `success` background tint + `success` text for supported/passed (e.g. "Intel", "Apple Silicon", "Wi-Fi").
- `error` background tint + `error` text for unsupported/failed (e.g. "VPN").
- Never rely on color alone — label text is required (see [`09-accessibility.md`](09-accessibility.md)).

## Checklist row

- Pattern: leading status icon (checkmark in `success`, or pending/error equivalent) + `label`-weight key (e.g. "macOS:") + `body`-weight value (e.g. "macOS 26.5.0").
- Two-column layout on wide containers (as in `main.png`'s Preflight Checks card), single column below the [`05-layout.md`](05-layout.md) minimum window width.

## Activity log panel

- `surface` background, `mono` typography role (see [`03-typography.md`](03-typography.md)) for all log content.
- Header row: title (`heading`) + action buttons (Copy, Clear, expand/collapse) right-aligned, using the secondary/ghost button style.
- Empty state: `text-secondary` `body` text ("No logs yet. Run an action to see output.") — no illustration, no animation.
- New lines append instantly — see [`07-motion.md`](07-motion.md) motion rule against animating logs.

## Nav / header

- App header: in-app glyph (see [`01-brand.md`](01-brand.md)) + `display` product name + `caption` subtitle, left-aligned; utility links (GitHub, Website, Report a bug, Export Diagnostics) right-aligned as ghost buttons.
