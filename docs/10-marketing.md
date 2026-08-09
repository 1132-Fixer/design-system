# Marketing

## Brand in marketing vs in-product

In-product UI uses the simplified header glyph (see [`01-brand.md`](01-brand.md)); marketing contexts (website hero, App Store/download page, social) use the full gear + "1132 FIXER" wordmark badge. Never swap these.

## Screenshots

Product screenshots used in marketing (website, download page) must be real captures of the shipped UI — see `screenshots/mac/*.png` for the current reference set — not mockups or illustrations. This keeps marketing honest about what the tool actually looks like, consistent with the product's precise, technical positioning (see [`01-brand.md`](01-brand.md)).

- Always capture at native resolution (@2x/Retina minimum) on `background`, never a light-mode capture — there is no light theme.
- Crop to the window content plus titlebar; don't add a fake browser-chrome or device frame unless the placement specifically calls for one.

## Download page

The download page (separate project, `1132-fixer-download-page`) should mirror this system's tokens directly rather than approximate them — same `background`/`surface`/`primary` values, same type scale for headings/body. See [`platforms/website.md`](platforms/website.md) for layout specifics.

## OG / social images

Use the full gear badge on `background`, with `display`-scale wordmark text if a headline is included. Export at 1200×630 (standard OG size).
