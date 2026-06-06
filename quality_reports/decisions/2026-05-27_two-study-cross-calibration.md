# ADR-005: Two-Study Unified Proposal + Cross-Calibration Framing

**Status:** ⚠️ **SUPERSEDED by ADR-010 (2026-05-28)**
**Date:** 2026-05-27
**Superseded reason:** 사용자 v6 제안서 통합 시 *hypothetical bias framing*이 *cross-calibration framing*보다 명료하고 publishable함이 확인됨. v2 spec은 `research_spec_companion_v2_archived.md`로 archive되어 후속 companion study로 보존.
**Context:** /lit-review (14편 정독 + post-2014 K-R 검색) + Story A vs Story B 검토 + induced/homegrown 연구 목적 명확화. 명세서 v2 작성과 동시 결정.
**Supersedes:** 명세서 v1 (2026-05-26)의 단일 "WTP-WTA 갭 + K-R 5-channel framing"

## Problem

본 연구의 *이론 프레임*과 *outcome variable* 결정. 14편 1차 자료 정독 + 인용수·실험경제 한정 재검색 후 다음 사실이 명확해짐:

1. **K-R 단일 프레임 (Story A)**은 *글로벌 top 거장* 영역의 논쟁이며 한국 lab N=200 cap에서 검정력 부담 큼. Heffetz–List 2014 → Campos-Mercade et al. 2026 RES의 *이질성 통제* 권고를 받아들이면 더욱 N 부담 가중.

2. **Induced value와 homegrown value는 *완전히 다른 연구 목적*을 추구**한다:
   - Induced: 메커니즘 robustness 검정 (V_true 알려짐 → \|bid − V_true\| 의미 있음)
   - Homegrown: 실제 선호 측정 (V_true 모름 → bid 자체가 데이터)
   
   v1 명세서는 두 value 타입을 하나의 갭 측정으로 *합쳐* 다루었는데, 이는 두 라인의 *별개 학문 대화*를 흐리는 디자인.

3. 폴더 보유 12편 + 추가 4편(K-R 검색) 총 16편의 *진짜 직접 선행연구*는:
   - **Lee et al. 2020 (AJAE)**: induced × \|bid − V\| 직접 측정 — Study 1의 모델
   - **Choi et al. 2018 (CJAE)**: 한국·SPA·grade 정보 처치 — Study 2의 모델
   - **Fox et al. 1998 (AJAE)**: lab으로 hypothetical CVM을 calibrate (CVM-X) — Cross-calibration의 모델
   
   이 셋이 *각각 다른 study*에 대응되며, 본 연구의 *진짜 자리*는 그 셋의 *통합*이라는 것이 14편 정독 후 명확해짐.

## Options considered

### Option A: Story A 유지 — WTP-WTA 갭 + K-R 5-channel framing

K-R 진영의 가설(reference-dependent)을 핵심 outcome으로 두고, 5-channel(demand / classical / K-R / commitment cost / outside option)을 식별.

**Pro:**
- 30년 endowment effect 학문 대화에 *직접 참여*.
- Campos-Mercade 2026 RES의 최신 권위와 직접 연결.
- Top journal 게재 시 학술적 야심·인용수 ↑ 가능성.

**Con:**
- N=200 cap에서 8 cells × between-subject = 셀당 25명 → *심각한 저전력*.
- K-R 논쟁은 *글로벌 top 거장* (Sprenger, Goette, Heffetz, List, Köszegi, Rabin) 영역 — 한국 lab의 noisy 결과로 "결착"은 비현실적.
- Choi et al. 2018(직접 전신)이 K-R framing을 채택하지 않음 — 자연스러운 학문적 정합도 약함.
- v1 명세서가 induced와 homegrown을 *목적 다른* 두 value 타입임에도 *단일 갭 측정*으로 묶어 두 라인의 별개 학문 대화를 흐림.

### Option B: Story B 단일 (induced *또는* homegrown 단독)

#### B-1. Induced 단독 (메커니즘 robustness)

**Pro:** Lee 2020의 깔끔한 후속·확장. V_true 알려져 *false anchor* (AI low/high)로 anchoring vs demand effect 직접 식별 가능. 디자인 자유도 큼.

**Con:** Lab artifact 외부타당도 낮음. *정책 함의 약함* — "메커니즘 robustness 검정"이 소비자정책으로 직접 연결 안 됨.

#### B-2. Homegrown 단독 (선호 shift)

**Pro:** Choi 2018의 깔끔한 AI source 확장. 정책 함의 직접 (소비자보호·디지털시장).

**Con:** V_true 없으므로 "정확도" 개념 적용 불가. AI 효과를 *정보 갱신* vs *demand effect* vs *anchoring*으로 분해하기 어려움. Cherry 2004 outside option이 무거운 confound.

### Option C: Two-Study Unified Proposal + Cross-Calibration (본 결정)

Induced와 homegrown을 *서로 다른 study*로 분리하되, 본 proposal 안에서 통합. 두 study를 *동일 AI source·동일 prompt 구조·동일 lab*로 묶어 cross-calibrate.

- **Study 1 (induced)**: 4 arms (control/AI agree/AI low/AI high). Outcome = \|bid − V_induced\|. → demand·anchoring 추정량 (δ_demand, δ_anchor) 확보.
- **Study 2 (homegrown)**: 2 main + 2 optional arms. Outcome = WTP shift. → total effect (θ_total) 추정.
- **Cross-calibration**: θ_info = θ_total − δ_demand − δ_anchor → *순수 정보 효과* 분리.

**Pro:**
- 각 value 타입이 *별개 학문 대화*에 명확히 자리잡음 (induced = Lee 2020 라인; homegrown = Choi 2018 라인).
- Cross-calibration이 **Fox 1998 CVM-X 라인의 21세기 AI 버전**으로 *새 디자인 방법*을 제안 → 학술적 novelty 강함.
- 두 study 각각이 *완결된 paper*로 분리 가능 (Paper 1 = 방법론, Paper 2 = 정책+robustness).
- N 부담을 *각 study별로* 평가 — 한 study가 작아도 다른 study 보완.
- 정책·방법론 양쪽 청중 모두 만족.

**Con:**
- 디자인 복잡도 ↑ (양 study 동시 운영, AI source 통일 필요).
- 두 study의 *동시 사전등록*과 cross-calibration 가정의 정당화 필요.
- 분석 복잡 (delta method + bootstrap).

## Decision

**Chose:** Option C — Two-Study Unified Proposal + Cross-Calibration.

**Rationale:**

1. **각 value 타입의 학문적 정체성 보존**: Induced와 homegrown이 *별개 학문 대화*에 속함을 인정하고, 각 study를 그 대화에 명확히 위치시킴. v1의 conflation 해소.

2. **Cross-calibration이 본 proposal의 *진짜 novelty***: Fox 1998 CVM-X가 30년 전 *lab으로 hypothetical survey를 calibrate*했듯이, 본 연구는 *induced lab으로 homegrown lab의 AI confound를 calibrate*함. 이 logic 자체가 새로운 실험 디자인 방법 — 단순 "AI × WTP-WTA"보다 강력한 컨트리뷰션.

3. **N 부담 분산**: Study 1(4 cells)과 Study 2(2 main cells)를 각각 운영하여 cell당 N 확보. 단일 8-cell 디자인의 저전력 회피.

4. **Choi 2018과의 자연스러운 정합**: 본인 학문 배경(ag·환경경제) + 폴더 보유 12편이 모두 *valuation accuracy/shift* 라인 — K-R 논쟁보다 자연스러운 학문적 진보.

5. **현 단계(내부 피드백)에 적합**: Two-study unified는 *야심 있되 실현 가능*. 추후 두 paper로 쪼개거나 한 paper에 묶거나 유연.

6. **K-R framing은 *후속 연구로 보존***: Story A의 K-R 식별 실험은 매력적이지만 *현 단계 단일 연구*로는 위험. 본 연구가 성공하면 follow-up paper로 자연스럽게 확장 가능.

## Consequences

### 즉시 변경되는 산출물

- **명세서 v1 → v2 전면 재작성** (research_spec_aiwtp_gap.md):
  - §Research Question: 단일 → RQ1/RQ2/RQ3 (Cross)
  - §Hypothesis: 5-channel → Study 1·Study 2·Cross-calibration 가설로 재구성
  - §Empirical Strategy: 단일 디자인 → 양 study 별도 + cross-calibration 절차
  - §Contribution: 4중 진술 (방법론 / 정책 / 이론·방법 / 방법론 적용)
  - §Citations: Tier 1/2/3 재정렬, K-R 진영 demoted

- **명세서 §Open Questions 재구성**:
  - Q1·Q2 (induced·homegrown 객체): BLOCKED → ADR-006·007에서 결정
  - Q3 (AI 메시지 디자인): pilot 전 prototype 작성 단계
  - Q4 (Δ anchor magnitude): V_induced 결정 후
  - 후속 ADR-008 (sample size), ADR-009 (사전등록 시점)

### 후속 결정 사항

- **ADR-006** (TBD): Study 1 induced value 객체 (token 종류, V_induced 분포, Δ 크기)
- **ADR-007** (TBD): Study 2 homegrown 객체 (한국 쌀 vs 환경재 vs 기프티콘)
- **ADR-008** (TBD): Cell당 N + power planning (양 study)
- **ADR-009** (TBD): Pre-registration timing

### 알려진 위험

- Cross-calibration 핵심 가정 (양 study의 AI source effect 동일성) 위반 시 θ_info 추정에 bias. → 동일 LLM·동일 prompt 구조·동일 매체로 강제 + sensitivity analysis로 검증.
- 양 study 동시 운영의 logistical 부담 — 한 학기 내 안배.
- 추가 ADR 4건(006–009) 작성 부담 — pilot 또는 lit review 후 순차적으로.

### 이득

- v1의 conflation 해소 → 학문적 명료성 ↑.
- 각 study가 *완결된 paper로 분리 가능* → 본 proposal이 *연구 프로그램*으로 진화 가능.
- Cross-calibration 자체가 학술적 novelty → 단순 "AI×WTP-WTA"보다 강한 포지셔닝.
- 정책·방법론 양쪽 청중 모두 만족.

## Rejected alternatives — why not

- **A (Story A, K-R 5-channel)**: N=200 cap에서 저전력 + K-R 논쟁의 글로벌 거장 영역 부담 + Choi 2018과의 자연스러운 정합 약함. 단, K-R framing은 *후속 연구*로 보존 (본 study 성공 시 확장 가능).
- **B-1 (Induced 단독)**: 정책 함의 약함. 본인 청중 (소비자정책)에 부적합.
- **B-2 (Homegrown 단독)**: AI 효과를 *정보 vs demand vs anchoring*으로 분해 불가 → 해석 모호. Cross-calibration 가능성 포기.

## References

- Spec v2 (2026-05-27): [research_spec_aiwtp_gap.md](../specs/research_spec_aiwtp_gap.md)
- Lit review 통합본: [lit_review_aiwtp_gap.md](../lit_review_aiwtp_gap.md)
- Lit review K-R post-2014: [lit_review_kr_post2014.md](../lit_review_kr_post2014.md)
- 본 결정의 핵심 선행: Fox et al. (1998, AJAE) CVM-X, Choi et al. (2018, CJAE), Lee et al. (2020, AJAE), Haaland et al. (2023, JEL)
- ADR-001 (between-subject), ADR-002 (SPA), ADR-003 (static AI text) — 모두 유지
