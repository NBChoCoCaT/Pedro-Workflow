---
paths:
  - "Slides/**/*.tex"
---

# Quality Review & Scoring Rubrics

> **Framing:** Thresholds are **advisory at the harness level**. The `/commit` skill runs `quality_score.py` and halts on failure until the user fixes or explicitly overrides. There is no git pre-commit hook that blocks a direct `git commit` — if you bypass the skill, you bypass the review. "Gate" in this file means "checkpoint enforced by a specific skill," not "repo-wide block."

## Thresholds

- **80/100 = Commit** — good enough to save
- **90/100 = PR** — ready for deployment
- **95/100 = Excellence** — aspirational

## Beamer Slides (.tex) — the only scored artifact in this project

| Severity | Issue | Deduction |
|----------|-------|-----------|
| Critical | XeLaTeX compilation failure | -100 |
| Critical | Undefined citation | -15 |
| Critical | Equation overflow / clipping | -20 |
| Critical | Typo in equation | -10 |
| Critical | Overfull hbox > 10pt | -10 |
| Major | Text overflow on a slide | -5 |
| Major | TikZ label overlap | -5 |
| Major | Notation inconsistency across slides | -3 |
| Major | INV violation (INV-1 ~ INV-5) | -5 each |
| Minor | Font size reduction (smaller than declared body) | -1 per slide |
| Minor | Long lines (> 100 chars) | -1 (EXCEPT documented math) |

## Enforcement (by the /commit skill only)

- **Score < 80:** Halt within `/commit`. List blocking issues. User may override with an explicit natural-language signal ("commit anyway" / "skip quality gate") and a reason — the override is logged in the commit body.
- **Score < 90:** Allow commit within `/commit`, warn. List recommendations.
- **Direct `git commit`** (bypassing the skill): no enforcement. For hard enforcement, install a git pre-commit hook that wraps `quality_score.py`.

## Quality Reports

Generated **only at merge time**. Use `templates/quality-report.md` for format. Save to `quality_reports/merges/YYYY-MM-DD_[branch-name].md`.

## Out of scope (currently)

- Quarto (.qmd) rubric, R script (.R) rubric, and tolerance-threshold table for replication numerics are removed. Restore from the template if the project later adopts an analysis or web-mirror stage.
