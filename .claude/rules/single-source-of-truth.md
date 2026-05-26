---
paths:
  - "Figures/**/*"
  - "Slides/**/*.tex"
---

# Single Source of Truth (Beamer-only)

**The Beamer `.tex` file under `Slides/` is the authoritative source for ALL content** — body text, math, TikZ diagrams, and citation keys. There is no derived web mirror in this project at present.

## The SSOT Chain

```
Slides/*.tex (SOURCE OF TRUTH)
  ├── Inline TikZ pictures (no separate extraction needed)
  ├── Figures/    (PDFs, images included via \includegraphics)
  └── Bibliography_base.bib (shared, root)
```

If the project later adds a Quarto/HTML mirror, restore the TikZ extraction protocol (`extract_tikz.tex` → PDF → SVG) and the environment-parity checklist from the original template.

## Content Fidelity Checklist (current)

When editing or reviewing Beamer source:

```
[ ] Math: every equation uses notation consistent with prior slides / proposal sections
[ ] Citations: every \cite{} key exists in Bibliography_base.bib
[ ] Figures: every \includegraphics path resolves to a file under Figures/
[ ] TikZ: each tikzpicture follows the prevention + measurement rules
        (tikz-prevention.md, tikz-measurement.md, tikz-visual-quality.md)
[ ] Korean body / English technical terms (INV-1)
[ ] No \pause or overlay commands (INV-3)
[ ] At most 2 colored boxes per slide (INV-4)
```
