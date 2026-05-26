# CLAUDE.MD — 03_AIWTPGap 작업환경

**Project:** 03_AIWTPGap — AI-assisted Information Provision and the WTP–WTA Gap
**Institution:** [YOUR INSTITUTION]
**Branch:** main
**Stage:** Design & theory (proposal phase). No analysis code yet.
**Working language:** 한국어 본문 + 영문 전문용어 (see `.claude/rules/korean-language-convention.md`).
**Deliverable:** Korean Beamer PDF proposal (single artifact, no Quarto/HTML mirror).

---

## Core Principles

- **Plan first** — enter plan mode before non-trivial tasks; save plans to `quality_reports/plans/`.
- **Verify after** — compile the Beamer PDF and confirm output at the end of every task.
- **Single source of truth** — `Slides/*.tex` is authoritative. There is no derived Quarto/HTML mirror in this project.
- **Quality gates** — nothing ships below 80/100 (Beamer rubric only — see `.claude/rules/quality-gates.md`).
- **Korean working language** — plans, logs, specs, and proposal body are in Korean; technical terms (WTP/WTA/BDM/SPA/induced/homegrown/…) stay in English.
- **[LEARN] tags** — when corrected, save `[LEARN:category] wrong → right` to [MEMORY.md](MEMORY.md).

Cross-session context lives in [MEMORY.md](MEMORY.md); past plans, specs, and session logs are in [quality_reports/](quality_reports/).

---

## Folder Structure

```
03_AIWTPGap/
├── CLAUDE.MD                   # This file
├── MEMORY.md                   # Persistent learnings
├── .claude/                    # Rules, skills, agents, hooks, references
├── Bibliography_base.bib       # Centralized bibliography (single file, INV-2)
├── Figures/                    # Figures and images for Beamer
├── Preambles/header.tex        # LaTeX preamble (xeCJK + KoPubWorld Dotum)
├── Slides/                     # Beamer .tex files (authoritative source)
├── scripts/                    # validate-setup.sh, quality_score.py, surface checks
├── quality_reports/            # Plans, specs, session logs, decisions, preregistrations
├── explorations/               # Research sandbox (see exploration-folder-protocol.md)
├── templates/                  # Session log, requirements spec, preregistration, TikZ snippets
└── master_supporting_docs/     # Reference papers (PDFs)
```

> Removed in this project: `Quarto/`, `docs/`, `scripts/R/`. Quarto/HTML mirror and R analysis are out-of-scope at the proposal stage. Restore from the upstream template if/when those stages are added.

---

## Commands

```bash
# Beamer compile (3-pass XeLaTeX). /compile-latex automates this.
cd Slides && TEXINPUTS=../Preambles:$TEXINPUTS xelatex -interaction=nonstopmode HelloWorld.tex

# Add bibtex pass once \cite{} is in use:
BIBINPUTS=..:$BIBINPUTS bibtex HelloWorld
TEXINPUTS=../Preambles:$TEXINPUTS xelatex -interaction=nonstopmode HelloWorld.tex
TEXINPUTS=../Preambles:$TEXINPUTS xelatex -interaction=nonstopmode HelloWorld.tex

# Quality score (Beamer rubric, see .claude/rules/quality-gates.md)
python scripts/quality_score.py Slides/HelloWorld.tex

# Environment validation (XeLaTeX, KoPubWorld Dotum, hooks)
./scripts/validate-setup.sh
```

---

## Quality Thresholds (advisory)

| Score | Checkpoint | Meaning |
|-------|------------|---------|
| 80 | Commit | Good enough to save |
| 90 | PR | Ready for deployment |
| 95 | Excellence | Aspirational |

Enforced by `/commit` (halts + asks for override); not enforced by a git pre-commit hook.

---

## Skills Quick Reference (active in this project)

| Command | What It Does |
|---------|--------------|
| `/compile-latex [file]` | 3-pass XeLaTeX (+ bibtex when citations exist) |
| `/extract-tikz [file]` | TikZ → standalone PDF (HTML/SVG export unused here) |
| `/new-diagram [snippet] [output.tex]` | Scaffold a TikZ diagram from the gallery with prevention + review |
| `/proofread [file]` | Grammar/typo/overflow review (한국어 본문 적용 가능) |
| `/visual-audit [file]` | Slide layout audit (overflow, font, box fatigue) |
| `/pedagogy-review [file]` | Narrative, notation, pacing review |
| `/slide-excellence [file]` | Combined multi-agent review (visual + pedagogy + proofread) |
| `/validate-bib` | Cross-reference citations with `Bibliography_base.bib` |
| `/devils-advocate` | Adversarial 5–7 question challenge to design choices |
| `/create-lecture` | Pre-Flight → draft → review pipeline (also fits a proposal section) |
| `/commit [msg]` | Stage, commit, PR, merge (with quality-score gate) |
| `/lit-review [topic]` | Literature search + synthesis (BibTeX-ready) |
| `/research-ideation [topic]` | Generate research questions + strategies |
| `/interview-me [topic]` | Interactive research-idea formalisation |
| `/review-paper [file]` | Manuscript review — single-pass / `--adversarial` / `--peer <journal>` |
| `/learn [skill-name]` | Extract a discovery into a persistent skill |
| `/context-status` | Show session health + context usage |
| `/deep-audit` | Repository-wide consistency audit |
| `/permission-check` | Diagnose permission layers when prompts fire unexpectedly |
| `/seven-pass-review` | Seven-pass adversarial manuscript review (parallel forked subagents) |
| `/verify-claims [file]` | Chain-of-Verification fact-check (forked verifier, fresh context) |
| `/checkpoint [topic]` | Save a structured state snapshot before stopping or handing off |
| `/preregister [--style osf\|aspredicted\|aea-rct]` | Draft a pre-registration document |

> **Removed:** `/translate-to-quarto`, `/qa-quarto`, `/deploy`, `/data-analysis`, `/review-r`, `/audit-reproducibility`, `/respond-to-referees`. Re-import from the upstream template if those stages are reintroduced.

---

## Beamer Custom Environments

| Environment | Effect | Use Case |
| --- | --- | --- |
| (to be filled) | | |

> Add custom Beamer environments here once the proposal's visual conventions are decided. The default palette + theme assignments live in `Preambles/header.tex`.

---

## Current Project State

| File | Beamer | Notes |
| --- | --- | --- |
| HelloWorld | `Slides/HelloWorld.tex` | 한글 (KoPubWorld Dotum) 렌더링 검증용 — 설정 점검이 끝나면 본 프로포절 파일로 대체 |
| Proposal_AIWTPGap *(예정)* | `Slides/Proposal_AIWTPGap.tex` | 본 프로포절 골격 — 다음 세션에서 작성 |
