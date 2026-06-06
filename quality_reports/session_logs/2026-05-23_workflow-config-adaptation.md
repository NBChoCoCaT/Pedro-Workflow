# 세션 로그: 2026-05-23 — 워크플로우 설정 적응

**상태:** COMPLETED

## 목표

`pedrohcgs/claude-code-my-workflow` 템플릿(강의 슬라이드 + R 분석 + Beamer↔Quarto 듀얼)을 본 프로젝트 `03_AIWTPGap`(한국어 Beamer 단일 프로포절, 디자인·이론 단계)에 맞춰 슬림화하고, 한국어 LaTeX 환경(KoPub Dotum)을 정착시킨다.

## 핵심 컨텍스트

- 본 프로젝트는 **AI 정보 제공이 WTP–WTA 갭에 미치는 영향**을 측정하는 실험경제학 프로포절. 듀얼 디자인: induced value 옥션 + homegrown value 옥션. BDM·SPA 메커니즘 사용.
- 현 단계는 디자인·이론 단계 → R/Stata 코드 없음.
- 산출물: 한국어 Beamer PDF 1종. Quarto/HTML 미러 사용하지 않음.
- 작업 언어 정책: 한국어 본문 + 영문 전문용어(WTP, WTA, BDM, SPA, induced value, homegrown value 등).

## 사용자 의사 결정 (2026-05-23 명세 단계)

| 결정 | 선택 | 근거 |
|---|---|---|
| 한글 폰트 | KoPub Dotum (본문+제목 동일) | 한국 학술·공공기관용 표준, 일관성 |
| Quarto 미러 | 안 만듦 | 단일 산출물 = PDF |
| R/Stata 인프라 | 완전 제거 | 분석 단계 아님 |
| Beamer 메타데이터 | 플레이스홀더 유지 | 식별 정보 별도 입력 |
| 작업 범위 | 설정 적응만 (프로포절 골격은 다음 세션) | 단계별 진행, 결정 부담 분산 |

## 승인된 계획

`quality_reports/plans/velvety-dancing-meerkat.md` (실행 후 `2026-05-23_workflow-config-adaptation.md`로 사본).

## 변경 사항

| 영역 | 변경 | 사유 |
|------|------|------|
| **삭제** R/Stata 인프라 | rules 3개, skills 4개 (data-analysis, review-r, audit-reproducibility, respond-to-referees), agent 1개 (r-reviewer), scripts/R/ 전체 | 본 프로젝트는 디자인·이론 단계 — 분석 코드 없음 |
| **삭제** Quarto 인프라 | rule 1개 (beamer-quarto-sync), skills 3개 (translate-to-quarto, qa-quarto, deploy), agents 3개 (quarto-critic, quarto-fixer, beamer-translator), Quarto/, docs/, sync_to_docs.sh, check-palette-sync.* | 단일 산출물(Beamer PDF), HTML 미러 불필요 |
| **수정** content-invariants.md | INV-1~12 → INV-1~5로 재구성 (Korean body, single bib, no `\pause`, ≤2 boxes, motivation first) | Quarto·R 관련 invariant 제거, Korean body 규칙 신설 |
| **수정** single-source-of-truth.md | Beamer-only로 단순화, Quarto/SVG 추출 체인 제거 | Quarto 미러 없음 |
| **수정** verification-protocol.md | Beamer compile만 다루도록 단순화 | 검증 대상이 Beamer PDF뿐 |
| **수정** quality-gates.md | Beamer 루브릭만 보존, Quarto·R·tolerance 표 제거 | 채점 대상이 Beamer뿐 |
| **수정** orchestrator-protocol.md | 표에서 `/qa-quarto`, `/data-analysis` 행 제거 | 해당 skills 삭제됨 |
| **수정** verifier.md (agent) | Beamer + 인라인 TikZ + bib만 검증, Quarto/R/SVG 절차 제거 | 본 프로젝트 검증 범위 축소 |
| **수정** validate-setup.sh | Quarto·R 체크 제거, KoPubWorld Dotum 폰트 검사 추가, palette-sync 호출 제거 | 본 프로젝트 의존성 축소 |
| **수정** Preambles/header.tex | xeCJK + KoPubWorld Dotum (PostScript name 기반) 추가, 한·영 자동 공백, 1.15 line-spread, fallback 폰트 주석 | 한글 본문 렌더링 활성화 |
| **수정** Preambles/README.md | 한글 폰트 설치 가이드, fallback 옵션, palette-sync 섹션 제거 | 본 프로젝트에 맞춤 |
| **수정** knowledge-base-template.md | WTP-WTA, BDM, SPA, induced/homegrown 등 실험경제학 시작값 채움 | 도메인 정착 |
| **수정** Slides/HelloWorld.tex | 한국어 1슬라이드 + 한·영 혼용 예시 + TikZ-수식 렌더링 점검 슬라이드 | 한글 폰트 동작 검증용 |
| **수정** Bibliography_base.bib | 예제 엔트리 제거, 빈 템플릿 + 향후 핵심 문헌 목록 주석 | 다음 세션에서 채울 예정 |
| **수정** CLAUDE.md | 프로젝트명·폴더 구조·명령·Skills 표·현재 상태 표 전면 갱신 | 본 프로젝트 메타데이터 정착 |
| **수정** .claude/WORKFLOW_QUICK_REF.md | 비협상 항목·선호도·언어 정책 본 프로젝트용 | 작업자에게 명확한 가이드 |
| **수정** MEMORY.md | `[LEARN:project]`·`[LEARN:workflow]`·`[LEARN:files]`·`[LEARN:latex]`·`[LEARN:scope]` 5건 추가 | 본 세션 학습 기록 |
| **신규** .claude/rules/korean-language-convention.md | 한·영 작업 언어 정책 명문화 | INV-1 강제 근거 |

## 디자인 결정

| 결정 | 검토한 대안 | 근거 |
|------|------------|------|
| KoPubWorld Dotum 폰트 지정에 **PostScript name** (`KoPubWorldDotumMedium`) 사용 | (a) 파일명 + `Extension=.ttf`, (b) `Path=` 절대 경로, (c) Family name (`KoPubWorld돋움체`) | TinyTeX의 fontspec이 파일명 기반 검색에 실패. PostScript name이 macOS 시스템 등록명과 일치해 가장 robust. 다른 머신에서도 폰트만 설치되면 동일 코드로 동작 |
| Quarto/R 인프라 **완전 제거** (보존 옵션 거절) | (a) 휴면 보존, (b) 별도 디렉터리로 격리 | 사용자 명시적 결정. 다음 분석 단계 진입 시 upstream template (`pedrohcgs/claude-code-my-workflow`)에서 다시 가져오기로 함 |
| `respond-to-referees` skill 제거, `preregister` skill 보존 | 둘 다 논문 단계용 → 둘 다 보존? | preregister는 실험경제학 프로포절의 핵심 산출물 (디자인 단계에서 작성 시작). respond-to-referees는 논문 R&R 단계로 시기상조 |
| Korean working language를 INV-1로 격상 | (a) 권고 사항만 두기, (b) 별도 규칙만 두기 | 본 프로젝트의 모든 산출물 규칙. INV-1에서 강제하면 검토 agents가 자동 점검 |
| 작업 범위를 **설정 적응에만 한정** | 설정 + 프로포절 골격까지 한 세션에 | 사용자 결정. 단계 분리로 의사결정 부담 분산 |

## 점진적 작업 로그

**2026-05-23 시작:** 명세 확정. plan 작성·승인 (14 phase, 14 task). 잔존 참조 grep 실행 — 다수의 보존 파일에 삭제 대상 키워드 참조 존재함을 확인. Phase 3 정리 작업에서 함께 처리.

**Phase 1 완료:** R/Stata 인프라 삭제 (rules 3 + skills 4 + agent 1 + scripts/R/).

**Phase 2 완료:** Quarto/HTML 인프라 삭제 (rule 1 + skills 3 + agents 3 + Quarto/ + docs/ + sync 스크립트 3).

**Phase 3 완료:** content-invariants / SSOT / verification-protocol / quality-gates / orchestrator-protocol / knowledge-base-template / verifier.md(agent) / validate-setup.sh / Preambles/README.md 모두 정리.

**Phase 4 완료:** `.claude/rules/korean-language-convention.md` 신규 작성 (한·영 정책, 영문 유지 용어 화이트리스트, 본문 스타일 가이드).

**Phase 5 1차 컴파일 실패:** fontspec이 `KoPubWorld Dotum Medium.ttf` 파일명을 찾지 못함 (TinyTeX은 macOS user-installed font 디렉터리를 자동 검색하지 않음). luaotfload-tool은 찾았으나 fontspec/xelatex은 별개 메커니즘 사용.

**Phase 5 해결:** PostScript name (`KoPubWorldDotumMedium`)으로 변경 → fontspec이 macOS Core Text 통해 인식. Missing character 경고 0건.

**Phase 6~10 완료:** HelloWorld 한국어 슬라이드, Bibliography 정리, CLAUDE.md/WORKFLOW_QUICK_REF/MEMORY.md 갱신.

**Phase 11 완료:** 3-pass xelatex 통과. PDF 5페이지, 49 KB, Missing character 0, Overfull 0, Underfull 0, Critical error 0.

**Phase 12 완료:** plan 파일 정식명 사본 생성 (`2026-05-23_workflow-config-adaptation.md`).

## 학습 / 정정

본 세션의 학습은 모두 `MEMORY.md`의 "03_AIWTPGap 프로젝트" 섹션에 [LEARN:project], [LEARN:workflow], [LEARN:files], [LEARN:latex], [LEARN:scope] 5건으로 기록됨.

핵심 학습:
- **PostScript name이 fontspec에서 family name보다 robust.** macOS Font Book에 등록된 PostScript name을 그대로 쓰는 게 파일명/family name 검색보다 안정적.
- **Spec-then-plan + 단계 분할이 효과적.** 4개 질문으로 명세 확정 → plan 1회 승인 → 12-Phase 실행.

## 검증 결과

| 검사 | 결과 | 상태 |
|------|------|------|
| `xelatex` 3-pass | exit 0, 5페이지 PDF 생성 | PASS |
| Missing character (한글 누락) | 0건 | PASS |
| Overfull hbox | 0건 | PASS |
| Underfull hbox | 0건 | PASS |
| Critical errors | 없음 | PASS |
| PDF 파일 크기 | 49.9 KB (폰트 임베드 포함) | PASS |
| 삭제 대상 R/Stata 파일 | 전부 제거 확인 | PASS |
| 삭제 대상 Quarto 파일 | 전부 제거 확인 | PASS |
| `.claude/rules/korean-language-convention.md` | 존재, 정책 명시 | PASS |
| CLAUDE.md 플레이스홀더 | `[YOUR INSTITUTION]`만 의도적으로 유지 | PASS |
| 세션 로그 | 본 파일 작성 완료 | PASS |

## 열린 질문 / 블로커

- [ ] **저자명·소속** 입력 시점 — 다음 세션에서 프로포절 골격 작성 시 한 번에 처리.
- [ ] **README.md, CHANGELOG.md, TROUBLESHOOTING.md** — 템플릿 작자의 문서. 다음 세션 또는 별도 작업에서 본 프로젝트 정보로 갈음할지 결정.
- [ ] **`guide/` 디렉터리** — Quarto/R 가이드가 다수 포함. 다음 세션에서 정리 검토.

## 다음 세션 (권장)

1. **프로포절 골격 설계** — 섹션 목차, 1줄 메시지, 4~6장 구조 (Introduction → WTP-WTA gap 문헌 → AI 정보 제공의 novelty → Dual design → Hypotheses → Identification & power → Implementation).
2. **핵심 참고문헌 수집** — `/lit-review`로 Plott–Zeiler, Kahneman–Knetsch–Thaler 1990, Horowitz–McConnell 2002, Tunçel–Hammitt 2014, 최신 LLM·info-provision 실험.
3. **실험 설계 다이어그램 1~2점 TikZ로 스케치** (treatment arm × design 매트릭스 + BDM/SPA 절차 흐름).
4. **사전등록 초안** — `/preregister --style osf` 로 OSF 양식 초안 (가설, 식별 전략, power calc).
