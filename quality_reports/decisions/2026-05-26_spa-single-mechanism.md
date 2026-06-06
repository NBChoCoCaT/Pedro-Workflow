# ADR-002: SPA(second-price auction) 단일 메커니즘

**Status:** ACCEPTED
**Date:** 2026-05-26
**Context:** `/interview-me` Phase 4-보강 (Q13), 03_AIWTPGap 연구 디자인 단계

## Problem

WTP–WTA elicitation 메커니즘으로 BDM, SPA, nth-price auction, English/Dutch auction 중 무엇을 선택할 것인지, 그리고 단일 메커니즘 vs 복수 메커니즘 robust 디자인을 채택할 것인지 결정해야 한다.

## Options considered

### Option A: BDM only

BDM(Becker–DeGroot–Marschak 1964)은 개별 elicitation 메커니즘. 피험자는 가격 분포에서 무작위 추출된 가격과 자신의 응답을 비교.

**Pro:** affiliation(Milgrom–Weber) 위협 없음. 개별 관찰이 독립. 표본 효율 최대.
**Con:** 피험자 이해도 낮은 편 (misconception 위협 큼). 메커니즘 자체에 대한 트레이닝 부담.

### Option B: SPA only

SPA(Vickrey 1961)는 그룹 단위 경매. 입찰자들이 봉인 입찰서를 제출, 최고가가 낙찰 받되 *두 번째 가격*을 지불.

**Pro:**
- 메커니즘 직관적 ("최고가만 이기되 가격은 두 번째 가격"). 피험자 이해도 BDM보다 일반적으로 높음.
- AI 정보가 *공통 신호*로 작동할 때의 affiliation 효과를 검출 가능 — 본 연구의 (i) 정보 보정 vs (ii) 앵커링 vs **(iii') 정보의 공통화** 채널 추가 식별 가치.
- 실험경매 표준 (Canavari et al. 2019, in folder).

**Con:**
- 독립 관찰 단위가 *세션*. clustered SE 사용 시 유효 N 감소.
- N=200 cap에서 세션 단위로 보면 33 세션 — 셀당 4 세션 (8 cells 가정).

### Option C: BDM + SPA 둘 다

robustness 강화. 메커니즘별 결과 일치 시 강한 증거.

**Pro:** 결과의 외부타당도 강함.
**Con:** 8 cells × 2 mechanism = 16 cells → N 부담 2배. N=200 cap에서 비현실적.

### Option D: BDM 메인 + SPA sub-experiment

메인은 BDM 8 cells, SPA는 induced × {AI, no info} 4 cells로 affiliation 위협 점검만.

**Pro:** 표본 효율 + affiliation 보완.
**Con:** 두 메커니즘 결과 통합 해석 복잡. 페이퍼 내러티브 분기.

## Decision

**Chose:** Option B — SPA only.

**Rationale:** 사용자 본인의 명시적 선택. 사후 합리화하자면:
1. 사용자 본인의 학문 배경(experimental auction methodology, agricultural/environmental economics)이 SPA 친화적 — 폴더 보유 논문 12편 중 다수가 SPA 또는 그 변형(nth-price, CVM-X) 기반.
2. SPA의 affiliation 채널이 본 연구의 (iii') "AI 정보가 공통 신호로 작동하는가" 식별에 유용 — 즉, 메커니즘 선택 자체가 식별에 기여.
3. BDM은 misconception 위협이 SPA보다 크다는 점에서 (Plott–Zeiler 2005가 BDM 위주로 사례화), AI 정보 효과 해석 시 추가 confound.

## Consequences

- **분석 단위**: 개별 입찰가; **SE clustering**: SPA 세션 단위 필수.
- **세션 크기**: 4–6명/세션 (실험경매 표준). N=200 → ~33–50 세션 총. 셀당 4–6 세션 (8 cells 가정).
- **유효 N**: 셀당 약 12명 × 그러나 clustering로 유효 자유도는 셀당 세션 수에 가까워짐. **저전력 위험 현저.** ADR-004(예정, treatment design 축소)에서 처리.
- **Affiliation 위협**: 세션 내 입찰자 간 정보 공유 차단 위해 *private booth + 사전 안내*. Q12-(5) 사용자 제기 우려 직접 대응.
- **Commitment cost 위협 (Zhao–Kling 2001, in folder)**: practice round 디자인 변형으로 robustness 점검.

## Rejected alternatives — why not

- **A (BDM only):** BDM의 misconception 부담이 AI 정보 효과 해석을 흐림.
- **C (BDM + SPA):** N=200 cap에서 cell당 6명 — 비현실적 power.
- **D (BDM 메인 + SPA sub):** 두 메커니즘 통합 내러티브 부담 + 사용자 선호 SPA를 메인으로.
