# Research Specification: AI Information, Hypothetical Bias & WTP Measurement

**Date:** 2026-05-31 (v7 — §3·§4 2-chapter 개정; v6 2026-05-28)
**Researcher:** 이도현 (leedohyeon@kakao.com)
**Working language:** 한국어 본문 + 영문 전문용어
**Paper type:** lab experiment (2-chapter: induced lottery + homegrown 건강식품, between-subject)
**용도:** 지도교수·동료 피드백용 내부 문서
**상태:** **MAIN spec (v7 — 전체 2-chapter 정합화 완료)** — Context·§1·§2·§3·§4·§5·§6·§7 일관

### 버전 history

- **v1 (2026-05-26)**: WTP-WTA 갭 + K-R 5-channel framing — superseded
- **v2 (2026-05-27)**: Two-Study cross-calibration — *archived* (후속 연구 노트)
- **v6 (2026-05-28)**: AI × Hypothetical Bias (CVM-auction) gap, 5-arm 2-phase + SUR병렬 + Competing Mediation
- **v7 (2026-05-31)**: ⭐ **전체 2-chapter 정합화 — induced/homegrown을 between-subject 2-chapter로 분리(ADR-011) + Qin(2025) capability–personalization 부호역전 차별가설(§2-6, §4-3).** Context·§1·§2(+신규 §2-6)·§3·§4·§5·§6(17편)·§7 모두 갱신. v6 자산(가상편의·건강식품·5-arm·Pre_Aversion·filler)은 Chapter 2에 보존.

### 관련 ADR

- ADR-001 (between-subject) — 유지·확장 (value-type 축)
- ADR-002 (SPA single mechanism) — Random nth-price로 확정 (Shogren 2001)
- ADR-003 (static AI text) — 재검토 중 (전달방식 Open Q)
- ADR-005 (Two-study cross-calibration) — SUPERSEDED by ADR-010, 단 cross-calibration 논리는 ADR-011서 집단수준 부활
- ADR-010: v2 → v6 pivot
- **ADR-011 (NEW)**: induced 분리 실험 — lottery·AI 3-arm·인지능력 층화 (v7 §3·§4의 근거)

---

## Context (왜 이 연구인가)

식품 정책에서 소비자 WTP는 두 방법으로 측정된다:

- **CVM(설문):** 저비용·대규모, 그러나 가상편의(hypothetical bias) 존재
- **실험경매:** 인센티브 호환적, 그러나 고비용·소규모

Fox et al.(CVM-X)은 CVM이 실험경매 WTP의 1.5~1.8배임을 보여 가상편의의 실재를 확인했다. List(2001)는 cheap talk이 초보자의 가상편의를 줄이지만 경험자에겐 무효임을 보였다. Logg et al.(2019, *OBHDP* 151:90–103)는 사람들이 AI 조언에 인간 전문가보다 더 높은 가중치를 부여함을 보였다(Algorithm Appreciation; WOA d≈0.40 — Exp 1A에서 d=0.42, 실험 전체 d=0.32–0.44 범위). Dietvorst et al.(2015, *JEP:General* 144(1):114–126)는 AI 오류를 목격한 이후 AI 선택률이 *Control 65% → Model-and-Human 조건 23%*로 급락함을 보였다(Algorithm Aversion; Study 1 Figure 3).

**핵심 장력(tension):** AI 정보는 WTP 측정의 가상편의를 줄이는가, 아니면 오히려 왜곡시키는가?

- **Bayesian 채널:** AI → 불확실성 감소 → 경매 WTP↑(진짜 가치 수렴) → 갭 ↓
- **행동경제학 채널:** AI → 앵커링 / 정보 과부하 / 자동화 편향(Appreciation/Aversion) → WTP 왜곡 → 갭 방향 불확실
- **preference reversal** 추가 고려 필요

Corrigan et al.은 가격 피드백(정보)이 demand revelation을 오히려 악화시킴을 보였다. **두 채널 중 어느 것이 지배적인가 — 이것이 이 논문의 핵심 질문이다.**

**핵심 기여 (central contributions, v7 — 2-chapter):**

> "We provide the first experimental test, in **incentive-compatible value elicitation**, of whether AI-provided information *helps or distorts* valuation — and show the effect's **sign depends on whether the task requires personalization**. **Chapter 1** (induced-value lottery, known value) isolates pure behavioral distortion (anchoring / overreliance), since there is no true value to learn. **Chapter 2** (homegrown functional food, unknown value) measures hypothetical bias (Bias = WTP_CVM − WTP_auction). The **capability–personalization framework (Qin et al. 2025)** predicts AI *appreciation* in the impersonal lottery task (Quadrant I, d≈+0.27) but *aversion* in the personalized health task (Quadrant II, d≈−0.43) — a **sign reversal** we test directly. Cognitive ability moderates throughout."

> **Framing:** Ch1 = Lee et al. (2020) induced-value 직접 확장(채널 B 순수 측정); Ch2 = Fox et al. (1998) CVM-X의 21세기 AI 재해석(가상편의). 두 챕터는 Qin(2025) capability–personalization 프레임으로 통합 (§4-3). gap: AI×유인적합 valuation 실증 부재(메타 163편 중 0편, lit-review·CoVe 확인).

---

## 1. 연구 질문 (Research Question)

> **중심 질문:** AI가 제공하는 정보는 incentive-compatible valuation을 *돕는가(정확한 가치 발견)* 아니면 *왜곡하는가(앵커링·과의존)*? 그리고 그 방향은 과제의 **개인화 필요성**과 소비자 **인지능력**에 따라 어떻게 달라지는가?

**Chapter 1 — Induced Value (lottery, 진짜 가치 알려짐 → 순수 왜곡):**

- C1-Q1: AI 정보(정확/편향±20%)는 *알려진* 가치(EV)에서 입찰을 얼마나 이탈시키는가? (정확 = 계산 보조, 편향 = 앵커/과의존)
- C1-Q2: 그 효과는 **인지능력**이 낮을수록 큰가? (저인지: AI가 가장 돕고 동시에 가장 오도)

**Chapter 2 — Homegrown Value (건강식품, 진짜 가치 불확실 → 가상편의):**

- C2-Q1: AI 개인화 정보는 일반 정보 대비 가상편의(WTP_CVM − WTP_auction)를 줄이는가, 왜곡하는가? (정보원·정보량 효과)
- C2-Q2: AI × 고정보량에서 앵커링/과부하로 갭이 오히려 증가하는가? (채널 B 지배)

**통합 (Qin capability–personalization):**

- U-Q: AI 효과의 **부호가 Ch1(비개인화 → appreciation)과 Ch2(개인화 → aversion)에서 역전**하는가? 이는 인지능력으로 어떻게 조절되는가?

---

## 2. 이론적 프레임워크

> **v7 챕터 매핑:** §2-1(가상편의)·§2-2(채널 A, Bayesian)는 **Chapter 2 전용**(homegrown, 진짜 가치 불확실). **Chapter 1**(induced lottery)은 진짜 가치=EV가 *고정*되어 채널 A(가치 발견)가 **부재** → §2-3(채널 B 왜곡)만 작동 = 순수 왜곡 측정. §2-3·§2-4는 양 챕터 공통. §2-6(Qin capability–personalization)이 두 챕터를 통합하는 상위 프레임.

### 2-1. 가상편의 (Hypothetical Bias) [Chapter 2]

```
CVM WTP > 실험경매 WTP
갭(Bias) = WTP_CVM - WTP_auction
원인: 가상 상황 → 예산·참여 제약 없음 → WTP 과장
```

Fox et al.(CVM-X): 보정계수 0.55~0.69 (가상편의 실재의 근거 — 문헌 인용 목적)
→ 분석에서 보정계수 자체는 사용하지 않음. "가상편의가 실존한다"는 선행 근거로만 활용.

> **K-R 진영 demotion 공지**: 본 연구는 endowment effect의 reference-dependent 논쟁 (Kőszegi-Rabin 2006; Heffetz-List 2014; Campos-Mercade et al. 2026 RES)에 *참여하지 않는다*. 이는 *별개 phenomena*인 hypothetical bias에 초점을 맞춤으로써, K-R 논쟁의 미해결 식별 문제를 우회한다.

### 2-2. 채널 A — Bayesian 업데이트 (갭 감소 예측)

```
AI 정보 → 신뢰재(credence good) 효능 불확실성 ↓
        → 경매 참가자가 더 정확한 개인 가치 파악
        → 경매 WTP ↑ (진짜 WTP에 수렴)
        → Bias = WTP_CVM - WTP_auction ↓
```

**주의:** 이 설계에서 CVM은 처치 *이후*에 측정되므로, Bayesian 채널은 주로 경매 WTP 상승을 통해 작동함. CVM WTP 자체의 변화는 처치 효과와 가상편의 감소가 혼재될 수 있어 해석에 주의.

**채널 A의 비대칭 이동 메커니즘 (이론적 근거):**

- CVM은 인센티브 비호환적(hypothetical) → AI 정보가 정밀해도 "어차피 가상" 응답 경향이 잔존 → WTP_CVM 변화 제한
- 경매는 인센티브 호환적 → AI 정보 정밀도 증가 → 입찰 정확도 직접 향상 → WTP_auction↑ (진짜 WTP 수렴)
- 따라서 채널 A가 작동하면: WTP_auction 상승 > WTP_CVM 상승 → Bias = WTP_CVM - WTP_auction ↓
- 만약 AI가 두 WTP를 **동일 크기로** 이동시키면 Bias 불변 → 주 분석(Bias 회귀)이 AI 효과를 놓침
- 이를 탐지하기 위해 **SUR 병렬 분석** 추가 (섹션 4-2 참조)

**이론적 뒷받침 — Zhao & Kling(2001) Commitment Cost:**

- 경매: commitment cost > 0 → 불확실성 감소(AI 정보)가 직접 입찰 상승으로 이어짐
- CVM: commitment cost ≈ 0 (가상) → 불확실성 감소의 한계 효과 제한
- Harrison & Rutstrom(2008): 가상 환경에서 정보의 가치가 실질적 환경보다 낮음
- 예측: β_auction(처치 효과) > β_CVM(처치 효과) → SUR 검정으로 확인

### 2-3. 채널 B — 행동경제학 왜곡 (갭 방향 불확실 예측)

**B-1. 앵커링 (Anchoring):**

```
AI 제시 금전적 추정 가치("AI 추정 적정 가치: XX,XXX원") → 금전적 앵커 형성
→ 입찰가가 AI 제시 가격에 수렴 (경매 WTP 왜곡)
→ AnchorDev = Bid_auction - AI_price_estimate ≈ 0
→ Bias 방향 불확실 (AI_price_estimate < 진짜 WTP면 Bias ↓, > 진짜 WTP면 Bias ↑)
```

**AnchorDev 조작적 정의 (v6 재정의):**

- v5의 AnchorDev = Bid - AI_suggested_value(적합도 %)는 단위 불일치(원화 vs. %) → 계산 불가
- v6: T3/T4 처치에 **"AI 추정 적정 가치: XX,XXX원"을 명시 포함** → AnchorDev = Bid - AI_price_estimate (동일 단위)
- T2(Generic × High)에도 **"시장 평균가: XX,XXX원"을 포함** → AnchorDev_generic = Bid - Generic_price_ref
- 이를 통해: (AnchorDev_T4 - AnchorDev_T2) = AI 고유 앵커링 효과 분리 가능
- AI 추정 가치는 시장가 대비 체계적으로 변이 설계 (+20% or -20%) → 앵커링 방향성도 검증
- 단, AI가 금전적 가격을 제시하면 생태적 타당성(ecological validity) 약화 → Limitation에 명시

**이중 앵커링 (Double Anchoring) 위험:**

```
T4에서: AI 가격 앵커 → CVM 응답에 영향
        → CVM 응답이 경매의 내적 앵커로 재작용
        → Bias = WTP_CVM - WTP_auction 인위적 축소
T0에서: 이 경로 부재 → T4 vs. T0 비교에서 Bias 축소가
        채널 A(Bayesian)인지 이중 앵커링인지 식별 필요
→ 대응: filler task 삽입 + SUR 병렬 분석으로 부분 분리
```

**B-2. 정보 과부하 (Information Overload):**

```
AI 상세 정보(고정보 조건) → 처리 용량 초과
→ System 1 (휴리스틱) 작동
→ 입찰 분산 증가 (mean 이동 없음; overload ≠ anchoring)
→ Lee et al.(AJAE 2020): 저인지능력(RSPM) 집단이 deviation·변동 더 큼
   [정정 2026-05-31: "분산 3배"는 본문 근거 없음. 실제 = 완전계시 13.4% vs 29.4%]
→ 이질성: Var_ratio = SD_low / SD_high ↑ (RSPM 기준)
```

**B-3. 자동화 편향 (Algorithm Appreciation / Aversion):**

```
사전 AI 경험 없음 → Algorithm Appreciation 우세 (Logg et al. 2019; Qin et al. 2025 Q I)
  → AI 추천 무비판적 수용 → WTP 왜곡
오류 목격 후 → Algorithm Aversion (Dietvorst et al. 2015)
between 분리(ADR-011): induced 단계 AI 앵커가 homegrown으로 carryover 안 됨
  → 한 피험자는 한 챕터만 → Aversion 오염 차단 (v6의 within-subject Phase 1 중립화 대체)
```

**Logg-Dietvorst 정합 (boundary condition, CoVe 보강):**
Logg et al. (2019)이 §Introduction(p.91)에서 Dietvorst et al. (2015)와 *직접 reconciliation*: 두 결과는 충돌이 아니라 *조건부 boundary* — Appreciation은 default(오류 관측 *전*), Aversion은 조건부(오류 관측 *후* + self-comparison). **Qin et al.(2025) 메타분석이 이를 일반화:** 충돌의 진짜 driver는 *오류 경험*이 아니라 **capability×personalization 맥락**(§2-6).
→ 본 연구의 **between 분리 + Pre_Aversion 사전측정**이 이 boundary를 통제. Ch1(self-judgment 경매)은 appreciation이 약화될 수 있는 조건(Logg Exp3)이므로 효과는 보수적으로 해석.

**AA → WTP 연결 메커니즘 (이론적 명시, v6 추가):**

Logg et al.(2019)의 AA는 *조언 수용(advice-taking)* 패러다임에서 도출됨. 경매는 *가치 유도(value elicitation)* 패러다임으로, AI가 직접 "이렇게 입찰하라"고 조언하지 않음.

연결 메커니즘: **AI 제시 정보가 제품 가치 평가의 프레임(frame)을 설정** → "AI가 XX,XXX원 수준의 가치가 있다고 분석했다"는 정보가 개인의 가치 판단 기준점 자체를 변경 → 경매에서 이 프레임 내에서 입찰 → WTP_auction이 AI 제시 가격 방향으로 이동.

이 메커니즘은 앵커링(B-1)과 유사하나, 의식적 참조(앵커링)가 아닌 **무의식적 프레임 수용**이 핵심 차이.
→ 이론 섹션에서 B-1(앵커링)과 B-3(AA)의 차이를 명시적으로 구분할 것.

### 2-4. 인지능력의 조절 역할 (탐색적)

> **⚠️ 정정(2026-05-31, 본문 재확인 + lit-review):** Lee et al.(2020)은 **RSPM**(CRT 아님)을 썼고, 본문에 "입찰 분산 3배"는 없음. 실제 수치 = 완전계시 입찰 **고 29.4% vs 저 13.4%**, 집계 revelation ratio **106.7% vs 114.8%**, RSPM *점수* 분산 F=2.42. 본 spec이 CRT를 쓰면 Lee 벤치마크와 **도구 불일치** → RSPM 측정 필요(또는 RSPM+CRT 병행). 상세는 ADR-011 §5 및 `lit_notes_18papers_2026-05-31.md` 참조.

Lee et al.(AJAE 2020): 인지능력(RSPM) 낮은 집단 = 입찰 deviation·변동 더 큼 (고능력 대비)
List(2001): 경험 없는 참가자에게만 cheap talk 유효

**Bergman et al.(2010, Economics Letters): CRT × 앵커링 상호작용 p=0.526 — 비유의**
→ CRT가 앵커링의 조절자라는 주장은 직접 반박됨. CAT(Cognitive Ability Test)은 p=0.043으로 유의.
→ **따라서 CRT 이질성 분석은 confirmatory가 아닌 탐색적(exploratory)으로 사전 등록.**

**신뢰재 가정 보완 (v6 추가):**

건강기능식품은 순수 credence good이 아닌 "credence-experience 혼합재"에 가까움 (프로바이오틱스 소화 개선은 1-2주 체감 가능; 반복 구매·리뷰로 부분 품질 학습).

→ 채널 A("AI→불확실성 감소")의 강도가 **구매 경험이 많을수록 약해질 것**으로 예측
→ "건강기능식품 구매 경험 빈도"를 단순 통제변수 → **채널 A 강도의 moderator로 격상**
  `ψ·(AI_i × Experience_high_i)` 상호작용항 추가 (탐색적)
  ψ < 0: 경험 많은 소비자에게 AI 효과 약함 → credence 가정 부분 약화 확인

```
이론적 방향(탐색적 예측, 인지능력 = RSPM 권장):

고인지 (System 2):
  AI 정보 → 정교한 처리 → 정확 AI = 가치발견(Ch2)/계산보조(Ch1), 편향 AI 저항 → |효과| 적정
저인지 (System 1):
  AI 정보 → 과부하/앵커링 → 정확 AI에도 과의존, 편향 AI에 크게 끌림 → |효과| 큼

실증 한계: Bergman et al.(2010) CRT×anchoring 직접 반박 →
  인지능력 조절은 가설이 아닌 탐색적 발견으로 보고 (연속변수 권장).
```

### 2-5. 핵심 예측표 (2-chapter)

**Chapter 1 — Induced (Deviation = |Bid − EV|, 순수 채널 B):**

| Arm | 예측 | 식별 비교 |
|---|---|---|
| A0 통제 | 기준 deviation = f(인지능력) | Lee 2020 재현 |
| A1 정확 | deviation ↓ (계산 보조), 저인지서 더 큼 | A1 vs A0 |
| A2 편향(±20%) | deviation ↑, 입찰이 AI 숫자로 끌림(λ>0) | A2 vs A0; A2 vs A1 |

**Chapter 2 — Homegrown (Bias = WTP_CVM − WTP_auction, 채널 A+B):**

| Arm | 채널 A 예측 | 채널 B 예측 | 식별 비교 |
|---|---|---|---|
| Generic×Low (T1) | 갭 소폭↓ | 변화 미미 | T1 vs T0 |
| Generic×High (T2) | 갭↓ | 과부하 분산↑ | T2 vs T1 |
| AI×Low (T3) | 갭↓(개인화) | Appreciation→변동 | T3 vs T1 |
| AI×High (T4) | 갭 더↓ | 앵커링+과부하→갭↑ | T4 vs T3·T2 |

**통합 (Qin 부호역전):** Ch1 = appreciation(Q I, AI 효과 *도움* 우세) vs Ch2 = aversion(Q II, AI 효과 *불신·왜곡* 우세). 양 챕터 모두 저인지능력에서 |효과| 증폭(탐색적).

### 2-6. 통합 프레임 — Qin capability–personalization (v7 신규)

Qin et al. (2025, *Psych Bulletin*, 메타 N=82,078): AI 선호는 두 인식 차원의 함수.

```
appreciation은 [역량 高 & 개인화 不필요] (Quadrant I, d≈+0.27) 에서만;
나머지 3사분면은 aversion (Q II 高/高 d≈−0.43; Q III −0.38; Q IV −0.69).
```

- **Ch1 (lottery EV 계산):** 비개인화 + AI 유능(산술) = **Q I → appreciation.** Logg(2019)가 쓴 수치추정 과제와 동형.
- **Ch2 (건강식품 개인 적합):** 개인화 필요 = **Q II → aversion.** 메타분석의 대표 aversion 사례(의료/건강)와 정합.
- → **부호 역전 예측** (§4-3에서 직접 검정). 검정 위해 두 차원(역량·개인화 필요성, 1–6)을 manipulation check로 측정(§3-6).
- 주의: 효과 고이질적(I²≈91–98%); **교육수준↑ → appreciation↓**(lab 표본 경고); Ch2 예측은 피험자가 개인화 필요를 *실제로 인식*해야 성립. 메타분석에 유인적합 연구 **0편** = 본 연구의 gap.

---

## 3. 실험 설계 — 2개 실험(2-chapter) 분리 구조

> **v7 개정(2026-05-31, ADR-011):** v6의 within-subject 2-phase 단일 실험을 **between-subject 2개 실험**으로 분리. 한 모집단에서 동시 수집하되 분석·집필은 **Chapter 1(induced lottery)** / **Chapter 2(homegrown 건강식품)**로 분리. 두 챕터는 Qin et al.(2025) capability–personalization 프레임으로 통합(§4-3). v6의 핵심 자산(가상편의·건강식품·5-arm·Pre_Aversion·filler)은 Chapter 2에 보존.

### 3-1. 전체 구조

```
              ┌──────── 단일 모집단 (stratified random assign) ────────┐
              ↓                                                          ↓
  ┌────────────────────────────────┐          ┌────────────────────────────────┐
  │ CHAPTER 1 — Induced (lottery)   │          │ CHAPTER 2 — Homegrown (건강식품) │
  │ 진짜 가치 = EV (알려짐)         │          │ 진짜 가치 불확실 (credence)       │
  │ AI 3-arm × 인지능력(RSPM)       │          │ AI 5-arm (v6 보존)               │
  │ 측정: Deviation = |Bid − EV|    │          │ 측정: Bias = WTP_CVM − WTP_auction│
  │ → AI 효과 = 순수 왜곡(채널 B)   │          │ → 가상편의 감소/왜곡(채널 A+B)    │
  └────────────────────────────────┘          └────────────────────────────────┘
              └── 통합: Qin 부호역전 (Ch1 = Q I appreciation, Ch2 = Q II aversion) ──┘
```

- **분리 근거(ADR-011):** induced에 AI를 넣어 채널 B를 *순수* 측정하려면, within-subject 시 induced 단계 AI 앵커가 homegrown으로 carryover → 앵커링 DV 훼손. **between 분리로 차단.**
- **동시 수집:** 같은 모집단·절차·AI 처치로 무작위 배정 → "양 챕터 AI source effect 동일" 가정 방어 → cross-calibration 가능(Fox CVM-X의 AI 버전).
- 한 피험자는 **한 챕터만** 수행(between).

### 3-2. Chapter 1 — Induced Value (lottery)

```
대상: lottery (중·저분산, EV 계산 필요 → 저인지능력에 AI가 계산 보조)
처치 (3-arm, between, RSPM 층 내 무작위):
  A0 통제 : AI 없음
  A1 정확 : AI가 올바른 EV 제시
  A2 편향 : AI가 EV ±20% 제시 (방향 무작위 배정)
조절: 인지능력 RSPM 측정 → AI(3) × 능력(고/저 또는 연속) = 6셀
핵심 식별: A2 앵커 방향 ±20% 무작위화 → 위험선호와 AI 앵커 직교 분리
```

**식별 핵심 비교:**

- **A1 − A0** = AI 계산 보조(정확) 효과 → 저인지능력에서 더 큼 예측
- **A2 − A0** = AI 앵커/과의존 효과 → 입찰이 AI 숫자 쪽으로 끌림
- **A2 − A1** = AI 정확도 민감도
- EV가 고정이므로 모든 효과는 **베이지안 갱신이 아닌 순수 행동 왜곡(채널 B)** 으로 해석.

### 3-3. Chapter 2 — Homegrown Value (건강식품) [v6 5-arm 보존]

```
                 정보량 低        정보량 高
               ┌────────────┬────────────┐
  Generic      │  T1        │  T2        │
  AI           │  T3        │  T4        │
               └────────────┴────────────┘
T0: 기본 설명만 — 기준선.  총 5-arm.
측정: Bias = WTP_CVM − WTP_auction
     AnchorDev = Bid − AI_price_estimate (T3/T4), Generic_ref (T2)
```

식별 핵심 비교: T1 vs T3(AI 순수), T2 vs T4(과부하 환경 AI), T1 vs T2·T3 vs T4(정보량), T0 vs 나머지. **핵심 조건 T4(AI×High)** — 채널 A vs B 직접 관찰. (상세는 v6 §3-2 동일.)

### 3-4. 제품·자극 선택

**Chapter 1 — lottery (induced value):**
- 단순·중·저분산 금전 복권(EV 명확하나 *계산 필요* → 저인지능력에 AI 보조 의미). 피험자당 **다중 lottery**(EV·분산 변이)로 위험선호를 within 식별, leverage 축소.
- AI 자극: "이 복권의 적정가치/추천 입찰: XX원" — **A1 = 정확 EV**, **A2 = EV±20%(방향 무작위)**. EV가 알려져 있어 `Bid−EV`가 순수 왜곡.

**Chapter 2 — 기능성 건강식품 (Functional Health Food):** [v6 보존]
- 프로바이오틱스 / 오메가-3 / 멀티비타민 (1개월분).
- 근거: **credence good**(효능 사후 검증 곤란 → 채널 A 작동), AI 개인화 자연(현실 서비스 존재 + appreciation 조건), 시장가 존재, 규제 무난.
- AI 정보 형식(T1~T4) — v6 보존:

```
T1 (Generic × Low):  "이 제품은 장 건강·면역력·피로 회복에 도움. 1일 1포. 식약처 인정 원료."
T2 (Generic × High): [성분표 + 원료별 임상근거 + 부작용 + 주의사항, 수치 포함 1p]
T3 (AI × Low):       "귀하 프로필(소화 예민·비타민D 부족·중간 활동량) 기반 적합도 높음.
                     프로바이오틱스 함량이 권장량 87% 충족."
T4 (AI × High):      [T3 + 개인 건강점수 + 성분별 적합도% + 비교순위 + 효과 발현기간 …
                     → 수치 앵커 다수 (채널 B-1 조작)]
```

**앵커값 설계(v6, 양 챕터 공통 ±20%):** Ch1 A2 = EV±20%; Ch2 T3/T4 = "AI 추정 적정 가치: XX원"(시장가 대비 ±20% 무작위), T2 = "시장 평균가: XX원"(generic ref). 방향 무작위화로 앵커링 방향성 검증 + 위험선호 직교 분리(§4-1). 생태적 타당성 한계는 Limitation에 명시.

### 3-5. 경매 메커니즘 (공통)

**Random nth-price auction** (Shogren et al. 2001).
- **선택 근거:** off-margin 입찰자 재참여 — AI 앵커가 다수 피험자를 시장청산가에서 멀리 밀어내므로(=off-margin) SPA보다 적합.
- **no price-feedback** (Corrigan et al. 2012: 라운드 간 가격게시가 induced 입찰을 진짜 가치에서 멀어지게 함).
- **WTP full-bidding 프레임 + 대상 가치 ≥0** → 음수 입찰 왜곡 차단(Lee & Fox 2015). endowment-exchange·WTA 프레임 회피.
- **BDM 미사용** (lottery에서 non-EU 하 incentive-compatible 아님; Karni–Safra, Canavari 2019).
- IPV 점검: AI 공통 앵커가 IPV 위협 가능 → 사후 "다른 참가자 AI를 의식했나" 점검.

### 3-6. 공통 측정 (Qin 프레임 검정 포함) [v7 신규]

```
1. 인지능력: RSPM (Lee 2020 벤치마크 정합; CRT 병행 선택)  — Ch1 핵심 조절
2. Qin 두 차원 (manipulation check / mediator) — §4-3 검정용:
   - 인식 AI 역량 (1–6): "이 과제에서 AI는 인간보다 얼마나 유능?"
   - 개인화 필요성 (1–6): "이 과제에서 개인화가 필요?"  → Ch1 低 / Ch2 高 예상(load-bearing)
3. 위험선호: Holt–Laury (Ch1 — 위험 vs AI 분리 보조; 주 식별은 앵커 방향 무작위화)
4. Pre_Aversion: 과거 AI 오류 경험·빈도 (1–7) — Dietvorst 2015 / Bockstedt–Buckman 2025
5. 건강식품 친숙도·구매경험 (Ch2 통제·moderator); 건강 프로필 (Ch2 AI 개인화 생성용)
6. 사후 manipulation/매개: 불확실성 감소·AI 신뢰·앵커링·과부하·appreciation·"AI가 실제 분석했다 믿나"
```

### 3-7. 실험 절차 (요약)

```
[공통 사전] 동의 → 사전설문(RSPM, Qin 두 차원, Pre_Aversion, (Ch2)건강프로필) → 메커니즘 교육·연습

[CHAPTER 1]  처치(A0/A1/A2) → lottery 경매(다중·no-feedback)
             측정: Deviation = |Bid − EV|, AnchorDev = Bid − AI_value (A2)

[CHAPTER 2]  처치(T0~T4) → CVM WTP → filler(5분, 순서효과 차단) → 경매 WTP → 사후
             측정: Bias = WTP_CVM − WTP_auction, AnchorDev (T2/T3/T4)

※ 한 피험자는 한 챕터만(between). 사후 설문은 §3-6의 매개·점검 문항 공통.
```

### 3-8. 표본 규모

- **Chapter 1:** AI(3) × 인지능력 — Canavari(2019) Eq.1(라운드·상관 반영) + **3-arm 최적배분 ½–¼–¼**(통제·정확·편향; List et al. 2011). 상호작용 검정력 위해 **인지능력·앵커를 연속변수**로 권장(Bergman 경고). 셀당 N은 별도 power ADR.
- **Chapter 2:** 5-arm — v6 기준(Choi 2018 ±15% base rate, Fox CVM-X 효과크기, Bias 표준편차 기반 집단 간 검정). 구매경험·Qin 차원은 연속 통제로 표본 영향 없음.
- 두 챕터 합산 표본·동시수집 배분은 후속 ADR(power)에서 확정.

---

## 4. 분석 전략 — 2-chapter

### 4-1. Chapter 1 분석 (induced — 채널 B 순수 측정)

```
Deviation_i = |Bid_i − EV_i|     (EV 고정 → AI 효과 = 순수 행동 왜곡)

(1) 처치 효과:
  Deviation_i = α + β_A1·A1_i + β_A2·A2_i + θ·CogAbility_i + δX_i + ε_i
  예측: β_A1 < 0 (정확 AI가 deviation 감소 = 계산 보조)
        β_A2 > 0 (편향 AI가 deviation 증가 = 앵커/과의존)

(2) 앵커링 식별 (A2, 위험선호와 직교):
  Bid_i = α + λ·(AI_value_i − EV_i) + (controls) + ε_i
  AI_value = EV·(1 ± 0.20), 방향 무작위 → λ > 0 = 앵커링 강도
  위험선호는 α에 흡수(±방향 균형 배정으로 소거) → λ 직교 식별
  보조: Holt–Laury r_i로 개인 CE 구성 → A1의 "deviation 감소"가
        *계산 보조* 인지 *위험선호 덮어쓰기* 인지 판별 (A1은 방향 트릭 없어 측정 필수)

(3) 인지능력 조절:
  Deviation_i = ... + π·(A_i × CogAbility_i)
  예측: 저인지능력에서 |AI 효과|(도움·왜곡 모두) 큼
```

**벤치마크(외부, Lee 2020 positive control):** A0(무처치)가 저인지 deviation↑를 재현해야 설계 타당. Lee 2020 실제: 완전계시 입찰 **고 29.4% vs 저 13.4%**, revelation 106.7%/114.8%(※ "분산 3배"는 근거 없음; 도구 = **RSPM**).

### 4-2. Chapter 2 분석 (homegrown — 가상편의) [v6 보존]

```
【A】 Bias 회귀:  Bias_i = WTP_CVM,i − WTP_auction,i
  Bias_i = α + δ_source·AI_i + δ_amount·High_i + δ_int·(AI_i × High_i)
             + γ·Pre_Aversion_i + δX_i + ε_i
  δ_source<0 / δ_amount<0: AI·정보가 가상편의 감소(채널 A)
  δ_int>0: AI×High = 채널 B(앵커링/과부하/편향) 지배

【B】 SUR 병렬 (채널 A 비대칭 이동):
  WTP_CVM, WTP_auction 동시 추정 → H1: β_auction > β_CVM = 채널 A
  β_auction ≈ β_CVM → 이중 앵커링 가능성(Bias 회귀가 효과 놓침)

【앵커링 직접】 AnchorDev = Bid − AI_price_estimate (T3/T4), Generic_ref (T2)
  AI 고유 앵커링 = AnchorDev_T4 − AnchorDev_gen_T2 (0 수렴 시 채널 B-1)
```

### 4-3. 통합 차별가설 — Qin capability–personalization [v7 신규·핵심]

```
프레임(Qin et al. 2025, 메타 N=82,078):
  appreciation은 [역량 高 & 개인화 不필요](Quadrant I, d≈+0.27)에서만;
  나머지는 aversion (Q II 高/高 d≈−0.43; Q III −0.38; Q IV −0.69).

예측 (부호 역전):
  Ch1 (lottery EV = 비개인화 · AI 유능 = Q I) → appreciation → A1 도움↑·수용↑
  Ch2 (건강 개인 적합 = 개인화 필요 = Q II) → aversion → AI 신뢰·수용↓
  ⇒ AI 효과 부호가 Ch1 vs Ch2에서 역전 (검정 가능)

검정:
  - 측정한 두 차원(역량·개인화 필요성, 1–6)으로 각 챕터가 의도한 사분면에
    위치하는지 확인 (Ch1 개인화 低 / Ch2 개인화 高 — load-bearing manip check)
  - 역량 인식은 양 챕터 모두 高여야 → Ch2 aversion이 *개인화* 때문임을 식별
  - 챕터 × AI 상호작용으로 부호역전 직접 검정
주의: 교육수준↑ → appreciation↓ (Qin moderator) → 표본 인구통계 통제·해석
      효과는 고이질적(I²≈91–98%) → 중심경향으로 보고
```

### 4-4. 이질성 — 인지능력 (탐색적)

```
Ch1: Deviation_i = ... + π·(A_i × CogAbility_i)
Ch2: Bias_i      = ... + φ·(AI_i × CogAbility_i)       [v6 2×2×2의 단순화]
예측: 저인지 → |AI 효과| 큼 (계산보조·과의존 모두).
주의: Bergman et al.(2010) CRT×앵커링 n.s. → 탐색적; φ≈0은 "미탐지(inconclusive)"로 보고
      (단정 금지). 3-way·이분화는 underpowered → 연속변수 interaction으로 검정력 확보.
구매경험 moderator(Ch2, 탐색): + ψ·(AI×Experience_high) — ψ<0이면 credence 가정 약화.
```

### 4-5. 다중비교 위계 및 사전등록

```
1단계 Confirmatory:
  Ch1 — β_A1, β_A2, λ(앵커링)         (Holm, 챕터별)
  Ch2 — δ_source, δ_amount, δ_int      (Holm, 챕터별)
2단계 Structured Secondary:
  Ch2 SUR 비대칭(β_auction vs β_CVM); 챕터×AI 부호역전(Qin); mediation → nested model
  보정: FDR (Benjamini–Hochberg)
3단계 Exploratory:
  인지능력 interaction(π, φ), 구매경험 moderator(ψ) — 보정 없음, 탐색적 보고
```

### 4-6. 메커니즘 검증 (Competing Mediation) [v6 보존]

```
Ch2 경로:
  A (Bayesian):  T → 불확실성↓ → WTP_auction↑ → Bias↓
  B-1 (앵커링):  T → 앵커링↑ → AnchorDev≈0 → Bias 왜곡
  B-2 (과부하):  T → 과부하↑ → Bid 분산↑ → Bias↑
  B-3 (자동화):  T × Pre_Aversion 낮음 → appreciation↑ → Bid 왜곡
```

**경쟁 매개(Ch2):** 채널 A와 B-1이 관측적으로 등가 → 두 매개변수(불확실성 감소·앵커링 점수)를 **동시 투입**해 상대 강도 추정. 기여 = "완전 분리"가 아닌 **"조건부 우세 판별"**.

**Ch1의 단순화:** EV 고정이라 채널 A(베이지안 가치발견)가 부재 → induced에선 **채널 B 단독 식별** → mediation이 단순. 즉 Ch1이 Ch2의 채널 A/B 등가성 문제를 *외부에서 보정*(cross-calibration).

---

## 5. Proposal 논문 구조

```
[2-chapter dissertation: Ch1·Ch2를 독립 논문으로 집필, cross-calibration이 통합 다리]

1. Introduction
   - Hook: AI가 의사결정을 개선한다는 통념(Logg 2019; Qin 2025 appreciation) vs.
           Corrigan 2012(정보가 demand revelation 악화) + Dietvorst 2015(aversion)
   - Puzzle: AI는 가치 발견을 돕나, 앵커로 왜곡하나? 방향은 과제에 따라 뒤집히나?
   - Research Q: 유인적합 valuation에서 AI 효과 + 개인화 필요성·인지능력 조절
   - Preview: 2-chapter (Ch1 induced lottery / Ch2 homegrown 건강식품) + Qin 부호역전
   - Framing: Lee 2020(Ch1)·Fox CVM-X(Ch2)·Qin capability–personalization 통합

2. Theoretical Framework
   - 가상편의(Ch2; Fox 실재 근거) + 채널 A(Bayesian, Ch2 전용)
   - 채널 B(앵커링·과부하·algorithm bias) — 양 챕터; Ch1은 채널 B 단독(EV 고정)
   - 인지능력 조절(Lee 2020 RSPM; Bergman 2010 탐색적)
   - Qin capability–personalization 통합 → Ch1 Q I vs Ch2 Q II 부호역전
   - K-R 진영 demotion (별개 phenomena)

3. Experimental Design
   - between 분리 2-chapter (한 모집단 동시수집, ADR-011)
   - Ch1: lottery, AI 3-arm(A0/A1/A2 ±20%), RSPM 층화, 앵커방향 무작위 식별
   - Ch2: 건강식품 5-arm(v6 보존), Bias = WTP_CVM − WTP_auction
   - 공통 측정(Qin 두 차원, Holt–Laury, Pre_Aversion); nth-price·no-feedback
   - 절차·표본 (½–¼–¼, Canavari power)

4. Analysis Plan
   - Ch1: Deviation 회귀 + 앵커링 λ 직교식별 + 인지능력 조절
   - Ch2: Bias 2×2 + SUR + AnchorDev + Competing mediation
   - 통합: Qin 부호역전(챕터×AI) + 두 차원 manipulation check
   - 다중비교 위계(Holm/FDR/탐색)

5. Expected Contributions & Limitations
   - 기여 1: 유인적합 valuation에서 AI 정보 효과 최초 실증 (gap, CoVe 확인)
   - 기여 2: capability–personalization 프레임의 경제실험 검정 (Ch1 vs Ch2 부호역전)
   - 기여 3: AI × 인지능력 이질성 ("AI는 약자를 가장 돕고 동시에 가장 오도")
   - 기여 4: AI 가격앵커를 *알려진 가치(EV)* 기준으로 직접 정량화 (Ch1, λ)
   - 기여 5: Fox CVM-X 21세기 AI 재해석 (Ch2)
   - 한계: 외적 타당성 / Bergman CRT×앵커링 비유의 / AI 금전앵커 생태타당성 /
           cross-sample 보정의 "동일 AI 효과" 가정 / Qin 효과 고이질성(I²≈91–98%)

6. Future Work
   - Ch1↔Ch2 cross-calibration 심화; K-R 진영(WTP-WTA 갭) 별개 후속(v2 archive)

References (17편)
```

---

## 6. 핵심 인용 문헌 (17편)

| 논문 | 역할 |
|---|---|
| Fox et al. (1998) *AJAE* | 가상편의 실재 + **Ch2** *21세기 AI 재해석* 라인 |
| List (2001) *AER* | Cheap talk 비교; 경험자에 둔감 → AI 효과 이질성 가설 |
| Corrigan et al. (2012) *AJAE* | 정보→induced 입찰 왜곡 + **no-feedback 근거**(채널 B) |
| Lee et al. (2020) *AJAE* | ⭐ **Ch1 직접 템플릿**: 인지능력(**RSPM**)×induced deviation (완전계시 29.4% vs 13.4%) |
| Jacquemet et al. (2013) *JEEM* | **induced+homegrown 병렬 설계 선례** + oath robustness |
| Choi et al. (2018) *CJAE* | 한국·nth-price·식품 정보처치(Ch2) + ±15% base rate |
| Plott & Zeiler (2005) *AER* | misconception 통제·훈련 절차 (단 induced는 *분석 안 한* paid practice) |
| Shogren et al. (2001) *JEBO* | **Random nth-price**(off-margin 재참여) — 메커니즘 근거 |
| Lee & Fox (2015) *Econ Letters* | 음수 입찰 → WTP 프레임 차단 근거 |
| Canavari et al. (2019) *ERAE* | 경매 운영·power(½–¼–¼)·BDM lottery 부적합 |
| Zhao & Kling (2001) *Econ Letters* | Commitment cost (known→0 / uncertain>0 → Ch1 vs Ch2) |
| **Bergman et al. (2010) *Econ Letters* 107(1):66–68** | CRT×앵커링 n.s.(p=0.526; CAT는 유의) — 인지능력 조절 탐색적 격하 |
| **Logg, Minson, Moore (2019) *OBHDP* 151:90–103** | Algorithm appreciation (WOA d=0.32–0.44); **self-judgment서 약화** |
| **Dietvorst, Simmons, Massey (2015) *JEP:General* 144(1):114–126** | Algorithm aversion (65%→23% Study 1) + Pre_Aversion 근거 |
| **⭐ Qin et al. (2025) *Psych Bulletin* 151(5):580–599** | **capability–personalization 메타분석(N=82,078) — Ch1 vs Ch2 부호역전 이론 엔진 (d +0.27 / −0.43)** |
| **Spatharioti et al. (2023) arXiv:2307.03744** | LLM 정확→무해/오류→과의존(47% vs 93%) — **A1/A2 실증 선례**(preprint) |
| **Bockstedt & Buckman (2025) *Mgmt Sci* 72(1):323–342** | loss aversion×AI 위임 — Pre_Aversion / 유인 하 appreciation 약화 |

> **CoVe 완료:** Logg·Dietvorst·Bergman (2026-05-28) + Qin·Spatharioti·Bockstedt-Buckman·Lee 등 (2026-05-31, claim-verifier 7/7 SUPPORTED). 상세 `lit_review_ai_valuation_2026-05-31.md` §Post-Flight. BibTeX 통합(Bibliography_base.bib)은 후속 task.

---

## 7. 식별 전략 요약 (심사위원 대비)

| 예상 비판 | 대응 |
|---|---|
| "왜 induced와 homegrown을 나누나?" | induced에 AI를 넣어 채널 B를 *순수* 측정하려면, within-subject 시 induced 앵커가 homegrown으로 carryover → 앵커링 DV 훼손. between 분리로 차단(ADR-011). 같은 모집단 동시수집으로 cross-calibration은 보존 |
| "위험선호와 AI 효과를 어떻게 구분?" (Ch1) | A2 앵커 방향 **±20% 무작위화** → 위험선호는 일관된 한 방향(직교), 앵커링은 방향 따라 갈림(λ). 보조로 Holt–Laury 별도 측정 |
| "앵커링을 어떻게 측정하나?" | Ch1: Bid=α+λ(AI_value−EV), λ>0; Ch2: AnchorDev(T3/T4) vs Generic_ref(T2) |
| "AI 효과인가, 정보량 효과인가?" (Ch2) | 2×2: T1 vs T3(정보량 통제 AI) / T3 vs T4(AI 형식 통제 정보량) 분리 |
| "AI가 나쁘면 AI 전체가 나쁜 건가?" | A1(정확) vs A2(편향) 분리 → "정확 AI는 돕고 편향 AI는 오도" — dose/accuracy 분리 |
| "Qin 프레임을 어떻게 검정?" | 두 차원(역량·개인화 필요성, 1–6) 측정 → Ch1 Q I / Ch2 Q II 위치 확인 + 챕터×AI 부호역전. 역량 인식은 양쪽 高여야 → aversion이 *개인화* 때문임 식별 |
| "Logg/Dietvorst 충돌 아닌가?" | Qin(2025) 메타가 capability×personalization으로 화해; 본 설계가 그 *경제실험* 검정 |
| "Algorithm Aversion이 처치 효과를 희석?" | between 분리(한 챕터만) + Pre_Aversion 사전측정. Aversion 자체가 Ch2(채널 B-3) 검정 대상 |
| "인지능력 조절이 Bergman과 충돌?" | 인정 → 탐색적 등록(연속 RSPM 권장). φ≈0은 "미탐지(inconclusive)"로 보고 |
| "표본이 충분한가?" | Ch1 3-arm ½–¼–¼ + Canavari Eq.1; 상호작용은 연속변수로 검정력 확보. Ch2 v6 기준. 셀당 N은 별도 power ADR |
| "Cheap talk과 뭐가 다른가?" | List(2001) 효과크기로 정량 비교 + AI가 경험자에게도 작동하는지 |
| "이중 앵커링 통제?" (Ch2) | CVM-경매 5분 filler + 사후 "CVM 금액 참고했나?" + SUR 비대칭 검정 |
| "채널 A와 B-1이 등가하지 않나?" (Ch2) | 완전 분리 불가 인정 → Generic AnchorDev로 간접 분리 + mediation; **Ch1(EV 고정)이 채널 B를 외부 식별해 Ch2를 보정**(cross-calibration) |
| "Fox 보정계수와 차이?" | Fox=가상편의 실재 출발점; 본 연구=AI 처치로 인과 메커니즘 규명 + 21세기 재해석 |
| "K-R 검정은 왜 안 하나?" | hypothetical bias(CVM-auction)에 초점; K-R(WTP-WTA 갭)은 별개 phenomena, 후속(v2 archive) |

---

## Recommended Enhancements (본 세션 v2 작업에서 통합)

본 v6 spec에 다음 5개의 작은 보강이 권장됨 (이미 본문에 반영):

1. ✅ **Fox CVM-X "AI 버전" framing** — §Context 및 §6 기여에 명시
2. ✅ **K-R 진영 demoted 단락** — §2-1 및 §Proposal 구조 §2에 명시
3. ✅ **Choi 2018 ±15% effect size** — §3-6 표본 규모 근거에 명시
4. ⏳ **Jacquemet oath 사후 instrument 추가 검토** — §3-5 사후 설문에 oath 강도 측정 (옵션)
5. ⏳ **Lee 2020 RSPM 단축형 추가 측정 검토** — CRT (3문항)에 더해 RSPM 측정 시 *robust* 인지능력 통제 (옵션)

---

## Open Questions

| # | 항목 | 상태 |
|---|---|---|
| Q1 | AI 메시지 prompt 구조·LLM 선택 (GPT-4 vs Claude) | OPEN — pilot 전 prototype 작성 |
| Q2 | T3/T4 AI_price_estimate의 ±20% 변이 디자인 디테일 | OPEN — pilot 후 calibrate |
| Q3 | Filler task 구체적 내용 (인구통계 보충 vs 인지 전환) | OPEN |
| Q4 | Pre-registration 시점 (pilot 이후 vs 일괄) | OPEN |
| Q5 | IRB 신청 시점 | OPEN — 디자인 확정 후 |
| Q6 | 저자명·소속 | OPEN — 프로포절 골격 작성 시 |
| Q7 | Lee 2020 RSPM 추가 측정 여부 | OPEN — 사용자 결정 |
| Q8 | Jacquemet oath 사후 instrument 추가 여부 | OPEN — 사용자 결정 |
| Q9 | Logg/Dietvorst/Bergman 인용 CoVe 검증 | BLOCKED — 다음 세션 |

---

## Next Session Recommendations

1. ~~신규 인용 3편 CoVe 검증~~ ✅ **완료 (2026-05-28)** — 본 spec §Post-Flight CoVe 참조
2. **AI 메시지 prototype 작성** — 5 arms × prompt 구조 (LLM 호출 + 정적 텍스트 고정)
3. **AnchorDev 데이터 구조 명시** — T3/T4의 AI_price_estimate를 시장가 대비 ±20% 변이 설계 디테일
4. **Filler task 5분 콘텐츠 결정** — 인지 부하 없는 task 옵션 (인구통계 vs 주의 전환 game)
5. **프로포절 골격 (Beamer)** 작성 — v6 §1~§7을 4–6장 슬라이드 구조로 매핑
6. **사전등록 초안** — OSF / AsPredicted 양식 (다중비교 위계 명시)

---

## Post-Flight Verification (CoVe) — 2026-05-28

**3편 신규 인용 (Logg 2019, Dietvorst 2015, Bergman 2010) claim-verifier fresh-context fork 검증 완료.**

| 결과 | 수 | 비고 |
|---|---|---|
| PASS | 8 | A1, A3, B1, B2, B3, C1, D1 + B2 (정확한 비교 조건 명시 후) |
| PARTIAL | 1 | A2 (d=0.42는 Exp 1A 특정; 본 spec에서 "d≈0.40, range 0.32–0.44"로 보강) |
| FAIL → 수정 완료 | 1 | B1 venue (SSRN/JPSP → **JEP:General** 144(1):114–126) |
| UNVERIFIABLE | 2 | C2·C3 (Bergman 정확한 p값 paywall — 정성 결과는 secondary sources에서 PASS) |

### 결정적 수정 (본 spec에 반영 완료)

1. ✅ **Dietvorst venue 정정**: v6 원본 "SSRN/JPSP" → 정확한 *JEP:General* 144(1):114–126, DOI 10.1037/xge0000033
   - JPSP (Journal of Personality and Social Psychology) ≠ JEP:General — 완전히 다른 학술지. v6 원본 오류 수정.
2. ✅ **Logg effect size 정확화**: "WOA d=0.42" → "Exp 1A d=0.42, 실험 전체 d=0.32–0.44 범위" (다중 effect size 명시)
3. ✅ **Dietvorst 65%→23% 조건 명시**: "Control 65% → Model-and-Human 조건 23%, Study 1 Figure 3" (정확한 비교 조건 명시; Model-only 조건은 26%로 별개)
4. ✅ **Logg-Dietvorst 정합 명시**: §2-3 B-3에 boundary condition reconciliation 단락 추가 (Logg 2019 p.91 직접 quote 기반)

### 미해결 / 사용자 추후 확인 권고

- **C2/C3 (Bergman 정확 p값)**: secondary sources (Stockholm thesis 2013, JBEP 2017, Roeseler 2019)에서 정성 결과 (CRT × anchoring n.s., CAT × anchoring sig.) 일관 확인. 정확 p값 0.526, 0.043은 *Economics Letters* paywall로 직접 확인 불가. 사용자가 도서관 접근으로 *Bergman, Ellingsen, Johannesson, Svensson (2010) Economics Letters 107(1):66–68* 직접 확인 권고.
- **Bergman replication landscape**: Oechssler et al. (2009)이 CRT-anchoring 무효 결과를 *predates*하여 보고했음. 본 연구 §2-4에서 "single study finding"이 아니라 "consistent finding across ~3-5 studies"로 framing 가능 (단, meta-analytically confirmed는 아님).

### 신규 BibTeX 엔트리 (Bibliography_base.bib 통합 필요)

```bibtex
@article{LoggMinsonMoore2019_algorithmappreciation,
  author = {Logg, Jennifer M. and Minson, Julia A. and Moore, Don A.},
  title = {Algorithm appreciation: People prefer algorithmic to human judgment},
  journal = {Organizational Behavior and Human Decision Processes},
  volume = {151},
  pages = {90--103},
  year = {2019},
  doi = {10.1016/j.obhdp.2018.12.005},
  note = {JAS (Judge Advisor System) paradigm. WOA d=0.32–0.44 across experiments.}
}

@article{DietvorstSimmonsMassey2015_algorithmaversion,
  author = {Dietvorst, Berkeley J. and Simmons, Joseph P. and Massey, Cade},
  title = {Algorithm aversion: People erroneously avoid algorithms after seeing them err},
  journal = {Journal of Experimental Psychology: General},
  volume = {144},
  number = {1},
  pages = {114--126},
  year = {2015},
  doi = {10.1037/xge0000033},
  note = {Forecaster-choice paradigm. Control 65% → Model-and-Human 23% (Study 1 Fig 3).}
}

@article{BergmanEtAl2010_anchoringcognitive,
  author = {Bergman, Oscar and Ellingsen, Tore and Johannesson, Magnus and Svensson, Cicek},
  title = {Anchoring and cognitive ability},
  journal = {Economics Letters},
  volume = {107},
  number = {1},
  pages = {66--68},
  year = {2010},
  doi = {10.1016/j.econlet.2009.12.028},
  note = {CRT × anchoring non-significant (qualitative confirmed via secondary sources; exact p-value behind paywall). CAT × anchoring significant.}
}
```

### 권고

**SAFE TO PROCEED** — 본 spec의 모든 수정 반영 완료. Bibliography_base.bib에 3편 BibTeX entry 통합 후 다음 task (AI 메시지 prototype 등) 진행 가능.

특히 Logg-Dietvorst boundary condition 정합(+ v7의 Qin 2025 메타 일반화)은 본 연구 **between 분리 + Pre_Aversion** 디자인의 *학문적 정당화*를 강화함 — reviewer가 "Algorithm Appreciation/Aversion이 충돌하지 않나?" 질문 시 *Logg 본인의 reconciliation* 및 *Qin capability–personalization*을 인용하여 직접 대응 가능.
