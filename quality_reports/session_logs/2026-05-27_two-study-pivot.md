# 세션 로그: 2026-05-27 — 명세서 v2 (Two-Study Cross-Calibration) 작성

**상태:** COMPLETED (본 세션 산출)

## 목표

2026-05-26 세션의 명세서 v1(WTP-WTA 갭 + K-R 5-channel framing)을 14편 1차 자료 정독·재검색·재평가 결과를 반영하여 *Story B (Two-study unified + cross-calibration)* 로 전면 재작성.

## 핵심 컨텍스트

본 세션은 두 단계의 *재평가*를 거쳤다:

1. **첫 번째 재평가**: 14편 정독 후 (Plott-Zeiler, K-R 진영 7편, Choi, Canavari, Corrigan, Cherry, Zhao-Kling, Jacquemet, Shogren, List, Lee-Fox, Lee, Fox) — 5-channel identification framework 도출, 가장 직접 선행연구 Choi 2018 식별.

2. **두 번째 재평가**: post-Heffetz-List 2014 top journal 검색 + 실험경제 한정 + 인용수 우선 → Campos-Mercade et al. 2026 RES (이질성 통제 권고) 발견. 본 연구의 *적절한 선행연구* 재검토 → Tier 1/2/3로 재정렬.

3. **결정적 pivot**: 사용자가 induced와 homegrown의 *서로 다른 연구 목적*을 명확히 지적 → "두 value 타입이 별개 학문 대화에 속함"이 명확해짐. Story A·B·C 비교 후 **Two-Study Unified Proposal + Cross-Calibration (Option C)** 결정.

## 사용자 의사 결정 (2026-05-27)

| 결정 | 선택 | 근거 |
|---|---|---|
| 이론 프레임 | Story B (valuation accuracy/shift) | K-R 단일 framing의 위험 회피 + Choi 2018 정합 |
| 디자인 구조 | Two-Study Unified + Cross-Calibration | Induced·homegrown 별개 학문 대화 인정 |
| Cross-calibration 모델 | Fox 1998 CVM-X의 AI 버전 | 학술적 novelty 핵심 |
| K-R framing | 후속 연구로 보존 | 본 연구 성공 시 확장 |
| Sample size | 명세서에서 분리 | 사용자 명시적 표명 — 디자인 우선 |

## 산출물

| 파일 | 종류 |
|---|---|
| `quality_reports/specs/research_spec_aiwtp_gap.md` v2 | Spec 전면 재작성 |
| `quality_reports/decisions/2026-05-27_two-study-cross-calibration.md` | ADR-005 (이론 프레임 pivot) |
| `quality_reports/lit_review_aiwtp_gap.md` | (이전 작성, 본 세션에 활용) |
| `quality_reports/lit_review_kr_post2014.md` | (본 세션 추가, 인용수 보강) |
| `quality_reports/session_logs/2026-05-27_two-study-pivot.md` | 본 세션 로그 |

## 디자인 결정 요약 (명세서 v2 핵심)

### Study 1 — Induced Value Branch
- 4 arms: control / AI agree / AI low / AI high
- Outcome: \|bid − V_induced\|
- 식별: demand effect (arm 2), anchoring (arm 3·4), loss aversion (asymmetry)
- 직접 전신: Lee et al. (2020 AJAE)

### Study 2 — Homegrown Value Branch
- 2 main arms: label only / AI info (+ 2 optional: human source / AI placebo)
- Outcome: WTP shift, 분포 변화
- 식별: 정보 갱신 / outside option / source effect
- 직접 전신: Choi et al. (2018 CJAE)

### Cross-Calibration
- Decomposition: θ_info = θ_total − δ_demand − δ_anchor
- 핵심 가정: 양 study의 AI source effect 동일성 (동일 LLM·prompt·매체로 강제)
- 모델: Fox et al. (1998 AJAE) CVM-X 라인의 AI 버전

## v1 → v2 주요 변경 사항

| 영역 | v1 (2026-05-26) | v2 (2026-05-27) |
|---|---|---|
| **이론 프레임** | K-R 5-channel | Two-study + cross-calibration |
| **Primary outcome** | WTA − WTP gap | Study 1: \|bid−V_induced\|; Study 2: WTP shift |
| **Cell 구조** | 8 cells (2×2×2) | 4 arms × 2 studies (별도) |
| **K-R 진영 인용** | Tier 1 (load-bearing) | Demoted to Tier 3 (배경) |
| **Choi 2018** | "가장 직접적 선행" | Study 2의 정식 모델 |
| **Lee 2020** | 보조 control | Study 1의 정식 모델 |
| **Fox 1998 CVM-X** | 인용만 | **Cross-calibration의 모델 (Tier 1)** |
| **Open Questions** | 11개 | 9개 (K-R 6개 해소) |

## 디자인 결정의 *진짜 통찰*

본 세션의 핵심 발견:

1. **Induced vs homegrown은 *연구 도구가 아닌 연구 목적*에서 갈린다**. 둘을 합쳐서 "induced × homegrown × {AI info}" 8-cell로 짜면 두 학문 대화를 *흐리는* 디자인. 이를 v1의 가장 큰 약점으로 인식.

2. **Cross-calibration이 본 proposal의 *진짜 novelty***. 단순 "AI × WTP-WTA"는 학술적 진보가 모호하나, *induced lab으로 homegrown lab을 calibrate*하는 logic은 Fox 1998 CVM-X 라인의 21세기 AI 버전이라는 *방법론적 컨트리뷰션*.

3. **K-R 논쟁은 한국 lab 단일 연구가 결착시키기 어렵다**. Top 거장들의 영역. *후속 연구*로 보존하는 게 현실적.

4. **Sample size를 spec에서 분리하는 게 맞다**. 사용자 명시적 지적대로 — 디자인 결정이 우선, N은 ADR-008에서 별도. 양 study 각각의 power 분석.

## 학습 / 정정

- `[LEARN:design]` Induced와 homegrown은 *별개 학문 도구* — 합쳐서 single design으로 묶으면 두 라인의 학문 대화를 흐림. Two-study로 분리하고 cross-calibrate가 정합적.
- `[LEARN:scope]` Top journal K-R 논쟁은 글로벌 거장 영역 — 한국 lab 단일 연구가 결착시키기 어렵다. 후속 연구로 보존.
- `[LEARN:method]` Fox 1998 CVM-X = lab으로 hypothetical calibrate. 본 연구 cross-calibration = induced로 homegrown의 confound calibrate. 30년 전 logic의 *AI 버전*이 본 proposal의 진짜 novelty.

## 검증

- v2 명세서 모든 인용은 2026-05-26/27 CoVe 라운드에서 검증 완료
- ADR-005가 spec의 Cross-references 섹션과 정합
- ADR-001/002/003은 유지 (변경 없음 — 본 디자인과 정합)

## 다음 세션 (권장)

1. **ADR-006** (Study 1 induced value 객체 결정) — token 종류·V_induced 분포·Δ 크기
2. **ADR-007** (Study 2 homegrown 객체 결정) — 한국 쌀 vs 환경재 vs 기프티콘
3. **AI 메시지 prototype 작성** — 양 study에서 공유할 prompt 구조 + sample messages
4. **프로포절 골격 (4–6장)** 설계 — v2 spec의 §섹션들을 Beamer slide 구조로 매핑
5. (선택) **ADR-008** sample size + **ADR-009** pre-registration timing

## 열린 결정 / 블로커

- [ ] Q1 (Study 1 token), Q2 (Study 2 homegrown), Q3 (AI 메시지), Q4 (Δ 크기): 모두 BLOCKED
- [ ] 저자명·소속: 프로포절 골격 작성 시 일괄 입력 (CLAUDE.md `[YOUR INSTITUTION]` 플레이스홀더 유지 중)
- [ ] IRB 신청 시점: 디자인 확정 후
- [ ] 본 세션 산출물 (v2 spec + ADR-005 + 본 로그) git commit 여부: 사용자 결정 필요
