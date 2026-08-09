
# Component Checklist

Every component must define:

- Purpose
- Variants
- States
- Keyboard behavior
- Accessibility
- Mobile behavior
- Desktop behavior
- Windows notes
- macOS notes
- Chrome Extension notes
- Website notes

## Worked example: Button

Copy this structure for any new component.

**Purpose**
Trigger a single action — start a diagnostic run, save a setting, submit a form. Not used for navigation (use a link/nav item instead).

**Variants**
- Primary: `primary` fill, `text-primary` label. Used for the one main action on a screen (e.g. "Choose Location…").
- Panel/card button: full-card hit area, icon + title + description, used for top-level actions ("Start Zoom", "Dry Run") — see [`../docs/08-components.md`](../docs/08-components.md).
- Secondary/ghost: `surface` fill, `border` outline — used for supporting actions ("Copy", "Clear", "Cancel").

**States**
- Default, hover (`primary` 90% opacity), pressed (`primary` 80% opacity), disabled (`text-secondary` label, `border` outline, no fill), focused (2px `primary` ring, offset 2px).
- Transitions use `fast` (150ms) per [`../docs/07-motion.md`](../docs/07-motion.md).

**Keyboard behavior**
- Reachable via Tab in visual order. `Enter` or `Space` activates. No custom keyboard shortcuts unless documented per-screen.

**Accessibility**
- Icon-only buttons require an accessible name (`aria-label` on web/extension, accessibility label on native). Focus ring must never be suppressed — see [`../docs/09-accessibility.md`](../docs/09-accessibility.md).

**Mobile behavior**
Not applicable — 1132 Fixer has no mobile surface today. If one is added later, minimum tap target is 44×44px.

**Desktop behavior**
Standard pointer hover/press states apply (see States above). Minimum click target 32×32px including padding.

**Windows notes**
Segoe UI Variable label font per [`../docs/platforms/windows.md`](../docs/platforms/windows.md). No platform-specific variant needed beyond font.

**macOS notes**
SF Pro Text label font per [`../docs/platforms/macos.md`](../docs/platforms/macos.md). No platform-specific variant needed beyond font.

**Chrome Extension notes**
Same component, no changes — popup width (420px) doesn't affect button layout since buttons don't span full width except panel/card buttons, which already stack vertically on narrow containers.

**Website notes**
Same component and states. Hero/marketing contexts may use a larger primary button (up to `display`-adjacent sizing) but must stay within the same color/state rules — see [`../docs/platforms/website.md`](../docs/platforms/website.md).
