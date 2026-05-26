---
paths:
  - "Slides/**/*.tex"
---

# Task Completion Verification Protocol

**At the end of every task, Claude MUST verify the output works correctly.** This is non-negotiable.

## For LaTeX/Beamer Slides (the only verified artifact in this project)

1. Compile with XeLaTeX (3 passes + bibtex). The `/compile-latex` skill, or manually:
   ```bash
   cd Slides
   TEXINPUTS=../Preambles:$TEXINPUTS xelatex -interaction=nonstopmode FILE.tex
   BIBINPUTS=..:$BIBINPUTS bibtex FILE
   TEXINPUTS=../Preambles:$TEXINPUTS xelatex -interaction=nonstopmode FILE.tex
   TEXINPUTS=../Preambles:$TEXINPUTS xelatex -interaction=nonstopmode FILE.tex
   ```
2. Check exit code = 0 and grep the log for:
   - `Undefined control sequence` — error
   - `LaTeX Error` — error
   - `Citation '...' undefined` — bibliography mismatch
   - `Overfull \hbox` — width overflow (warning; investigate if > 10 pt)
   - `Font ... not found` — Korean font missing (advise user to install KoPub Dotum)
3. Open the PDF to visually confirm figures render correctly:
   - macOS: `open Slides/FILE.pdf`
   - Linux: `xdg-open Slides/FILE.pdf`
4. Read 2–3 image files to confirm they contain valid content (when applicable).

## For TikZ Diagrams (inline within Beamer)

1. The diagram compiles inside its host `.tex` file (no standalone extraction in this project).
2. Apply `tikz-prevention.md` Pass 0–6 (visual review).
3. If a diagram is edited, recompile the host file and visually inspect the affected slide.

## Verification Checklist

```
[ ] xelatex exit code 0
[ ] No undefined citations
[ ] No undefined references
[ ] Korean text renders (KoPub Dotum or fallback)
[ ] PDF opens and shows expected layout
[ ] Bibliography compiles (bibtex run if \cite{} present)
[ ] Reported results to user
```

## Out of scope (currently)

- Quarto/HTML render verification (no Quarto mirror in this project).
- R script verification (no analysis code in this project).
- TikZ SVG verification (no HTML mirror — Beamer uses inline TikZ).
