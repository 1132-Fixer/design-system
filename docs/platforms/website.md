# Website

The website (including the download page, tracked in the separate `1132-fixer-download-page` project) should look like the application — product-first, not a generic SaaS marketing template.

## Layout

Breakpoints and grid: see [`../05-layout.md`](../05-layout.md) — `640px`/`1024px`/`1280px`, single column below `640px`, 12-column grid at `1024px`+.

## Components

Reuse [`../08-components.md`](../08-components.md) directly for any UI shown on the site (e.g. a live component demo, a "what it looks like" section) — don't restyle buttons/cards for the marketing context. The one exception is scale: hero headings may exceed the `display` token size for impact, but body copy and components stay on-scale.

## Website patterns

Use the [website component catalog](../08-components.md#website-component-catalog) for:

- Accordion / disclosure: FAQ answers and optional repair details.
- Link and Website navigation: page destinations, section links, and downloads.
- Hero / download section: concrete repair scope and platform choices.
- Alert / notice: visible download errors and repair warnings.
- Tabs: related views within one page.
- Form field / selection controls: labelled reports and explicit choices.
- Data / comparison table: platform support and check results.
- Pagination: release notes or guides spread across pages.
- Footer: secondary links and support information.

These specs define available patterns. Add a pattern only when page content needs it. They do not change the current website or require new pages.

## Responsive behavior

- Phone layouts are part of the website surface. Apply each component's Mobile behavior rules.
- Collapse header links only when they no longer fit. Use the Website navigation disclosure; do not use an application menu.
- Keep FAQs stacked. Keep critical repair warnings visible outside accordions.
- Stack hero content, form fields, and footer groups on narrow screens.
- Tables and tab lists may scroll within their own containers. The page must not require horizontal scrolling.
- Keep keyboard focus visible. Use native HTML controls and the accessibility rules in [`../09-accessibility.md`](../09-accessibility.md).

## Download page

- Mirrors the product's real screenshots (`screenshots/mac/*.png`) — see [`../10-marketing.md`](../10-marketing.md) rule that marketing imagery must be real captures, not mockups.
- OS-detection pattern: detect visitor OS (macOS/Windows) and surface the matching download button first, with the other platform available as a secondary link — don't hide the non-detected platform entirely.
- Uses the full gear+wordmark badge (marketing mark) in the hero, per [`../01-brand.md`](../01-brand.md) — never the in-app glyph.

## SEO / OG images

1200×630 OG image per [`../10-marketing.md`](../10-marketing.md) spec. Page `<title>`/meta description should use the same precise, checkable-claims voice as in-product copy (see [`../01-brand.md`](../01-brand.md)) — avoid generic "boost your PC" SEO filler even where it might be tempting for keyword coverage.
