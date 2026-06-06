# Workflow Quick Reference — 03_AIWTPGap

**Model:** Contractor (you direct, Claude orchestrates).
**Stage:** Korean Beamer proposal — design & theory.

---

## The Loop

```
Your instruction
    ↓
[PLAN] (if multi-file or unclear) → Show plan → Your approval
    ↓
[EXECUTE] Implement, verify, done
    ↓
[REPORT] Korean bullet summary + what's ready
    ↓
Repeat
```

---

## I Ask You When

- **Design forks:** "Option A (induced-value first) vs. Option B (homegrown first). Which?"
- **Code ambiguity:** "Spec unclear on X. Assume Y?"
- **Substantive choices:** "Power-calc effect-size prior — use Tunçel–Hammitt (2014) meta or our pilot?"
- **Scope question:** "Also draft the pre-registration while here, or stay on the deck?"

---

## I Just Execute When

- Compile fix is obvious (typo, missing package, lost brace).
- Verification (XeLaTeX 3-pass, citation resolution).
- Documentation (session logs, commit messages — both in Korean).
- TikZ tweak per established standards (`tikz-prevention.md`, `tikz-measurement.md`).

---

## Quality Gates (advisory, see `quality-gates.md`)

| Score | Action |
|-------|--------|
| ≥ 80 | Ready to commit |
| < 80 | Fix blocking issues |

---

## Non-Negotiables

- **LaTeX engine:** XeLaTeX (kotex / xeCJK depends on it). Never `pdflatex` for this project.
- **Korean font:** KoPubWorld Dotum primary; Apple SD Gothic Neo / Pretendard / Noto Sans CJK KR as documented fallbacks (`Preambles/header.tex` has commented blocks).
- **Working language:** Korean for plans, logs, decisions, slide body. English for the technical-term whitelist (see `.claude/rules/korean-language-convention.md`).
- **Paths:** All paths relative to repo root. No machine-specific absolute paths in committed files.
- **Colors:** Use the named palette in `Preambles/header.tex` (`primary-blue`, `primary-gold`, etc.). Do not invent hex codes in slide source.
- **No `\pause`** or Beamer overlay commands (INV-3).
- **At most 2 colored boxes per slide** (INV-4).
- **Motivation before formalism** — every definition has a preceding example or intuition (INV-5).

---

## Preferences

- **Visual:** 16:9 aspect ratio, body text ≥ 24 pt for presentation legibility. Korean line-spread 1.15 (already set in `header.tex`).
- **Reporting:** Concise Korean bullets. Surface key decisions explicitly; do not bury them in prose.
- **Session logs:** Always — post-plan, incremental (every design decision / correction / approach change), end-of-session.
- **Replication numerics:** N/A at this stage (no analysis code). Re-define when analysis stage begins.
- **Citation style:** Author–year (`\citet`/`\citep` style via natbib or biblatex — choose at first proposal section). English author names inside parentheses.

---

## Exploration Mode

For experimental work (e.g., sketching a new TikZ diagram or design variant), use the **Fast-Track** in `explorations/`:
- 60/100 quality threshold (vs. 80/100 for production).
- No plan needed — just a research-value check (2 min).
- See `.claude/rules/exploration-fast-track.md`.

---

## Next Step

You provide task → I plan (if needed) → Your approval → Execute → 한국어 요약 보고.
