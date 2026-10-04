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

## Website component catalog

The specs below extend the catalog for website use. They define permitted components, not a requirement to add every component to every page. Existing app specs above remain the reference for shipped app controls.

All new components use the dark theme and existing token keys. Color keys come from [`../tokens/colors.json`](../tokens/colors.json); `spacing.*`, `radius.*`, and typography roles come from their matching token files. Focus, contrast, and target sizes follow [`09-accessibility.md`](09-accessibility.md). State transitions use `fast`; panel transitions use `base` from [`07-motion.md`](07-motion.md). Respect reduced motion. No component requires animation.

For small screens, use the website layout in [`05-layout.md`](05-layout.md). Mobile behavior here applies to websites viewed on phones; it does not add a native mobile app. For native platforms, use native controls with equivalent names, states, and keyboard behavior. Web-specific HTML and ARIA apply to the website and extension.

### Accordion / disclosure

**Purpose**
Show or hide related details, such as answers about VPN checks or Zoom app data resets.

**Variants**
Single disclosure; grouped FAQ. Each item opens independently. Use `surface`, `border`, `radius.md`, and `spacing.16`. Use `subheading` for the trigger and `body` for content.

**States**
Closed, open, hover, pressed, focused. Keep the label unchanged. Show expansion with a chevron from the icon set in `06-icons.md`. Hidden content must leave the focus order.

**Keyboard behavior**
Tab reaches each trigger. Enter or Space toggles it. Opening one item does not close another.

**Accessibility**
On web surfaces, prefer `details` with a `summary`. For custom controls, use a heading with a button, `aria-expanded`, and `aria-controls`. Give the content a stable ID. Do not put links or other buttons inside the trigger.

**Mobile behavior**
Wrap trigger text. Keep the full trigger row easy to tap. Content uses the container width.

**Desktop behavior**
Use the same stacked layout. Long answers must wrap.

**Windows notes**
Use these defaults when this component is needed. Follow `platforms/windows.md` for native layout and controls.

**macOS notes**
Use these defaults when this component is needed. Follow `platforms/macos.md` for native layout and controls.

**Chrome Extension notes**
Use these defaults when this component is needed. Follow `platforms/chrome-extension.md` for popup constraints. Stack content within the popup.

**Website notes**
Use for FAQs and repair details. Keep critical warnings visible outside collapsed content.

### Link

**Purpose**
Navigate to a page, a page section, a download, or an external resource.

**Variants**
Inline link; navigation link; download link. Use `text-primary` with an underline for inline links. Use `label` for navigation links. Use existing Button styles for prominent download links, while keeping link semantics.

**States**
Default, hover, focused, current, visited. Keep links identifiable without color. A current navigation link uses `primary` as an indicator and keeps `text-primary` text. Do not show an unavailable download as an active link.

**Keyboard behavior**
Tab focuses. Enter follows the link. Keep browser shortcuts and context menus available.

**Accessibility**
Use an anchor with a real destination on web surfaces. Give links clear names, such as “Download for Windows”. Use `aria-current="page"` or `aria-current="location"` when applicable. State when a link opens a new tab.

**Mobile behavior**
Allow labels to wrap. Space adjacent links so touch targets do not overlap.

**Desktop behavior**
Keep pointer and keyboard focus states visible.

**Windows notes**
Use these defaults when this component is needed. Follow `platforms/windows.md` for native layout and controls.

**macOS notes**
Use these defaults when this component is needed. Follow `platforms/macos.md` for native layout and controls.

**Chrome Extension notes**
Use these defaults when this component is needed. Follow `platforms/chrome-extension.md` for popup constraints. Stack content within the popup.

**Website notes**
Use section links for page navigation. Download labels must name the platform and match the actual file.

### Website navigation

**Purpose**
Give access to downloads, repair details, and support pages.

**Variants**
Expanded header; collapsible header. Use `background`, `border`, `spacing.16`, and `spacing.24`. Reuse Link and Button. Use only real brand assets.

**States**
Current destination, hovered link, focused link; collapsed or expanded navigation on narrow screens.

**Keyboard behavior**
Tab follows document order. Enter or Space toggles the navigation button. Escape closes an expanded navigation panel and returns focus to its button. Keep Tab in normal page order.

**Accessibility**
Use a labelled `nav` landmark. The toggle has `aria-expanded` and `aria-controls`. Closed navigation links must leave the focus order. Use ordinary links, not application menu roles. Include a skip-to-content link.

**Mobile behavior**
Collapse links when they no longer fit. Show a labelled navigation button. Opening the panel pushes page content down; it does not cover content.

**Desktop behavior**
Show links in one row when space permits. Keep the current destination clear.

**Windows notes**
Use these defaults when this component is needed. Follow `platforms/windows.md` for native layout and controls.

**macOS notes**
Use these defaults when this component is needed. Follow `platforms/macos.md` for native layout and controls.

**Chrome Extension notes**
Use these defaults when this component is needed. Follow `platforms/chrome-extension.md` for popup constraints. Stack content within the popup.

**Website notes**
Use the marketing mark per `01-brand.md`. Keep the site header distinct from the app header above.

### Hero / download section

**Purpose**
Explain what 1132 Fixer checks and give access to platform downloads.

**Variants**
Text with downloads; text with a real product screenshot. Use `display`, `body`, `text-primary`, `text-secondary`, and `spacing.32`. Reuse Link, Button, and Status pill.

**States**
Download available, unavailable, or loading. State which platform each download supports. Show failure text if release details cannot load.

**Keyboard behavior**
Only links and buttons enter the focus order. Keep their order consistent with reading order.

**Accessibility**
Use a section with the page heading. Give screenshots useful alt text. Describe download requirements in text. Do not make the whole hero clickable.

**Mobile behavior**
Stack text, download actions, and optional screenshot. Keep both platform choices visible.

**Desktop behavior**
Text and screenshot may sit side by side. Follow website grid rules.

**Windows notes**
Use these defaults when this component is needed. Follow `platforms/windows.md` for native layout and controls.

**macOS notes**
Use these defaults when this component is needed. Follow `platforms/macos.md` for native layout and controls.

**Chrome Extension notes**
Use these defaults when this component is needed. Follow `platforms/chrome-extension.md` for popup constraints. Stack content within the popup.

**Website notes**
Use concrete copy such as “Check network, VPN, and DNS state”. OS detection may reorder downloads; it must not remove the other platform.

### Alert / notice

**Purpose**
Keep warnings, errors, and repair guidance visible near affected content.

**Variants**
Information, success, warning, error. Use `surface`, `border`, `radius.md`, `spacing.16`, and `body`. Use `text-primary` for the message. Use the matching status token for an icon, with a text label.

**States**
Visible; dismissed only for optional notices. Critical repair warnings remain visible. Add a retry action only when an actual retry is available.

**Keyboard behavior**
Text is not focusable. Actions follow normal Button or Link behavior. If dismissal removes the focused button, move focus to the next relevant control.

**Accessibility**
Static notices need no live announcement. Use `role="status"` for new non-urgent results and `role="alert"` for new urgent errors. Never rely on color or an icon alone.

**Mobile behavior**
Stack actions below text when needed. Let the message wrap.

**Desktop behavior**
Actions may share a row with text if the message stays readable.

**Windows notes**
Use these defaults when this component is needed. Follow `platforms/windows.md` for native layout and controls.

**macOS notes**
Use these defaults when this component is needed. Follow `platforms/macos.md` for native layout and controls.

**Chrome Extension notes**
Use these defaults when this component is needed. Follow `platforms/chrome-extension.md` for popup constraints. Stack content within the popup.

**Website notes**
Use for download failures, VPN guidance, or warnings about Zoom app data. Keep required guidance outside accordions.

### Tabs

**Purpose**
Switch between related views in the same context, such as platform-specific instructions.

**Variants**
Horizontal tab list. Use `surface`, `border`, `spacing.12`, and `label`. Active tabs use a `primary` indicator and `text-primary` label. Panels use `body`.

**States**
Inactive, selected, hover, focused, disabled. Only the selected panel is visible and available to assistive technology.

**Keyboard behavior**
Tab enters the selected tab, then leaves the tab list. Left and Right Arrow move focus, wrapping at ends. Home and End focus first and last tabs. Enter or Space selects the focused tab. Selection uses manual activation.

**Accessibility**
Use `tablist`, `tab`, and `tabpanel` roles on web surfaces. Connect tabs and panels with stable IDs, `aria-controls`, and `aria-labelledby`. Set `aria-selected` and roving `tabindex`. A panel with no focusable content gets `tabindex="0"`.

**Mobile behavior**
Keep tabs in one row with horizontal scrolling if needed. Scroll the focused tab into view. Never clip its label.

**Desktop behavior**
Place the tab list above its panel. Keep content aligned when panels change.

**Windows notes**
Use these defaults when this component is needed. Follow `platforms/windows.md` for native layout and controls.

**macOS notes**
Use these defaults when this component is needed. Follow `platforms/macos.md` for native layout and controls.

**Chrome Extension notes**
Use these defaults when this component is needed. Follow `platforms/chrome-extension.md` for popup constraints. Stack content within the popup.

**Website notes**
Use links for navigation to separate pages. Do not hide mandatory download requirements in an inactive panel.

### Form field / selection controls

**Purpose**
Collect repair reports and explicit choices, such as a platform or permission to include diagnostic data.

**Variants**
Text field and multi-line field reuse Input. Add native select, checkbox, and radio controls. Group related radios in a fieldset. Use `label`, `body`, `caption`, `spacing.8`, and `spacing.16`. Text and select controls use `surface`, `border`, and `radius.md`.

**States**
Empty, filled, focused, disabled, invalid; checked or unchecked for choices. Errors use `text-primary` with an `error` icon and clear text. Keep entered values after a failed submit.

**Keyboard behavior**
Use native control keyboard behavior. Space toggles a checkbox. Arrow keys move between radios in a group. Do not intercept select keyboard commands.

**Accessibility**
Use visible labels. Place help text before error text. Connect both with `aria-describedby`; mark invalid fields with `aria-invalid`. Use `fieldset` and `legend` for choice groups. Identify required fields in text. After failed submission, focus the first invalid field.

**Mobile behavior**
Stack fields and actions. Keep labels visible and make checkbox/radio labels clickable.

**Desktop behavior**
Use multiple columns only when reading order stays clear.

**Windows notes**
Use these defaults when this component is needed. Follow `platforms/windows.md` for native layout and controls.

**macOS notes**
Use these defaults when this component is needed. Follow `platforms/macos.md` for native layout and controls.

**Chrome Extension notes**
Use these defaults when this component is needed. Follow `platforms/chrome-extension.md` for popup constraints. Stack content within the popup.

**Website notes**
Use browser-native selection controls with dark color scheme. Do not build custom select menus. Explain what diagnostic data is included before asking for consent.

### Data / comparison table

**Purpose**
Compare supported platforms or list check results with clear row and column labels.

**Variants**
Platform comparison; diagnostic results. Use `surface`, `border`, `spacing.12`, and `body`. Headers use `label` and `text-primary`. Reuse Status pill for results.

**States**
Populated, empty, loading, failed. Explain empty or failed results in text. Rows are static unless they contain a Link or Button.

**Keyboard behavior**
Static cells do not enter the Tab order. Controls inside cells use their normal keyboard behavior. A scroll region must be keyboard reachable when needed.

**Accessibility**
Use a semantic table with a caption and header cells with correct scope. Keep statuses in text. Label a horizontal scroll region. Do not use grid roles for a read-only table.

**Mobile behavior**
Allow horizontal scrolling inside the table container. Keep the page itself within the viewport. Preserve header associations.

**Desktop behavior**
Show all columns when they fit. Align text consistently. Do not imply sorting if no sorting action exists.

**Windows notes**
Use these defaults when this component is needed. Follow `platforms/windows.md` for native layout and controls.

**macOS notes**
Use these defaults when this component is needed. Follow `platforms/macos.md` for native layout and controls.

**Chrome Extension notes**
Use these defaults when this component is needed. Follow `platforms/chrome-extension.md` for popup constraints. Stack content within the popup.

**Website notes**
List only verified support and check results. Use a table for comparison data, not page layout.

### Pagination

**Purpose**
Move through multiple pages of release notes or repair guides.

**Variants**
Previous/next links; numbered page links. Use Link with `label`, `spacing.8`, and `spacing.12`. Current page uses `surface` and a `primary` indicator.

**States**
Current, available, hover, focused. At the start or end, omit the unavailable destination or show plain text without an active link.

**Keyboard behavior**
Tab reaches available links. Enter opens the destination. Do not add arrow-key handling.

**Accessibility**
Use a labelled navigation landmark and `aria-current="page"` for the current page. Give numbered links clear names such as “Page 2”. Ellipses are plain text.

**Mobile behavior**
Prefer previous/next links and a current-page label when numbers do not fit.

**Desktop behavior**
Show numbered pages when useful. Avoid a long row of every page.

**Windows notes**
Use these defaults when this component is needed. Follow `platforms/windows.md` for native layout and controls.

**macOS notes**
Use these defaults when this component is needed. Follow `platforms/macos.md` for native layout and controls.

**Chrome Extension notes**
Use these defaults when this component is needed. Follow `platforms/chrome-extension.md` for popup constraints. Stack content within the popup.

**Website notes**
Use real page destinations that work without scripts. Retain filters in destination URLs when filters exist.

### Footer

**Purpose**
Provide secondary site navigation, support, and ownership information.

**Variants**
Compact footer; grouped links. Use `background`, `border`, `spacing.24`, `spacing.32`, `caption`, and `text-secondary`. Reuse Link for destinations.

**States**
Static content plus normal Link states. No collapsed groups by default.

**Keyboard behavior**
Tab visits links in reading order. No special keyboard behavior.

**Accessibility**
Use a page-level `footer`. Label any navigation groups. Link names must remain clear outside their visual group.

**Mobile behavior**
Stack groups and allow text to wrap.

**Desktop behavior**
Groups may share a row. Preserve the same document order.

**Windows notes**
Use these defaults when this component is needed. Follow `platforms/windows.md` for native layout and controls.

**macOS notes**
Use these defaults when this component is needed. Follow `platforms/macos.md` for native layout and controls.

**Chrome Extension notes**
Use these defaults when this component is needed. Follow `platforms/chrome-extension.md` for popup constraints. Stack content within the popup.

**Website notes**
Include only real support, source, and policy destinations. Do not add empty social links or invented legal claims.
