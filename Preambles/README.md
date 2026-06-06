# Preambles

Shared LaTeX/Beamer preamble for the **03_AIWTPGap** Korean proposal.

## Usage in a deck

```latex
\documentclass{beamer}
\input{header}   % resolves via TEXINPUTS=../Preambles:$TEXINPUTS

\title{프로포절 제목}
\author{[저자명]}
\date{\today}

\begin{document}
\frame{\titlepage}
% ...
\end{document}
```

Compile with `/compile-latex <file>` — the skill sets `TEXINPUTS` for you. For manual compilation:

```bash
cd Slides
TEXINPUTS=../Preambles:$TEXINPUTS xelatex -interaction=nonstopmode YourFile.tex
```

## Korean font

The preamble loads **KoPub Dotum** via `xeCJK` + `fontspec`. Install the family from <https://www.kopus.or.kr/biz/electronic/font.do> (free for personal and academic use) before compiling.

Fallback options if KoPub Dotum is unavailable on your system — edit the `\setCJKmainfont` line in `header.tex`:

- `Apple SD Gothic Neo` (macOS default, no install required)
- `Pretendard` (modern open-source — <https://github.com/orioncactus/pretendard>)
- `Noto Sans CJK KR` (Google — broad availability)

Verify what is installed:

```bash
fc-list | grep -i "KoPub\|Pretendard\|Noto.*CJK\|Apple SD"
```

## What's inside

- **Korean setup** — `xeCJK`, `fontspec`, KoPub Dotum main / sans / mono fonts, automatic CJK–Latin spacing, line-spread for Hangul readability.
- **Palette** — 11 named colors used by Beamer theme assignments and TikZ snippets (`primary-blue`, `primary-gold`, `highlight-yellow`, `light-bg`, `jet`, `positive`, `negative`, `neutral`, `hi-slate`, `hi-green`, `hi-red`).
- **Beamer theme assignments** — structure, titles, itemize, alert, blocks, minimal footer.
- **TikZ libraries** — `arrows.meta, positioning, calc, decorations.pathreplacing, fit, shapes.geometric, backgrounds`.
- **Shared TikZ styles** — `dag-node`, `decision-node`, `observed-edge`, `counterfactual-edge`, `confound-edge`, `observed-dot`, `counterfactual-dot`. Used by `templates/tikz-snippets/` and reusable in hand-written diagrams.
- **Convenience macros** — `\muted{...}`, `\key{...}`, `\good{...}`, `\bad{...}`, `\transitionslide{...}`.

## Extending

Add packages your decks need *after* `\input{header}` in each `.tex` file, not in this preamble — that keeps the shared file small and auditable. Only add to `header.tex` if every deck in the project needs it.

For a deck-specific preamble (rare), create `Preambles/<name>-addon.tex` and `\input` it after `header.tex`.
