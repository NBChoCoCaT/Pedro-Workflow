# 세션 로그: 2026-05-26 — 연구 명세서 인터뷰 (interview-me)

**상태:** COMPLETED

## 목표

`/interview-me` 스킬을 사용해 03_AIWTPGap 연구의 fuzzy idea를 명세서로 정밀화한다. 프로포절 골격 작성 *전* 단계로, 연구질문·메커니즘·디자인·표본·식별 전략·컨트리뷰션을 결정하거나 *명시적으로 미결*로 두는 작업.

## 핵심 컨텍스트

- 이전 세션(2026-05-23)에서 워크플로우 설정 적응 완료. 본 세션은 그 위에서 "어떤 연구를 할지" 디테일 설정.
- 사용자 본인의 학문 배경: experimental auction methodology + agricultural/environmental/consumer economics (폴더 보유 12편 패턴에서 추론).
- 폴더 보유 선행연구는 실험경매·valuation 메커니즘 중심이며 AI/LLM 관련 0편 — `/lit-review`의 핵심 의제.

## 인터뷰 19 질문 (7 phase)

| Phase | Q | 주제 | 결정 |
|---|---|---|---|
| 1 | Q1 | 핵심 퍼즐 | (a) 갭 크기 + (b) 갭 원천 식별 + 측정오차 채널(앵커링 등) — induced·homegrown 둘 다 |
| 1 | Q2 | 청중 | 소비자정책, 행동경제학 이론가, 실험설계방법론자 |
| 1 | Q3 | Paper type | 미정 → Q6에서 theory+empirics (K-R) 결정 |
| 2 | Q4 | 메커니즘 채널 | 정보 보정 우선; 앵커링·source는 lit review 후 |
| 2 | Q5 | AI 메시지 설계 | 미정 — Open Q5 |
| 2 | Q6 | 이론 프레임 | Reference-dependent (Kőszegi–Rabin) |
| 3 | Q7 | 피험자 풀 | 대학생 lab |
| 3 | Q8 | 재화 선택 | induced·homegrown 둘 다 미정 — lit review 후 |
| 3 | Q9 | AI delivery | 정적 텍스트 (스크린샷·고정 메시지) → ADR-003 |
| 4 | Q10 | between vs within | Pure between-subject → ADR-001 |
| 4 | Q11 | Treatment arms | Full 2×4 (8 cells) — lit review 후 축소 가능 |
| 4 | Q12 | 인과 해석 위협 | (1)(2)(3)(4) 모두 + 앵커링·affiliation·commitment cost |
| 4-보강 | Q13 | 메커니즘 | SPA single → ADR-002 |
| 4-보강 | Q14 | 표본 cap | ~200명/학기 |
| 5 | Q15 | 예상 결과 | 미정·양방향 (갭이 줄 수도 늘 수도) |
| 6 | Q16 | 디자인 축소 | 결정 보류 — lit review에서 benchmark matrix 디자인 검토 후 |
| 6 | Q17 | 컨트리뷰션 | "WTP-WTA 갭 문헌에 AI/LLM 정보 제공을 경제학적 도구로 처음 도입" + reference-dependent 확장 |
| 7 | Q18 | 용도·타임라인 | 지도교수·동료 피드백용 내부 문서 |
| 7 | Q19 | 추가 인용 | 폴더 12편이 전부 (사용자 명시) |

## 주요 식별된 긴장 / 흠

1. **이론 vs 가설 채널의 불일치 (해소됨)**: Plott–Zeiler misconception (Q4 우선 채널)과 Kőszegi–Rabin reference-dependent (Q6 이론 프레임)는 *다른* 갭 설명. → 명세서에서 K-R을 상위 프레임으로, 그 안에서 misconception을 한 채널로 포섭하는 방식으로 통합.

2. **디자인 vs 표본 충돌 (보류, lit review 후 처리)**: pure between-subject + 8 cells + N=200 → 셀당 25명. SPA 세션 단위 clustering 시 유효 N 더 작음. 8 cells에서 interaction effect 검출에 필요한 표본은 셀당 64–130. → ADR-001에 명시, 사용자가 *축소를 거부하지 않았으며 lit review 후 결정*으로 보류.

3. **AI 측 선행연구 부재 (BLOCKED)**: 사용자 보유 선행연구 12편 중 AI/LLM 관련 0편. "AI × WTP-WTA가 처음"이라는 컨트리뷰션 주장은 lit review로 *반드시* 검증되어야 한다.

## 산출물

| 파일 | 종류 |
|---|---|
| `quality_reports/specs/research_spec_aiwtp_gap.md` | Research Specification (skill output) |
| `quality_reports/decisions/2026-05-26_between-subject-design.md` | ADR-001: Pure between-subject |
| `quality_reports/decisions/2026-05-26_spa-single-mechanism.md` | ADR-002: SPA 단일 메커니즘 |
| `quality_reports/decisions/2026-05-26_static-ai-text-delivery.md` | ADR-003: 정적 AI 텍스트 |
| `quality_reports/session_logs/2026-05-26_interview-research-spec.md` | 본 세션 로그 |

## Post-Flight Verification

명세서에 사용된 인용은 (1) `master_supporting_docs/supporting_papers/` 폴더에서 PDF로 직접 확인되는 12편, (2) 매우 확립된 핵심 5편(KKT 1990, K-R 2006, Vickrey 1961, BDM 1964, Horowitz–McConnell 2002)으로 한정. AI/LLM 관련 인용은 모두 `[pending lit review]` 명시 placeholder로 처리 — hallucination risk 최소화.

`/lit-review` 실행 후 추가되는 모든 새 인용에 대해 `claim-verifier` 별도 실행 필요.

## 학습 / 정정

본 세션의 학습은 진행 자체보다 *프로세스*에 대한 메타-인사이트가 중심:

- `[LEARN:workflow]` 인터뷰형 명세화는 "fuzzy idea → 9-10개 핵심 결정 + 6-7개 BLOCKED 항목"으로 깔끔히 분해된다. 7 phase 구조가 효과적.
- `[LEARN:project]` 사용자의 폴더 보유 선행연구는 본인 디자인 결정의 단서가 된다 — Zhao–Kling 2001(commitment cost), Jacquemet 2013(oath), Cherry 2004(outside option), Canavari 2019(running auctions)는 모두 ADR/Open Q와 직접 연결됨.
- `[LEARN:scope]` 사용자가 "lit review 후 결정"이라 명시한 항목은 명세서에 `BLOCKED`로 표기하고 추측하지 말 것. 명세서의 가치는 *결정한 것*과 *결정하지 못한 것*을 명확히 구분하는 데 있다.

## 다음 세션 (권장)

1. **`/lit-review` 두 갈래 병렬 실행**:
   - (a) AI/LLM information provision in economic experiments (2022–2026)
   - (b) WTP–WTA × exogenous information manipulation 전반 (Heffetz–List, Ericson–Fuster, Engelmann–Hollard, List 2003/2004, Tunçel–Hammitt 2014 등 검증 포함)
2. lit review 결과로 (i) "AI×WTP-WTA 최초" 컨트리뷰션 검증, (ii) typical interaction effect size 표 작성 → power 재계산, (iii) 8 cells → 축소 옵션 최종 결정 (ADR-004 작성).
3. 미해결 BLOCKED 6개 (Open Q1–Q5, Q8) 순차 해소.
4. 프로포절 골격 (4–6장) 설계로 이행.

## 열린 결정 / 블로커

- [ ] **Open Q1–Q5, Q8**: 명세서 §Open Questions 참조 (induced/homegrown 객체, 사전등록 시점, treatment cells, AI 메시지, AI×valuation lit gap).
- [ ] **저자명·소속**: 본 명세서는 익명 작성. 프로포절 단계에서 일괄 입력.
- [ ] **2026-05-23 세션의 미커밋 변경분**: working tree에 워크플로우 설정 적응 변경분이 미커밋 상태 — 본 세션 결과와 묶어서 한 번에 커밋할지, 별도 커밋할지 사용자 결정 필요.
