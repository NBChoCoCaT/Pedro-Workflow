# Plan: 03_AIWTPGap 워크플로우 설정 적응

**Date:** 2026-05-23
**Status:** DRAFT
**Scope:** 설정 적응만. 프로포절 본문 작성은 별도 세션.
**Author:** Claude (workflow contractor) — 사용자 검토 대기

---

## Context

이 레포는 `pedrohcgs/claude-code-my-workflow` 템플릿을 fork한 것으로, **(1) 계량경제학 강의 슬라이드, (2) R 분석 스크립트 + 재현성 감사, (3) Beamer ↔ Quarto 듀얼 렌더링**이라는 세 가지 사용 사례를 동시에 가정한 인프라가 들어 있다. 그런데 본 프로젝트(`03_AIWTPGap`)는:

- **단일 산출물**: 한국어 Beamer/PDF 프로포절
- **현 단계는 디자인·이론 단계** — R/Stata 분석 코드 없음
- **Quarto/HTML 미러 사용 안 함** — 발표 PDF만 필요

따라서 현재 설정의 약 40 %는 본 프로젝트와 무관하거나, 무관함을 넘어 **잘못된 규칙을 발동시킬 위험**까지 있다. 예: `beamer-quarto-sync.md`는 Beamer를 편집할 때마다 존재하지 않는 `.qmd` 동기화를 요구하고, `INV-1`(팔레트 sync)은 삭제될 SCSS 변수와의 패리티를 강제한다.

본 계획의 목표는:
1. 본 프로젝트에 **무관한 인프라**(R/Stata · Quarto · 강의 워크플로우)를 깨끗하게 제거
2. **한국어 LaTeX 환경** (KoPub Dotum + xeCJK) 정착
3. **실험경제학 프로포절** 도메인에 맞춰 규칙·CLAUDE.md·지식 베이스 시작값 정비
4. **한국어 작업 언어 정책** 명문화 (한글 본문, 전문용어 영문 유지)

이번 세션은 위 4가지로 마무리한다. 프로포절 골격(섹션·TikZ·문헌)은 다음 세션에서 별도 계획으로 시작.

---

## Requirements Specification

### MUST (사용자 확정)

- [ ] Beamer XeLaTeX 환경에서 한글 본문이 깨끗하게 렌더링된다 (KoPub Dotum, 본문+제목 동일).
- [ ] R/Stata 관련 설정 파일·스크립트·규칙·skill·agent를 **완전 제거**한다.
- [ ] Quarto/HTML 렌더링 인프라(디렉터리, scss, sync 스크립트, beamer-quarto-sync 규칙 포함)를 **완전 제거**한다.
- [ ] CLAUDE.md의 모든 `[YOUR ...]` 플레이스홀더가 본 프로젝트 정보로 채워진다 (단, 저자명·소속 등 식별 정보는 플레이스홀더 유지).
- [ ] 모든 계획/세션 로그/프로포절 초안이 **한국어**로 작성된다 (WTP, WTA, BDM, SPA, induced value, homegrown value 등 전문용어는 영문 유지).
- [ ] 본 계획 실행 후 `Slides/HelloWorld.tex` (한국어 본문 1슬라이드 포함)로 `xelatex`이 에러 없이 PDF를 생성한다.

### SHOULD

- [ ] `.claude/rules/knowledge-base-template.md`에 본 프로젝트 도메인의 시작값(WTP, WTA, BDM, SPA 같은 표기) 일부가 미리 채워져 있어, 다음 세션에서 참조 가능하다.
- [ ] 새 규칙 `.claude/rules/korean-language-convention.md`가 한·영 혼용·로깅 언어 정책을 명시한다.
- [ ] `Bibliography_base.bib`의 예제 엔트리는 제거하되, 파일 자체는 빈 템플릿으로 유지한다.
- [ ] `Quality 임계치 (80/90/95)`는 그대로 둔다 (사용자가 명시적으로 변경 요청한 적 없음).

### MAY

- [ ] CHANGELOG·README·TROUBLESHOOTING의 템플릿 작자 인용 부분은 손대지 않는다 (사용자 작업에 영향 없음, 별도 세션에서 정리).
- [ ] 프로포절 골격(`Slides/Proposal_AIWTPGap.tex`)은 본 세션에서 만들지 않는다.

### Clarity Status

| 항목 | 상태 | 비고 |
|------|------|------|
| 한글 폰트 | CLEAR | KoPub Dotum 본문+제목 동일 |
| Quarto 인프라 제거 범위 | CLEAR | `Quarto/`, `theme-template.scss`, `sync_to_docs.sh`, `check-palette-sync.*`, beamer-quarto-sync 규칙, Quarto skill·agent 전부 |
| R/Stata 인프라 제거 범위 | CLEAR | `scripts/R/`, `r-code-conventions.md`, `replication-protocol.md`, `orchestrator-research.md`, r-reviewer·data-analysis·audit-reproducibility·review-r·respond-to-referees skill/agent 처리 |
| `respond-to-referees` 스킬 보존 여부 | ASSUMED | 현 단계에서 무관 → **제거**. 논문 단계 진입 시 template repo에서 재가져오기. |
| `preregister` 스킬 보존 여부 | ASSUMED | 실험경제학 사전등록(AsPredicted/AEA RCT)은 본 프로젝트와 직접 관련 → **보존**. |
| `interview-me`, `research-ideation`, `lit-review` 스킬 | ASSUMED | 디자인 단계에 유용 → **보존**. |
| 저자/소속/제목 | CLEAR | 플레이스홀더 유지 |
| HelloWorld 처리 | ASSUMED | 한국어 1슬라이드 샘플로 **개조** (완전 삭제 대신) → 한글 폰트 동작 검증용 |

---

## 변경 계획 (실행 순서)

### Phase 0. 세션 로그 시작

- [ ] `quality_reports/session_logs/2026-05-23_workflow-config-adaptation.md` 생성 (한국어, `templates/session-log.md` 기반).

### Phase 1. 제거 — R/Stata 인프라

**Rules** (`.claude/rules/`):
- `r-code-conventions.md`
- `replication-protocol.md`
- `orchestrator-research.md`

**Skills** (`.claude/skills/`):
- `data-analysis/`
- `review-r/`
- `audit-reproducibility/`
- `respond-to-referees/` (논문 R&R 단계용 — 현 단계 무관)

**Agents** (`.claude/agents/`):
- `r-reviewer.md`

**스크립트/디렉터리**:
- `scripts/R/` 전체

**감사 보조**:
- `.claude/rules/cross-artifact-review.md`는 R 스크립트 의존성 그래프 기반이지만, 패턴 기반 자동 발동이고 `\input{scripts/...}`가 없으면 작동하지 않음 → **보존**. 단, `review-paper` skill 자체는 보존 (별도 평가).

### Phase 2. 제거 — Quarto/HTML 인프라

**Rules** (`.claude/rules/`):
- `beamer-quarto-sync.md`

**Skills** (`.claude/skills/`):
- `translate-to-quarto/`
- `qa-quarto/`
- `deploy/`

**Agents** (`.claude/agents/`):
- `quarto-critic.md`
- `quarto-fixer.md`
- `beamer-translator.md`

**디렉터리/파일**:
- `Quarto/` (전체 — `HelloWorld.qmd`, `theme-template.scss`)
- `docs/` (전체 — GitHub Pages 대상, Quarto 산출물 미러)
- `scripts/sync_to_docs.sh`
- `scripts/check-palette-sync.sh`
- `scripts/check-palette-sync.py`

**`Preambles/header.tex`의 PALETTE CONTRACT 주석**:
- "must match Quarto/theme-template.scss" 문구 제거. 색상 정의 자체는 보존 (Beamer/TikZ에서 계속 사용).

**`Preambles/README.md`**:
- 팔레트 컨트랙트·`check-palette-sync` 섹션 삭제.

### Phase 3. 수정 — 남은 규칙 정리

- **`.claude/rules/content-invariants.md`**:
  - INV-1 (팔레트 sync) → 삭제 (SCSS 제거 후 무의미)
  - INV-2 (Beamer↔Quarto 노테이션 패리티) → 삭제
  - INV-3 (Quarto CSS 오버라이드) → 삭제
  - INV-4 (TikZ as SVG) → 삭제 (HTML 미러 없음, Beamer는 PDF inline TikZ 사용)
  - INV-5 (Single bibliography) → 보존 (Beamer만 써도 유효)
  - INV-6 (No `\pause`) → 보존
  - INV-7 (Max 2 colored boxes) → 보존
  - INV-8 (Motivation before formalism) → 보존
  - INV-9~12 (R 스크립트) → 삭제
  - 결과: INV-5~8만 남기되 INV-1~4 자리에 한국어·메타·문헌 관련 새 invariant 후보 추가 (예: INV-1 = "한글 본문, 영문 전문용어 유지"; INV-2 = "참고문헌은 `Bibliography_base.bib` 단일 파일").
- **`.claude/rules/single-source-of-truth.md`**:
  - TikZ freshness 절차는 `extract_tikz.tex` → SVG → Quarto 경로를 가정. Quarto 제거 후 무의미 → **TikZ 섹션 단순화**: "Beamer 파일이 TikZ의 단일 진실. 별도 추출 단계 없음".
  - Environment parity / Content fidelity 체크리스트의 Quarto 항목 제거.
- **`.claude/rules/verification-protocol.md`**:
  - Quarto/HTML 섹션 삭제
  - R 스크립트 섹션 삭제
  - TikZ 섹션의 "SVG 변환" 부분 삭제 → Beamer 인라인 TikZ만 다룸
  - Beamer 컴파일 검증만 남김
- **`.claude/rules/pdf-processing.md`**:
  - `master_supporting_docs/` 대상 (논문 PDF 처리). 보존 — 참고 문헌 PDF 다룰 때 유용.
- **`.claude/rules/proofreading-protocol.md`**:
  - 그대로 유지. 한국어 본문에도 적용 가능 (문법·오타·일관성).
- **`.claude/rules/tikz-*.md` (3개 파일)**:
  - 그대로 보존. TikZ는 Beamer에서 실험 설계 다이어그램에 활용.
- **`.claude/rules/exploration-*.md`** (2개):
  - 보존. 디자인 탐색 단계에 유용.
- **`.claude/rules/quality-gates.md`**:
  - Quarto Slides (.qmd) 표 삭제
  - R Scripts (.R) 표 삭제
  - Beamer Slides (.tex) 표만 보존
  - "Tolerance Thresholds (Research)" 표 삭제 (분석 단계 진입 시 복구)
- **`.claude/rules/orchestrator-protocol.md`**:
  - 표에서 R/Quarto 스킬 행 제거 (`/data-analysis`, `/qa-quarto`, `/review-paper --peer`의 cross-artifact 부분 등 조정).
- **`.claude/rules/cross-artifact-review.md`**:
  - 보존 (논문 단계 진입 시 유용)
- **`.claude/rules/knowledge-base-template.md`**:
  - 실험경제학 시작값 일부 채움 (다음 세션 작업에서 본격 확장).

### Phase 4. 신규 — 한국어 작업 언어 규칙

새 파일: `.claude/rules/korean-language-convention.md`

내용:
- 모든 계획·세션 로그·플랜·프로포절 본문은 한국어로 작성한다.
- 전문 용어는 영문 유지: WTP, WTA, BDM, SPA, induced value, homegrown value, endowment effect, status-quo bias, loss aversion, prospect theory, reference-dependent preference, second-price auction, Becker–DeGroot–Marschak 등.
- LaTeX 본문에서 영문 약어는 그대로 사용 (예: "BDM 매커니즘에서 ...").
- 인용/괄호 안 영문 저자명은 영문 유지 (예: "Plott and Zeiler (2005)는 ...").
- 한·영 혼용 시 영문 단어 앞뒤로 자동 공백 처리 (xeCJK 옵션).

### Phase 5. 수정 — Preambles/header.tex (한글 LaTeX 환경)

추가할 내용:
```latex
% Korean (XeLaTeX + xeCJK + fontspec)
\usepackage{xeCJK}
\setCJKmainfont[BoldFont={KoPub Dotum Bold}]{KoPub Dotum Medium}
\setCJKsansfont[BoldFont={KoPub Dotum Bold}]{KoPub Dotum Medium}
\setCJKmonofont{KoPub Dotum Light}
\xeCJKsetup{%
  CJKspace=true,           % 한·영 혼용 시 자동 공백
  AutoFakeSlant=0.15,      % 이탤릭 fallback
  CJKecglue={\hskip 0.2em plus 0.05em minus 0.05em} % CJK-라틴 간격
}
\linespread{1.15}          % 한글 가독성 향상
```

영문 본문 fontspec은 그대로 두되, 명시적으로 Latin Modern 또는 시스템 sans 지정. 한글이 없는 슬라이드도 호환되도록.

폰트 확인 절차:
- 컴파일 시 `Font 'KoPub Dotum Medium' not found` 오류가 나면 사용자에게 폰트 설치 안내 (macOS: KoPub 공식 사이트에서 .ttf 다운로드 → Font Book 설치).

### Phase 6. 수정 — `Slides/HelloWorld.tex`

기존 영문 Madrid 테마 샘플을 **한국어 KoPub 폰트 동작 검증용**으로 교체:
- 본문 한 슬라이드: "안녕하세요. 03_AIWTPGap 프로포절 작업환경입니다."
- 두 번째 슬라이드: 영문 전문용어 혼용 예시 ("WTP와 WTA의 차이는 ...")
- `\input{header}` 호출로 본 프로젝트 preamble 사용
- 인용 예제는 제거 (Bibliography 비워질 예정).

### Phase 7. 수정 — `Bibliography_base.bib`

기존 예제 엔트리(`Example2024_book`, `Example2025_article`) 삭제. 헤더 주석만 남김.

### Phase 8. 수정 — CLAUDE.md

플레이스홀더 채우기:
- `[YOUR PROJECT NAME]` → `03_AIWTPGap — AI-assisted Information Provision and the WTP–WTA Gap`
- `[YOUR INSTITUTION]` → 플레이스홀더 유지 (`[YOUR INSTITUTION]`)
- Branch: `main`

폴더 구조 표에서 `Quarto/`, `docs/`, `scripts/R/` 제거.

Commands 섹션:
- LaTeX 명령(3-pass xelatex)만 남기기
- "Deploy Quarto to GitHub Pages" 행 삭제
- "Quality score" 행 보존
- "Palette sync" 행 삭제
- "Surface-count sync" 행 보존 (CLAUDE.md ↔ README 정합성용 — 단, 본 작업에서 surface 수가 변할 가능성 있어 다음 작업에서 확인)

Skills Quick Reference 표:
- 삭제 대상 스킬(13개) 행 제거: `/translate-to-quarto`, `/qa-quarto`, `/deploy`, `/data-analysis`, `/review-r`, `/audit-reproducibility`, `/respond-to-referees` 등
- 보존: `/compile-latex`, `/extract-tikz`, `/new-diagram`, `/proofread`, `/visual-audit`, `/pedagogy-review`, `/slide-excellence`, `/validate-bib`, `/devils-advocate`, `/create-lecture`, `/commit`, `/lit-review`, `/research-ideation`, `/interview-me`, `/review-paper`, `/learn`, `/context-status`, `/deep-audit`, `/permission-check`, `/seven-pass-review`, `/verify-claims`, `/checkpoint`, `/preregister`

Beamer 환경 표·Quarto CSS 클래스 표:
- 본 프로젝트 도메인에 맞춰 향후 채울 예정이라는 주석 남기기 (실제 항목은 다음 세션).

Current Project State 표:
- HelloWorld 행만 남기되, 한국어 동작 검증용임을 명시.

### Phase 9. 수정 — `.claude/WORKFLOW_QUICK_REF.md`

Non-Negotiables 섹션:
- [LEARN:files] 패턴에 맞춰 본 프로젝트 비협상 항목:
  - LaTeX 컴파일: XeLaTeX + 3-pass (kotex 호환)
  - 모든 경로는 레포 root 기준 상대경로
  - 한글 본문, 영문 전문용어 (WTP, WTA, BDM, SPA 등)
  - 계획·로그·드래프트 모두 한국어
  - 색상은 `Preambles/header.tex` 팔레트만 사용
- Preferences 섹션:
  - **Visual:** 발표용 슬라이드, 16:9, KoPub Dotum, 본문 30 pt 권장
  - **Reporting:** 간결한 한국어 불릿 + 핵심 결정만 강조
  - **Session logs:** post-plan / incremental / end-of-session 3회
  - **Replication:** 본 단계는 분석 없음 (Phase 2/3 진입 시 재정의)

### Phase 10. 수정 — `MEMORY.md`

기존 템플릿 작자의 [LEARN] 엔트리는 보존 (제네릭한 워크플로우 지식 — 다른 forker에게도 유용했던 것이라 제거하면 손해). 다만 다음을 본 세션의 [LEARN] 엔트리로 추가:
- `[LEARN:project]` 03_AIWTPGap 도메인: WTP–WTA 갭, AI 정보 제공, induced/homegrown 듀얼 디자인, BDM/SPA 메커니즘.
- `[LEARN:workflow]` 한국어 작업 언어 정책 (한글 본문, 영문 전문용어, 한국어 계획·로그·드래프트).
- `[LEARN:files]` 본 프로젝트는 단일 Beamer 산출물 — Quarto·R 인프라 제거됨.

### Phase 11. 검증

- [ ] `cd Slides && TEXINPUTS=../Preambles:$TEXINPUTS xelatex -interaction=nonstopmode HelloWorld.tex` 가 에러 없이 PDF 생성한다.
- [ ] 생성된 PDF에서 한글이 KoPub Dotum으로 표시된다 (`open Slides/HelloWorld.pdf` 후 시각 확인).
- [ ] `.claude/rules/`에서 제거 대상 4개 파일이 모두 없다.
- [ ] `.claude/skills/`에서 제거 대상 디렉터리가 모두 없다.
- [ ] `Quarto/`, `docs/`, `scripts/R/`, `scripts/sync_to_docs.sh`, `scripts/check-palette-sync.*` 가 모두 없다.
- [ ] `CLAUDE.md`의 모든 `[YOUR ...]` 플레이스홀더가 본 프로젝트 정보로 치환되거나 의도적으로 유지된 식별 정보만 남는다.
- [ ] `.claude/rules/korean-language-convention.md` 가 존재하고 정책이 명시되어 있다.
- [ ] `quality_reports/session_logs/2026-05-23_workflow-config-adaptation.md` 가 작성되어 있고 변경 내역을 기록한다.

### Phase 12. 보고

사용자에게 한국어로 작업 완료 요약 전달:
- 제거된 인프라 카운트 (파일 수, 디렉터리 수)
- 추가된 한국어 설정 위치
- HelloWorld 컴파일 검증 결과
- 다음 세션 권장 작업 (프로포절 골격 구조, 섹션 목차, 핵심 문헌 수집 등).

---

## 핵심 수정 파일 목록

**수정**:
- `CLAUDE.md`
- `.claude/WORKFLOW_QUICK_REF.md`
- `.claude/rules/content-invariants.md`
- `.claude/rules/single-source-of-truth.md`
- `.claude/rules/verification-protocol.md`
- `.claude/rules/quality-gates.md`
- `.claude/rules/orchestrator-protocol.md`
- `.claude/rules/knowledge-base-template.md`
- `Preambles/header.tex`
- `Preambles/README.md`
- `Slides/HelloWorld.tex`
- `Bibliography_base.bib`
- `MEMORY.md`

**신규**:
- `.claude/rules/korean-language-convention.md`
- `quality_reports/session_logs/2026-05-23_workflow-config-adaptation.md`
- `quality_reports/plans/2026-05-23_workflow-config-adaptation.md` (이 파일의 정식 사본 — plan approval 후 복사)

**삭제 (디렉터리)**:
- `Quarto/`
- `docs/`
- `scripts/R/`
- `.claude/skills/data-analysis/`
- `.claude/skills/review-r/`
- `.claude/skills/audit-reproducibility/`
- `.claude/skills/respond-to-referees/`
- `.claude/skills/translate-to-quarto/`
- `.claude/skills/qa-quarto/`
- `.claude/skills/deploy/`

**삭제 (파일)**:
- `.claude/rules/r-code-conventions.md`
- `.claude/rules/replication-protocol.md`
- `.claude/rules/orchestrator-research.md`
- `.claude/rules/beamer-quarto-sync.md`
- `.claude/agents/r-reviewer.md`
- `.claude/agents/quarto-critic.md`
- `.claude/agents/quarto-fixer.md`
- `.claude/agents/beamer-translator.md`
- `scripts/sync_to_docs.sh`
- `scripts/check-palette-sync.sh`
- `scripts/check-palette-sync.py`

---

## 위험 요소 & 완화

1. **KoPub Dotum 폰트가 시스템에 설치되어 있지 않을 가능성**
   - 완화: 컴파일 실패 시 사용자에게 명시적으로 안내. 임시 fallback으로 `\IfFontExistsTF` 패턴 사용 검토 (Pretendard 또는 Apple SD Gothic Neo).
2. **삭제 대상이 다른 보존 파일에 참조되어 있을 가능성**
   - 완화: 삭제 전 `grep -r "translate-to-quarto\|qa-quarto\|sync_to_docs\|theme-template.scss"` 등으로 의존성 검사. 잔존 참조는 같은 phase에서 제거.
3. **`scripts/check-skill-integrity.py`, `scripts/check-surface-sync.py` 가 skill 카운트 등을 강제 검증** 할 수 있음.
   - 완화: 본 작업 후 두 스크립트 실행해 surface count 정합성 확인. 불일치 시 README/CLAUDE.md/guide의 카운트 표현을 함께 갱신.
4. **MEMORY.md의 [LEARN] 엔트리들이 삭제된 인프라(Quarto, R)를 언급**
   - 완화: 본 작업에서 굳이 정리하지 않음 (제네릭 학습은 다른 forker에게 가치 있음). 단, `[LEARN:project]` 엔트리에 본 프로젝트는 그 인프라를 제거했음을 명시.
5. **CHANGELOG·README·TROUBLESHOOTING은 템플릿 fork 시점의 문서**
   - 본 작업 scope 밖. 다음 세션 또는 별도 작업에서 본 프로젝트 정보로 갈음할지 결정.

---

## 다음 세션 (참고)

본 plan 실행 완료 후 권장 다음 작업:
1. 프로포절 구조 설계: 섹션 목차, 핵심 메시지 1줄 요약, 4–6 챕터 골격 (Introduction → WTP–WTA gap 문헌 → AI 정보 제공의 새로움 → Dual design (induced vs homegrown) → Hypotheses → Identification & power → Implementation & timeline).
2. 핵심 참고문헌 수집: `lit-review` skill 활용. Plott–Zeiler 시리즈, Kahneman–Knetsch–Thaler 1990, Horowitz–McConnell 2002, Tunçel–Hammitt 2014, 최신 LLM·info-provision 실험 연구.
3. 실험 설계 다이어그램 1–2 점 TikZ로 스케치.
4. 가설을 OSF/AsPredicted 양식으로 사전등록 초안 (`/preregister`).
