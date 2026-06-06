# A′ 재설계 스펙 (Route A, 의존 척추 + 왜곡 공동기여 + 식품 응용)

**Date:** 2026-06-06
**상태:** (b) 재설계 — A′ 확정 후 / (c) 신규 ADR의 입력
**근거:** v2 종합 프로포절 + `lit_review_aiwtp_reliance_2026-06-06.md` + Corrigan 반영
**언어:** 한국어 본문 + 영문 전문용어

---

## 0. spine (한 줄 정체성)

> **AI가 *정답이 알려진(induced-value)* 가치평가를 *돕나/왜곡하나* — (i) 출처·정확도에 따라 얼마나 *의존*하고[헤드라인], (ii) 그 과정에서 얼마나 *왜곡*되며[메커니즘, Corrigan], (iii) 식품 WTP·격차엔 어떤 *후생효과*인가[응용].**

- **헤드라인 기여:** known-truth·IC 환경에서 **AI vs 인간 출처**의 의존 보정 β(k) → 사회적학습 과소의존 vs AI 과의존 모순을 정면 판정. (lit-review: 4조건 동시충족 연구 없음.)
- **공동 메커니즘:** AI 숫자가 value를 *믿음 경로 밖으로* 끄는 직접 왜곡 μ. Corrigan(2012) induced-value 선례 + BSR 분해가 신규성.
- **응용:** 식품 homegrown WTP–WTA 격차 이동 (코스·AIWTPGap 정체성).

---

## 1. 핵심 식별 수정 5종 (이번 재설계의 골자)

| # | 수정 | 이유(문헌) |
|---|---|---|
| **S. 출처 arm 추가** | 동일 숫자·동일 신뢰도를 **AI / 인간 동료 / 익명** 라벨로 무작위 | 의존 판정의 *필수 조건*. AI vs 인간 대칭비교 없으면 헤드라인이 식별 아닌 주장 (Logg 2019; Weizsäcker 2010 대비) |
| **2단계 belief** | AI 노출 *전 b0* + *후 b1* 모두 BSR | WOA=(b1−b0)/(a−b0) 정의상 pre/post 필요 (Bailey 2022; Bonaccio-Dalal 2006) |
| **BSR center-bias 통제** | neutral framing + 인센티브 정보 최소화 + 사전등록 명시 | BSR 행동상 비-IC, 0.5쪽 편향 (Danz, Vesterlund, Wilson 2022 AER) |
| **μ = 매개분석** | value의 advice 효과를 *믿음매개* + *직접(앵커)* 로 분해 (단순 통제 금지) | 믿음은 advice가 영향 준 매개변수 → over-control 편향 |
| **앵커 종류 분리** | value-관련(AI 추정값) vs value-무관(임의 숫자) | Corrigan(관련=강) vs Fudenberg/Maniadis(무관=약/0) |

---

## 2. 공통 코어 게임 (라운드 단위)

```
1. 역할 배정: 구매자(WTP) / 판매자(WTA)  — 무작위
2. 참값 V 추첨 (연구자 보유, 숨김)
3. 사적 노이즈 신호 s 관측  → 가치 불확실 (사적가치, common value 아님)
4. [1단계] 사전 믿음 b0 (BSR)  + 사전 가치 v0 (BDM)        ← AI 전
5. 조언 메시지: 숫자 a + 고지 신뢰도 k + 출처 라벨(AI/인간/익명)
6. [2단계] 사후 믿음 b1 (BSR)  + 사후 가치 v1 (BDM)        ← AI 후
7. N 라운드 반복, 무작위 1회 지급, no-feedback
```

- **사적가치(private value) 확정:** 단일 행위자 BDM, 자기 V의 신호 → common value/winner's curse 아님.
- **개인수준 WOA 식별:** b0·b1 둘 다 측정하므로 피험자별 의존도 산출 가능.

---

## 3. 처치 구조 (출처를 중심으로 재배치)

| 처치 | 수준 | 식별 대상 | A′ 위계 |
|---|---|---|---|
| T0 | 조언 없음 | 기준선 오차·격차 | 필수 |
| **S 출처** | AI / 인간 / 익명 (내용·신뢰도 고정) | **출처 프리미엄 = AI 의존 − 인간 의존** | **헤드라인** |
| **A 정확도** | 고지 신뢰도 高90%/低60% (실제 노이즈 추정기, 무기만) | **의존–정확도 기울기 β(k)** | **헤드라인** |
| **B 앵커종류** | value-관련(AI 추정값) / value-무관(임의 숫자) | **직접 왜곡 μ** | 메커니즘 |
| (C 정보량) | 간결/과다 | 분산(혼란) | **homegrown·탐색으로 강등** |

- **헤드라인 요인설계 = S(3)×A(2).** β(k) 기울기·수준이 출처별로 다른가 → 과소/과의존 판정.
- **무기만(no-deception):** "틀린 AI"는 거짓 아니라 *실제 노이즈 추정기 + 신뢰도 진실 고지*.
- **출처 arm = between-subject** 권장(AI 오류 목격→aversion carryover 차단, Dietvorst 2015). 정확도·라운드 = within.

---

## 4. 추정량 (A′ 위계 매핑)

| 추정량 | 정의 | 가설 | 위계 | 채널 |
|---|---|---|---|---|
| **β(k) by source** | 출처별 의존–정확도 기울기 (WOA의 k-반응), 베이지안 기준 대조 | H1 과소/과의존 + 출처 프리미엄 | **헤드라인** | 믿음(BSR) |
| **μ (직접 왜곡)** | value의 advice효과 中 *믿음 통제 후* 직접분 (매개분석) | H3 앵커링 | 메커니즘 | 가치(BDM) |
| **bias / RMSE** | 정답 V 대비 평균·제곱오차 (정확 AI=탈편향, 부정확=왜곡) | H2 | 보조 | 믿음·가치 |
| **격차·처치효과** | WTA−WTP, 처치별 이동 (식품) | H4 응용 | 응용 | homegrown |

- **β(k) 베이지안 벤치마크:** 고지 신뢰도 k + (권장) *지각* 신뢰도 별도 유도 → "고지된 60% 대비 과/과소 가중" 식별. 안 그러면 회의=합리와 혼동.
- **μ Corrigan 정합:** value-관련 AI숫자 → μ>0 기대(Corrigan 게시가 왜곡의 AI판). value-무관 숫자 → 순수앵커(약, Fudenberg) = 보수적 보완 arm.

---

## 5. 두 군 (induced 헤드라인 / 식품 응용)

| 요소 | Induced (헤드라인) | Homegrown 식품 (응용) |
|---|---|---|
| 가치 대상 | 토큰(참값 V 환금) | 실제 식품(사용가치) |
| **정답 기준** | 참값 V (연구자 보유) | **없음** — 정확성 판정 불가 ※ "시장가=정확성기준" 오류 폐기 |
| 신호 | V + 노이즈 | 재화의 *객관 속성* 부분정보(예: 영양·품질지표) |
| 믿음 대상 | V | **객관 속성 m** (시장가 아님; value는 선호) |
| 격차 기준선 | ≈0 (절차 충족) | 진짜 보유효과(+) |
| 측정 | β(k)·μ·bias 전부 깨끗 | WTP/WTA/격차 *이동*만 + 다리 사영(정성) |
| 처치 | S·A·B 동일 | 동일 |

- **다리(H4) = 정성적 floor**(referee 기존 합의). 헤드라인 아님 → 약한 고리에 덜 의존.

---

## 6. 선행연구 계보 복원 (v2 누락 보강)

- **induced-value 처치→계시 계보 (v2서 누락 — 복원):**
  Corrigan(2012, AJAE) *게시가→induced 입찰 왜곡* = **μ의 직접 선례**; Jacquemet(2013, JEEM) oath→계시 개선; Cherry(2004) outside option; Lee(2020, AJAE) 인지능력; Shogren(2001) nth-price.
  → §2.5(앵커링) Corrigan 추가, §2.8 gap표 "induced 희소"를 "Corrigan 존재, AI·분해 미비"로 완화.
- **의존 모순 (lit-review):** Weizsäcker(2010, 과소) ↔ Logg(2019)/Klingbeil(2024)/Greiner(2025, 과의존); Möbius(2022) conservatism; Bonaccio-Dalal(2006) WOA.
- **방법:** Hossain-Okui(2013) BSR; Danz(2022) center-bias; Bailey(2022) WOA; Haaland-Roth-Wohlfart(2023) belief-mediation; Ariely(2003)/Fudenberg(2012)/Maniadis(2014)/Ioannidis(2023) 앵커.

---

## 7. 열린 모수·결정 (다음 단계)

- [ ] 신호·AI 노이즈 캘리브레이션 (사전과 동등 가중? 파일럿)
- [ ] 출처 arm: between 확정 vs 부분 within (carryover 검증)
- [ ] 지각 신뢰도 유도 추가 여부 (β(k) 벤치마크 정밀화)
- [ ] 식품 재화 + *객관 속성 벤치마크 m* 선택 (시장가 금지)
- [ ] 검정력: μ(약효과 전제·Fudenberg), β(k) 기울기·출처 차이 (Bailey WOA=0.39 prior)
- [ ] C(정보량) 채널 유지 위치 최종 (homegrown·탐색)

---

## 8. v2 대비 변경 요약 (집필 반영용)

1. 헤드라인을 **의존 β(k)+출처**로 단일화, 왜곡=메커니즘·격차=응용으로 위계화.
2. **출처(S) arm 신설** (AI/인간/익명).
3. 코어게임 **2단계 belief(b0/b1)** + BSR center-bias 통제.
4. μ = **매개분석**(단순통제 폐기).
5. 앵커 **종류 분리**(관련/무관).
6. homegrown **"정확성기준=시장가" 폐기** → 객관속성 m.
7. **Corrigan + induced 계보 복원**, gap 문구 4조건 한정.
8. 인용 정정(Noti·Nguyen·Sunstein) + 신규(Danz·Bailey·Greiner·Möbius·Ioannidis·Weizsäcker).
