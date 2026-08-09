# Website

The website (including the download page, tracked in the separate `1132-fixer-download-page` project) should look like the application — product-first, not a generic SaaS marketing template.

## Layout

Breakpoints and grid: see [`../05-layout.md`](../05-layout.md) — `640px`/`1024px`/`1280px`, single column below `640px`, 12-column grid at `1024px`+.

## Components

Reuse [`../08-components.md`](../08-components.md) directly for any UI shown on the site (e.g. a live component demo, a "what it looks like" section) — don't restyle buttons/cards for the marketing context. The one exception is scale: hero headings may exceed the `display` token size for impact, but body copy and components stay on-scale.

## Download page

- Mirrors the product's real screenshots (`screenshots/mac/*.png`) — see [`../10-marketing.md`](../10-marketing.md) rule that marketing imagery must be real captures, not mockups.
- OS-detection pattern: detect visitor OS (macOS/Windows) and surface the matching download button first, with the other platform available as a secondary link — don't hide the non-detected platform entirely.
- Uses the full gear+wordmark badge (marketing mark) in the hero, per [`../01-brand.md`](../01-brand.md) — never the in-app glyph.

## SEO / OG images

1200×630 OG image per [`../10-marketing.md`](../10-marketing.md) spec. Page `<title>`/meta description should use the same precise, checkable-claims voice as in-product copy (see [`../01-brand.md`](../01-brand.md)) — avoid generic "boost your PC" SEO filler even where it might be tempting for keyword coverage.
