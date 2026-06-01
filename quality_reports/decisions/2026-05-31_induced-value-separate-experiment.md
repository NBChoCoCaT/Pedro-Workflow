# ADR-011: Induced-Value 분리 실험 — Lottery · AI 3-arm · 인지능력 층화 설계

**Status:** PROPOSED (초안 — 일부 Open Question 미결)
**Date:** 2026-05-31
**Context:** induced와 homegrown의 *실험 목적 차이*에 대한 설계 토론 (선행연구 PZ 2005 / Lee et al. 2020 / Corrigan et al. 2012 / Fox et al. 1998 / List 2001 본문 재검토)
**Extends:** ADR-001 (between-subject) — value-type 축으로 확장
**Partially revives:** ADR-005 (Two-Study Cross-Calibration) — v6에서 archive되었던 induced branch를 분리 실험으로 부활
**Revises:** ADR-010 / v6 spec §3 — "Phase 1 = within-subject 무처치 훈련" 역할을 재정의

---

## Problem

v6 spec(메인)은 induced-value를 **Phase 1 — 동일 피험자 within-subject 무처치 훈련**으로 두었다. 그러나 다음 두 목적을 동시에 달성하려면 이 구조가 부적합함이 드러났다:

1. **induced를 분석 대상으로 활용** — induced는 *진짜 가치가 알려져 있어* AI 정보의 효과가 베이지안 갱신일 수 없고 **순수 행동 왜곡(채널 B)만** 나타난다. 이는 채널 분리의 가장 강력한 식별 지렛대다.
2. **induced에 AI 처치 투입** — within-subject로 induced(AI)→homegrown을 돌리면 induced 단계의 AI 앵커가 homegrown으로 **carryover 오염**된다. 종속변수가 앵커링인 연구에서 치명적.

선행연구 패턴도 일치한다: induced를 *분석*한 연구(Lee 2020, Corrigan 2012)는 모두 **별개/단독 실험**이고, within-subject로 합친 연구(PZ 2005)는 induced를 *분석하지 않는 훈련*으로만 썼다. induced에 처치를 넣어 분석한 within-subject 결합 설계는 문헌에 없다.

## Options considered

### Option A: v6 유지 — Phase 1 within-subject 무처치 훈련

induced를 처치 없는 숙련도 훈련으로만 사용 (PZ 2005 모델).

**Pro:** 표준 절차, 개인 단위 숙련도 통제, carryover 없음(처치가 없으므로).
**Con:** induced가 **AI 채널 정보를 전혀 주지 못함** — 단순 숙련도 벤치마크에 그침. 사용자의 "induced로 메커니즘을 본다" 목적 달성 불가.

### Option B: induced를 별개 between-subject 실험으로 분리 (본 결정)

induced와 homegrown을 **다른 피험자 집단**에 배정(단, 같은 모집단·절차에서 stratified randomization). induced 팔은 lottery + AI 3-arm + 인지능력 층화.

**Pro:**
- induced에서 AI 왜곡(채널 B)을 **순수 측정** (진짜 가치 = EV 고정)
- carryover 오염 0 (개인 내 induced→homegrown 경로 부재)
- 선행연구 정합 (Lee 2020 induced 단독, Corrigan 2012 정보→Nash 이탈)
- Fox 1998 CVM-X 집단 수준 보정 논리와 정합

**Con:**
- 집단 수준 cross-calibration은 "양 팔의 AI source effect 동일" 가정 필요 → 단, 같은 모집단·절차 무작위 배정으로 within-study보다 방어 가능
- 개인 단위 차감(within) 불가 → 집단 평균 차감으로 대체

### Option C: within-subject로 induced·homegrown 모두 AI 처치

같은 사람에게 induced(AI)→homegrown(AI). 개인 단위 cross-calibration 최강.

**Pro:** "양 팔 동일효과" 가정 불필요(같은 사람).
**Con:** induced AI 앵커의 homegrown carryover 오염이 **앵커링 DV를 직접 훼손** → 기각.

## Decision

**Chose:** Option B — induced를 별개 between-subject 실험으로 분리.

**Rationale:** 종속변수가 앵커링(채널 B)인 이상, induced 단계의 AI 앵커가 homegrown으로 새는 carryover(Option C)는 식별을 무너뜨린다. Option A는 오염은 없지만 induced의 *분석 가치*(채널 B 순수 측정)를 포기한다. Option B는 같은 모집단 내 stratified randomization으로 "동일효과" 가정을 방어 가능한 수준으로 낮추면서, induced의 깨끗한 채널-B 식별과 carryover-free를 동시에 얻는다.

---

## 설계 명세 (induced 팔)

### 1. 대상재: Lottery (induced value)

- 진짜 가치 = 기댓값(EV), *계산해야* 아는 값 → 저인지능력 피험자에게 AI가 **계산 보조(cognitive prosthesis)** 역할 (새 정보 ≠ 채널 A, 계산 대행 = 채널 B 유지)
- 위험선호 혼입 대응: **중간·저분산 lottery** 사용 + 피험자당 **다중 lottery**(EV·분산 변이)로 위험선호를 within-subject 식별

### 2. 3-arm (AI 처치, stratified randomization)

| Arm | 처치 | 식별 |
|---|---|---|
| **A0 통제** | lottery, AI 없음 | 기준 deviation = f(인지능력) — Lee 2020 재현 |
| **A1 AI-정확** | AI가 올바른 EV 제시 | (A1−A0) = AI 계산 보조 효과 |
| **A2 AI-편향** | AI가 EV **±20% 무작위 방향** 제시 | (A2−A0) = AI 앵커/과의존; (A2−A1) = 정확도 민감도 |

### 3. 인지능력 — 측정·층화 (treatment 아님)

- **RSPM**으로 측정(Lee 2020 벤치마크 정합; CRT 단독은 도구 불일치 + Bergman 2010상 약함)
- high/low 분류 또는 **연속변수**(검정력 우선 시 연속 권장)
- 무작위 배정은 AI 3-arm에만, **각 인지능력 층 안에서** 수행
- → 격자: **AI(3) × 인지능력(2) = 6 셀**, 인지능력 축은 *관찰적*(탐색적 보고)

### 4. 식별 — 위험선호 vs AI 발라내기

1. **1차: between 무작위화** → 위험선호가 arm에 균형 배정 → arm 평균 차분에서 소거
2. **결정적: A2 앵커 방향 ±20% 무작위화** → 위험선호는 일관된 한 방향(직교), 앵커링은 AI 방향 따라 갈림 → `Bid = α + λ·(AI_value − EV) + …`의 λ가 위험선호와 직교 식별
3. **보조: 위험선호 별도 측정**(Holt–Laury) → 개인별 CE 구성 → A1의 "deviation 감소"가 *계산 보조*인지 *위험선호 덮어쓰기*인지 해석 (A1은 방향 트릭이 없어 측정 필수). 단, 선호 전이성 가정에 *주 결과*를 걸지 않음

### 5. 벤치마크 — 3겹

| 벤치마크 | 비교 | 역할 |
|---|---|---|
| ① 이론 최적 (EV / 위험조정 CE) | 입찰 vs 정답 | 왜곡 절대 크기 |
| ② 내부 기준 (A0, AI 없음) | AI arm vs 무처치 | AI 효과 순증분 |
| ③ 외부 기준 (Lee 2020) | A0의 능력 격차 vs Lee의 능력 격차 | **설계 타당성(positive control)** |

**Lee 2020 외부 기준 — 실제 수치(정정, 2026-05-31 본문 재확인):** ~~"입찰 분산 3배"~~ 표현은 본문에 없음. 실제: induced SPA에서 perfect demand-revealing 입찰 **고인지 29.4% vs 저인지 13.4%**; 집계 revelation ratio **106.73% vs 114.83%**; RSPM *점수* 분산 차이 F=2.42(p<0.001, 입찰 분산 아님); RE-probit 한계효과 전체 −0.08***, 고 −0.19***, 저 +0.05(n.s.). → A0가 이 능력 격차(저인지 deviation↑)를 재현해야 positive control 성립.

**핵심 예측(상호작용):** AI 효과(도움·왜곡 모두)가 **저인지능력에 집중** — "AI는 계산 못 하는 사람을 가장 돕고, 동시에 가장 오도한다." (Lee 2020 능력→deviation + Bergman CAT 결과 + List 2001 경험 효과와 정합)

**이론 엔진 — Qin et al. (2025) capability–personalization (lit-review·CoVe 검증):** 메타분석(N=82,078)상 AI는 *유능+개인화 불필요* 맥락서 appreciation(d=0.27), 아니면 aversion(d=−0.50). → **Ch1(lottery EV 계산 = 비개인화·AI 유능) = appreciation 조건**, Ch2(건강식품 개인 적합 = 개인화 필요) = aversion 조건. 즉 본 2-chapter 분리가 이 프레임의 *유인적합 valuation 최초 검정*. ⚠️ Logg d≈0.4는 *자기판단* 조건(경매=자기판단)에서 약화되므로 d≈0.27을 보수 기준으로.

---

## Consequences

- **homegrown 팔은 별개 실험**으로 분리 — v6의 핵심 자산(Bias = WTP_CVM − WTP_auction, 5-arm, Pre_Aversion, filler)은 homegrown 팔에 그대로 보존
- **spec §3 재조정 필요** — v6 spec은 여전히 within-subject 2-phase로 기술됨 → 본 ADR과 정합하도록 §3(설계)·§4(분석) 개정 필요 (후속 task)
- **cross-calibration 부활** — ADR-005의 induced↔homegrown 보정 논리가 집단 수준으로 복귀 (Fox CVM-X AI 버전)
- **검정력** — 6셀 + 위험선호 시 상호작용 underpowered 위험 → 인지능력·앵커 모두 **연속변수** 처리로 완화; 셀당 N은 별도 power 분석(후속 ADR)
- **측정 추가** — RSPM(인지능력), Holt–Laury(위험선호), 다중 lottery 입찰 스케줄

## Open Questions (미결 — 초안 단계)

- [ ] **AI 전달 방식**: 완전 static(ADR-003 유지) vs scripted-interactive(통제된 대화형) — 식별은 동일 보존, 차이는 생태적 타당성·manipulation check 강도 vs IRB(deception)·구현 복잡성. *사용자 결정 대기*
- [ ] **인지부하 조작 추가 여부**: 측정·층화(현 결정) 외에 시간압박/동시과제로 System 1 유발하는 *진짜 조작*을 추가할지
- [ ] **Lottery 파라미터**: EV 범위, 분산, 피험자당 개수
- [ ] **위험선호 instrument**: Holt–Laury vs Eckel–Grossman vs bomb-risk
- [ ] **셀당 표본 / power**: 연속 vs 이분, 상호작용 검정력 (후속 ADR-008 계열; Canavari 2019 Eq.1 + 3-arm ½–¼–¼ 배분 적용)
- [x] ~~Lee 2020 "분산 3배" 정확 수치~~ — **해결(2026-05-31):** 본문에 "3배" 없음. 실제 수치는 §5 벤치마크에 반영(29.4%/13.4%, 106.7%/114.8%, F=2.42)

## Rejected alternatives — why not

- **A (v6 within 훈련 유지):** induced의 채널-B 분석 가치를 포기 → 사용자 목적(메커니즘 관찰 + AI 투입) 미달.
- **C (within 양팔 처치):** induced AI 앵커의 homegrown carryover가 앵커링 DV를 직접 훼손.

## References

- **본문 확인 선행연구(폴더):** PlottZeiler2005 (induced 토큰=무처치 훈련→mug), LeeEtAl2020 (induced 단독, RSPM, deviation), CorriganEtAl2012 (induced에서 정보→Nash 이탈), FoxEtAl1998 (cross-sample 보정), List2001 (경험→외부신호 둔감), Shogren2001 (random nth-price 근거), LeeFox2015 (음수 입찰), Canavari2019 (방법·power·배분)
- **신규 인용(lit-review·CoVe 검증):** Qin et al. (2025, *Psych Bulletin* 151(5)) capability–personalization 메타분석; Spatharioti et al. (2023, arXiv:2307.03744) LLM 정확/오류→과의존; Bockstedt & Buckman (2025, *Mgmt Sci* 72(1)) loss aversion×AI 위임
- **정독·리뷰 노트:** `quality_reports/lit_notes_18papers_2026-05-31.md`, `quality_reports/lit_review_ai_valuation_2026-05-31.md`
- **메인 spec:** `quality_reports/specs/research_spec_aiwtp_gap.md` (§3 재조정 필요; §2-3/§2-4/§4-1/§4-5의 "분산 3배"·CRT→RSPM 정정 필요)
- **관련 ADR:** ADR-001(between-subject 확장), ADR-003(전달방식 재검토), ADR-005(cross-calibration 부활), ADR-010(v6 Phase 1 역할 재정의)
- **세션 로그:** `quality_reports/session_logs/2026-05-31_induced-separate-design.md`
