# ADR-001: Pure between-subject design

**Status:** ACCEPTED
**Date:** 2026-05-26
**Context:** `/interview-me` Phase 4 (Q10), 03_AIWTPGap 연구 디자인 단계

## Problem

WTP–WTA 갭 실험에서 한 피험자에게 WTP와 WTA를 *모두* 응답시킬지(within-subject) 또는 *둘 중 하나만* 응답시킬지(between-subject) 결정해야 한다. 이는 통계적 power, demand effect, 그리고 갭 측정값 자체의 인공성에 영향을 준다.

## Options considered

### Option A: Pure between-subject

각 피험자는 WTP 또는 WTA 중 하나의 역할만 부여받는다. 8 cells × 2(WTP/WTA) = **16 처치 조건**.

**Pro:**
- Plott and Zeiler (2005) 이후 misconception 통제 디자인의 사실상 표준.
- 한 피험자가 두 역할을 모두 경험할 때 발생하는 *역할 비교 휴리스틱*(예: "내가 사겠다고 부른 가격보다는 팔 가격을 높여야지") 제거.
- 갭 추정값이 보다 보수적·실제 거래 행동에 가까움.

**Con:**
- 동일 검출력을 위해 표본 2배 필요. 200명 cap에서는 셀당 N 작아짐.
- 개체 내 분산을 활용 못함.

### Option B: Within-subject (역할 순서 무작위)

각 피험자가 WTP와 WTA 두 역할을 모두 경험. 순서를 무작위화하여 order effect 통제.

**Pro:**
- 동일 표본에서 power 2배 효율. N=200에서 셀당 분석 단위 증가.
- 개체 내 분산 활용 가능 (subject FE 회귀).

**Con:**
- 한 피험자가 양 역할을 알면 갭이 *인위적으로 확대*된다는 보고 다수 (Plott–Zeiler 2005, Isoni–Loomes–Sugden 2011 류).
- 본 연구의 핵심 질문(AI가 갭에 미치는 효과)이 within-subject 비교 휴리스틱과 *교란*될 위험.

### Option C: Hybrid (induced=within, homegrown=between)

induced 조건에서는 학습 효과를 활용하기 위해 within, homegrown은 표준 between.

**Pro:** induced 조건의 N 절약, homegrown은 표준 유지.
**Con:** 두 조건 간 디자인 비대칭 → 비교 해석 복잡, 추가 통제 필요.

## Decision

**Chose:** Option A — Pure between-subject.

**Rationale:** 본 연구의 주된 식별 대상은 "AI 정보 효과의 induced × homegrown 차이"이다. within-subject 디자인은 *역할 비교 휴리스틱*으로 갭을 인위적으로 키워 AI 효과의 해석을 흐릴 수 있다. Plott–Zeiler 2005 이후 표준이 between인 것도 이 우려 때문이다. 표본 부담은 — N=200 cap이라는 별개 제약과 충돌하므로 — ADR-004 (treatment cell 수 축소 검토, 작성 예정)에서 처리한다.

## Consequences

- 표본 200명 cap × 8 cells × {WTP, WTA} = 셀당 12–13명. **현저히 저전력.** lit review 후 8 cells → 4 cells 축소 강력히 검토.
- SPA 세션 단위 clustering 필수 (SPA가 그룹 메커니즘이므로). 유효 N은 추가로 감소.
- 사전등록 시 *power 분석 결과를 명시*해야 한다. 다단계(pilot + main) 또는 multi-wave 설계 가능성 열어둠.

## Rejected alternatives — why not

- **B (within-subject):** 갭 측정의 *외부타당도*가 본 연구의 정책 함의를 좌우하므로, 인위적 갭 확대 위험을 받아들일 수 없음.
- **C (hybrid):** 디자인 비대칭으로 induced×homegrown 비교의 깔끔함이 훼손됨. 비대칭에서 발생하는 추가 통제 부담이 이득보다 큼.
