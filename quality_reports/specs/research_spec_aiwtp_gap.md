# Research Specification: AI Information, Hypothetical Bias & WTP Measurement

**Date:** 2026-05-28 (v6 — promoted to main spec, 2026-05-27 user-prepared)
**Researcher:** 이도현 (leedohyeon@kakao.com)
**Working language:** 한국어 본문 + 영문 전문용어
**Paper type:** survey-experiment (single integrated 5-arm 2-phase design + SUR parallel)
**용도:** 지도교수·동료 피드백용 내부 문서
**상태:** **PROMOTED to main spec** (v2 archived as companion follow-up note)

### 버전 history

- **v1 (2026-05-26)**: WTP-WTA 갭 + K-R 5-channel framing — superseded
- **v2 (2026-05-27)**: Two-Study cross-calibration — *archived* as `research_spec_companion_v2_archived.md` (후속 연구 노트로 보존)
- **v6 (2026-05-28)**: ⭐ **AI × Hypothetical Bias (CVM-auction) gap, 5-arm 2-phase + SUR병렬 + Competing Mediation** — *본 문서, 메인 spec*

### 관련 ADR

- ADR-001 (between-subject) — 유지
- ADR-002 (SPA single mechanism) — 유지 (Random nth-price로 v6에서 미세 조정 가능)
- ADR-003 (static AI text) — 유지
- ADR-005 (Two-study cross-calibration) — **SUPERSEDED by ADR-010**
- **ADR-010 (NEW)**: v2 → v6 pivot — Hypothetical bias framing 채택

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

**핵심 기여 (one central contribution):**

> "This paper provides the first experimental test of whether AI-personalized information reduces or distorts hypothetical bias in WTP elicitation, distinguishing the Bayesian updating channel (AI → reduced uncertainty → higher auction bid → smaller gap) from three behavioral distortion channels (anchoring, information overload, and algorithm appreciation/aversion). Using a 5-arm two-phase design with induced-value benchmarks, we show that the optimal AI information dose depends on consumer cognitive ability."

> **본 연구의 framing**: Fox et al. (1998) CVM-X 라인의 21세기 AI 재해석 — *hypothetical bias의 calibration tool*로서 AI 정보를 평가한다.

---

## 1. 연구 질문 (Research Question)

> Does AI-personalized product information reduce hypothetical bias in WTP elicitation,
> or does it distort valuations through anchoring, information overload, or algorithm bias?
> And how does this depend on information source (AI vs. generic), information quantity,
> and consumer cognitive ability?

**세부 질문:**

- Q1: AI 개인화 정보는 일반 정보 대비 가상편의를 더 줄이는가? (정보원 효과)
- Q2: 정보량이 많을수록 가상편의가 감소하는가, 아니면 역전하는가? (정보량 효과)
- Q3: AI × 고정보량 조합에서 앵커링/과부하/자동화 편향으로 갭이 오히려 증가하는가? (상호작용 효과)
- Q4: 인지능력(CRT) 낮은 집단에서 행동경제학 채널이 더 강하게 나타나는가? (탐색적 이질성)

---

## 2. 이론적 프레임워크

### 2-1. 가상편의 (Hypothetical Bias)

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
사전 AI 경험 없음 → Algorithm Appreciation 우세 (Logg et al. 2019)
  → AI 추천 무비판적 수용 → 경매 WTP 왜곡
Phase 1에서 AI 앵커값 ≠ 유도가치 → 부분 오류 노출
  → Algorithm Aversion 유발 가능 (Dietvorst et al. 2015)
  → Phase 2에서 AI 정보 신뢰도 급락 → T3/T4 처치 효과 약화
  → 오염 위험 → Phase 1 중립화로 차단
```

**Logg-Dietvorst 정합 (boundary condition, v6-CoVe 보강):**
Logg et al. (2019)이 본 paper의 §Introduction(p.91)에서 Dietvorst et al. (2015)와의 관계를 *직접 reconciliation*: 두 결과는 *직접 충돌*이 아니라 *조건부 boundary*. Appreciation은 *default* (오류 관측 *전*), Aversion은 *조건부* (오류 관측 *후* + self-comparison context).
→ 본 연구의 Phase 1 중립화는 이 boundary condition을 *명시적으로* 적용 — Phase 1에서 AI 오류 노출을 차단하여 Appreciation default를 유지, Phase 2에서만 처치 효과 측정.

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
이론적 방향(탐색적 예측):

고CRT (System 2 dominant):
  AI 상세 정보 → 정교한 처리 → Bayesian 업데이트 → 갭 ↓

저CRT (System 1 dominant):
  AI 상세 정보 → 과부하/앵커링 → WTP 왜곡 → 갭 왜곡

실증 근거의 한계: Bergman et al.이 CRT×anchoring을 직접 반박하므로
  φ₃의 방향은 가설이 아닌 탐색적 발견으로 보고.
```

### 2-5. 핵심 예측표 (2×2 처치 × 채널)

| 조건 | 채널 A 예측 | 채널 B 예측 | 식별 비교 |
|---|---|---|---|
| Generic × Low (T1) | 갭 소폭 ↓ | 변화 미미 | T1 vs. T0 |
| Generic × High (T2) | 갭 ↓ | 과부하로 분산↑ | T2 vs. T1 |
| AI × Low (T3) | 갭 ↓ (개인화 효과) | Appreciation → 갭 변동 | T3 vs. T1 |
| AI × High (T4) | 갭 더 ↓ | 앵커링+과부하+편향 → 갭↑ | T4 vs. T3, T4 vs. T2 |
| T4 × 저CRT (탐색) | 갭 ↓ (작게) | 갭↑ (크게) | 상호작용항 φ₃ |
| T4 × 고CRT (탐색) | 갭 ↓ (크게) | 갭 ↓ (작게) | 상호작용항 φ₃ |

---

## 3. 실험 설계 — 2단계 + 벤치마크 구조

### 3-1. 전체 구조 (v5 수정)

```
┌──────────────────────────────────────────────────────────────┐
│ PHASE 1: Induced Value (벤치마크·훈련 단계) [중립화]          │
│  - 모든 집단(T0~T4) 동일 중립 조건 (처치 없음)              │
│  - 경매 메커니즘 교육 + 연습 → Plott & Zeiler(2005) 기준    │
│  - Induced value 경매 5라운드 (연구자 부여 진짜 가치)         │
│  - 측정: Deviation = |Bid - TrueValue| (벤치마크용)          │
│  ※ Phase 1에서는 AI 정보 제공 없음 → Algorithm Aversion 차단 │
└───────────────────────┬──────────────────────────────────────┘
                        ↓ (동일 피험자)
┌──────────────────────────────────────────────────────────────┐
│ PHASE 2: Homegrown Value (본 실험) [처치 → CVM → 경매]       │
│  Step 1: 처치 자료 제공 (집단별 T0~T4)                       │
│  Step 2: CVM WTP 유도 (가상 구매 시나리오)                   │
│  Step 3: 실험경매 WTP 유도 (Random nth-price, 5라운드)       │
│  Step 4: 사후 설문                                           │
│  측정: Bias = WTP_CVM - WTP_auction                          │
│  측정: AnchorDev = Bid_auction - AI_suggested_value (T3/T4)  │
└───────────────────────┬──────────────────────────────────────┘
                        ↓
┌──────────────────────────────────────────────────────────────────────┐
│ BENCHMARK COMPARISON (2열 매트릭스)                                   │
│  열①: Phase 1 Induced Value Deviation (경매 메커니즘 숙련도 기준)    │
│  열②: Lee et al.(2020) CRT 집단 분산비 대비 처치별 분산비 비교       │
└──────────────────────────────────────────────────────────────────────┘
```

**Phase 1 중립화 이유:**

- v4에서 T3/T4는 Phase 1에서 AI 정보를 받아 25분간 앵커링 노출 → Phase 2 처치 순수 효과 오염
- 중립화 시 모든 집단이 동일한 경매 숙련도를 갖추고 Phase 2로 진입 → Plott & Zeiler(2005)의 등가 절차 원칙 충족
- Algorithm Aversion(Dietvorst et al. 2015): Phase 1에서 AI 앵커값 ≠ 유도가치 노출 시 Phase 2 신뢰도 급락 위험 → 중립화로 차단

**CVM 타이밍 수정 이유:**

- v4에서 CVM이 처치 전 → Bayesian 채널(AI→CVM WTP 변화)이 작동 불가, Bias 측정 자체가 AI 효과를 포착 못함
- v5에서 처치 → CVM → 경매 순서 → CVM도 처치 후 측정, Bias = WTP_CVM - WTP_auction이 처치 효과 반영

### 3-2. 처치 집단 (5-arm: T0 기준 + 2×2 팩토리얼)

```
                   정보량 低 (요약)        정보량 高 (상세)
                 ┌────────────────┬────────────────┐
정보원: Generic  │  T1 (n=50)     │  T2 (n=50)     │
                 │ 비개인화 요약  │ 비개인화 상세  │
                 ├────────────────┼────────────────┤
정보원: AI       │  T3 (n=50)     │  T4 (n=50)     │
                 │ AI 요약·개인화 │ AI 상세·개인화 │
                 └────────────────┴────────────────┘
T0 (n=50): 기본 설명만 (100자 내외) — 기준선
총 5개 집단, 총 n=250
```

**식별 핵심 비교:**

- T1 vs. T3: AI 개인화 효과 (정보량 低 통제) → AI 순수 효과
- T2 vs. T4: AI 개인화 효과 (정보량 高 통제) → 과부하 환경에서의 AI 효과
- T1 vs. T2: 정보량 효과 (Generic 통제) → 과부하 임계점 (비AI 조건)
- T3 vs. T4: 정보량 효과 (AI 통제) → 앵커링/과부하 임계점 (AI 조건)
- T0 vs. (T1~T4): 정보 유무 효과 전체
- **핵심 조건: T4 (AI × High)** — Bayesian vs. 채널 B(B-1/B-2/B-3) 직접 관찰

### 3-3. 제품 선택

**확정: 기능성 건강식품 (Functional Health Food / Dietary Supplement)**

예시: 프로바이오틱스 / 오메가-3 / 멀티비타민 복합 제품 (1개월분)

선정 근거:

- **신뢰재(credence good):** 효능을 소비 후에도 직접 검증하기 어려움 → AI 정보의 불확실성 감소 효과 전제 충족 (Bayesian 채널 작동 조건)
- **AI 개인화 자연스러움:** 건강 상태·식이 패턴·부족 영양소 → AI 맞춤 추천이 실제 서비스로 존재 (현실 타당성 + Algorithm Appreciation 발생 조건)
- **시장 가격 존재:** 실험 경매 가격대 설정 가능, Induced value 설계 자연스러움
- **국내 규제 문제 없음:** 배양육과 달리 이중 가상 문제(double hypothetical) 없음
- **정보량 조작 용이:** 저정보(효능 요약 3문장) vs. 고정보(성분 수치, 흡수율, 개인 건강 점수, 임상 근거 포함)

**AI 정보 형식 구체화:**

```
T1 (Generic × Low):
  "이 제품은 장 건강, 면역력, 피로 회복에 도움을 줄 수 있습니다.
   하루 1회 1포 복용을 권장합니다. 식약처 기능성 인정 원료 포함."

T2 (Generic × High):
  [성분표 전체 + 원료별 임상 근거 요약 + 부작용 가능성 + 복용 주의사항]
  → 수치·통계 포함, 1페이지 분량

T3 (AI × Low):
  "귀하의 건강 프로필(소화 예민, 비타민D 부족, 중간 활동량)을 기반으로
   이 제품은 귀하에게 적합도가 높습니다. 프로바이오틱스 함량이
   귀하의 권장 섭취량 기준 87%를 충족합니다."

T4 (AI × High):
  [위 T3 요약 + 개인 건강 점수 시각화 + 성분별 개인 적합도 %, 
   비교 제품 대비 순위, 예상 효과 발현 기간, 유전·생활 패턴 기반 반응률]
  → 수치 앵커 다수 포함 (앵커링 채널 B-1의 조작 변수)
```

**앵커값 설계 (v6 재정의):**

- T3/T4: "AI 추정 적정 가치: XX,XXX원"을 정보 하단에 명시 포함 → AnchorDev = Bid - AI_price_estimate
- T2: "이 제품의 시장 평균가: XX,XXX원"을 정보 하단에 명시 포함 → AnchorDev_generic = Bid - Generic_price_ref
- AI 추정 가치는 실험 내에서 체계적으로 변이: 피험자별 시장가 대비 +20% 또는 -20%로 배정
  → 앵커링이 작동하면 AnchorDev가 앵커 방향(+/-) 따라 이동 → 방향성 검증 가능
- 생태적 타당성 한계: 실제 AI 추천 앱이 금전적 가치를 직접 제시하는 경우는 드묾 → Limitation 명시

### 3-4. 경매 메커니즘

**Random nth-price auction** (Shogren et al. 2001; Choi, Lee et al. 참조)

- Phase 1에서 충분한 훈련 후 Phase 2 진입 → Plott & Zeiler(2005) 기준 충족
- IPV(독립 개인 가치) 가정: T3/T4에서 AI 공통 앵커 제공 시 IPV 위협 가능
  → 사후 설문에서 "다른 참가자의 AI 정보를 의식했는가" 점검 (manipulation check 확장)
- 조작 점검: "AI가 실제로 분석했다고 믿는 정도" 1-7점

### 3-5. 실험 절차 (v5 수정)

```
1. 사전 설문 (10분)
   - 건강 프로필 (5-10문항): 소화, 활동량, 영양 부족 항목, 복용 이력
     → AI 처치 집단(T3/T4)의 개인화 정보 생성에 활용
   - CRT (3문항) → 인지능력 측정 (연속변수 및 중앙값 기준 이분, 탐색적)
   - 건강기능식품 친숙도 / 구매 경험 빈도 (경험 수준 통제)
   - AI 추천 서비스 이용 경험 (통제변수)
   - [신규] Pre_Aversion: "과거 AI 추천이 틀린 경험 여부 + 빈도" (1-7점 연속)
     → Dietvorst et al.(2015) 기반: 사전 aversion 수준 통제

2. PHASE 1: Induced Value / 훈련 (25분) [전 집단 동일 중립 조건]
   - 경매 메커니즘 교육 (Random nth-price auction 원리)
   - 연습 라운드 3회 (유사 제품, AI 정보 없음)
   - Induced value 경매 5라운드 (연구자 부여 진짜 가치, AI 정보 없음)
   - 측정: Deviation_i = |Bid_i - TrueValue_i| (경매 숙련도 벤치마크)
   ※ 모든 집단 동일 절차 — 처치 차별 없음

3. PHASE 2: Homegrown Value (30분)
   Step 1: 처치 자료 제공 (집단별 T0~T4)
           → T3/T4: AI 개인화 정보 화면 표시 (건강 프로필 기반)
           → T1/T2: Generic 정보 동일 분량 제공
           → T0: 기본 제품 설명 100자

   Step 2: CVM WTP 유도
           → 가상 구매 시나리오 (인터넷 쇼핑몰 화면 제시)
           → "지금 이 제품을 실제로 구매한다면 최대 얼마를 지불하겠습니까?"
           → WTP_CVM,i 기록

   Step 2.5: Filler Task (5분) [v6 신규]
           → CVM 응답이 경매의 내적 앵커로 작동하는 순서 효과 차단
           → 무관한 인구통계 보충 문항 또는 주의 전환 과제 (인지 부하 없음)
           → 단기 기억에서 CVM 응답 금액 희석

   Step 3: 실험경매 WTP 유도 (Random nth-price, 5라운드)
           → WTP_auction,i 기록
           → T3/T4: AnchorDev_i = Bid_i - AI_price_estimate_i 계산
           → T2: AnchorDev_generic_i = Bid_i - Generic_price_ref_i 계산

   Step 4: 사후 설문 (10분)
           - 주관적 불확실성 감소 여부 (1-7점) → 채널 A 매개 측정
           - AI 신뢰도 (1-7점)
           - [B-1] 앵커링 점검: "AI 제시 가격이 입찰에 영향을 줬나" (1-7점)
           - [B-1] 순서 효과 점검: "CVM에서 응답한 금액을 경매에서 참고했나" (1-7점) [v6 신규]
           - [B-2] 정보 과부하: "정보가 너무 많아 판단이 어려웠나" (1-7점)
           - [B-3] Algorithm Appreciation: "AI 분석이 인간 전문가보다 더 신뢰됐나" (1-7점)
           - IPV 점검: "다른 참가자 AI 정보를 의식했나" (1-7점)
           - Manipulation check: "AI가 실제로 나를 분석했다고 믿나" (1-7점)

총 소요시간: 약 75-80분
```

### 3-6. 표본 규모

- 집단당 n=50명 → 총 250명 (5-arm)
- 파워 분석 기준: Fox et al.(CVM-X) 가상편의 크기에서 도출한 효과 크기 (Bias의 표준편차를 활용한 집단 간 차이 검정)
- Choi et al. (2018) ±15% 정보 효과 크기를 base rate로 활용 (한국 lab 셋팅 정합)
- CRT 이질성 분석(탐색적): 2×2×2 — 각 셀 최소 n≈25, 탐색적 분석으로 사전 등록
- Pre_Aversion: 연속변수 처리 시 표본 규모 변동 없음 (n=250 유지)
- Phase 1 편차 분석: Lee et al.(AJAE) 인지능력 집단별 분산 참고

---

## 4. 분석 전략

### 4-1. Phase 1: Induced Value 분석 (경매 숙련도 벤치마크)

```
Deviation_i = |Bid_i - TrueValue_i|

Phase 1 중립화 후: 집단 간 Deviation 차이 없어야 정상
  → 집단 간 차이 발생 시: 랜덤 배정 실패 확인

Deviation_i = α + β₁·T1_i + β₂·T2_i + β₃·T3_i + β₄·T4_i + γX_i + ε_i

예측: β₁ = β₂ = β₃ = β₄ ≈ 0 (중립화 성공 시)

인지능력 분산비 벤치마크 (열②) [RSPM 기준 — §2-4 정정 노트 참조]:
  Var_ratio = SD_low / SD_high (Phase 1 조건)
  → Lee et al.(2020): 저인지 deviation·변동 ↑ (완전계시 13.4% vs 29.4%)
    [구 "≈ 3배"는 본문 근거 없음 — 2026-05-31 정정]
```

### 4-2. Phase 2: Homegrown Value 분석 (주 분석 — 2×2 팩토리얼 + SUR 병렬)

```
【주 분석 A】 Bias 회귀 (가상편의 문헌 표준)
─────────────────────────────────────────

Bias_i = WTP_CVM,i - WTP_auction,i

주 모형:
  Bias_i = α + β₁·T1_i + β₂·T2_i + β₃·T3_i + β₄·T4_i
             + γ·Pre_Aversion_i + δX_i + ε_i

2×2 팩토리얼 분해:
  Bias_i = α + δ_source·AI_i + δ_amount·High_i
             + δ_interaction·(AI_i × High_i)
             + γ·Pre_Aversion_i + δX_i + ε_i

핵심 가설:
  δ_source < 0:       AI 개인화가 가상편의 감소 (채널 A)
  δ_amount < 0:       정보량 증가가 가상편의 감소 (채널 A)
  δ_interaction > 0:  AI × High = 채널 B 지배 (앵커링/과부하/편향)
  β₄ > 0:            AI × High (T4)에서 오히려 갭 증가

【주 분석 B】 SUR 병렬 회귀 (채널 A 비대칭 이동 검증) [v6 핵심 추가]
─────────────────────────────────────────────────────────────────

WTP_CVM,i   = α₁ + β₁_CVM·T_i   + γ₁X_i + ε₁_i
WTP_auction,i = α₂ + β₁_auc·T_i + γ₂X_i + ε₂_i

SUR(Seemingly Unrelated Regression)로 두 방정식 동시 추정
→ H₀: β_treatment_CVM = β_treatment_auction (동일 이동)
→ H₁: β_treatment_auction > β_treatment_CVM (경매가 더 크게 반응 = 채널 A)

해석:
  β_auction > β_CVM: AI가 경매 WTP를 더 크게 올림 → Bayesian 채널 비대칭 이동 확인
  β_auction ≈ β_CVM: 두 WTP 동일 이동 → 이중 앵커링 가능성, Bias 회귀가 효과를 놓침
  β_auction < β_CVM: AI가 CVM을 더 올림 → 채널 B의 CVM 과장 효과

※ 추가 표본 불필요, n=250 유지. Bias 회귀(주 분석 A)와 병렬 보고.

【앵커링 직접 측정】 (T2/T3/T4)
─────────────────────────────────────────

  AnchorDev_i     = Bid_auction,i - AI_price_estimate_i    (T3/T4)
  AnchorDev_gen_i = Bid_auction,i - Generic_price_ref_i    (T2)

  AI 고유 앵커링 = AnchorDev_T4 - AnchorDev_gen_T2

  → 두 값이 0에 수렴 시 채널 B-1(앵커링) 작동
  → T4 vs. T2 비교로 AI 개인화가 앵커링을 심화시키는지 분리
```

### 4-3. 이질성 분석 — 2×2×2 (탐색적, 사전 등록)

```
처치(2×2) × CRT(고/저) 상호작용 분석 [Bergman et al.(2010) 반박 수용 → 탐색적]:

Bias_i = α + δ_source·AI_i + δ_amount·High_i + δ_int·(AI_i × High_i)
           + φ_CRT·CRT_low_i
           + φ₁·(AI_i × CRT_low_i)
           + φ₂·(High_i × CRT_low_i)
           + φ₃·(AI_i × High_i × CRT_low_i)
           + γ·Pre_Aversion_i + δX_i + ε_i

핵심 계수: φ₃ (탐색적 발견으로 보고)
  φ₃ > 0이면: 저CRT 집단에서 T4(AI × High)의 왜곡 효과 더 강함
               → 채널 B가 System 1 집단에 집중됨
  φ₃ ≈ 0이면: Bergman et al.(2010)과 일관 — CRT는 조절자가 아님
               → 채널 B의 이질성은 CRT 이외 변수로 설명 필요

**φ₃ 통계적 한계 및 해석 지침 (v6 추가):**
- 셀당 n≈25는 3-way interaction 탐지에 심각하게 underpowered
- Simonsohn(2014): interaction 검정은 main effect의 ~16배 표본 필요
- φ₃ ≈ 0이어도 "Bergman et al.과 일관"으로 단정 금지 → "미탐지(inconclusive)"로 보고
- 사전 등록에 φ₃ 파워 분석 별도 보고 (주 효과 파워와 분리)
- 대안: CRT 이분화 대신 **CRT 연속변수 interaction**으로 파워 개선 검토

**구매 경험 Moderator 분석 (v6 신규, 탐색적):**
  Bias_i = ... + ψ·(AI_i × Experience_high_i) + ...
  ψ < 0: 경험자에게 AI 효과 약함 → credence 가정 약화
  ψ ≈ 0: 경험 무관 → credence 가정 유지

2×2×2 결과 요약표:
         │ Low CRT               │ High CRT              │
─────────┼───────────────────────┼───────────────────────┤
Gen×Low  │ Bias_T1_CRTlow        │ Bias_T1_CRThigh       │
Gen×High │ Bias_T2_CRTlow        │ Bias_T2_CRThigh       │
AI×Low   │ Bias_T3_CRTlow        │ Bias_T3_CRThigh       │
AI×High  │ Bias_T4_CRTlow (↑?)  │ Bias_T4_CRThigh (↓?) │
```

### 4-4. 다중비교 위계 및 사전등록 프로토콜 (v6 신규)

```
【1단계: Confirmatory (주 가설)】
  대상: 2×2 팩토리얼의 3개 계수 (δ_source, δ_amount, δ_interaction)
  보정: Holm correction
  판단 기준: Holm-adjusted p < 0.05

【2단계: Structured Secondary (핵심 보조)】
  대상: SUR 비대칭 이동 검정 (β_auction vs. β_CVM)
        4경로 Mediation → 개별 경로 p가 아닌 nested model comparison
  보정: FDR (Benjamini-Hochberg)

【3단계: Exploratory (탐색적)】
  대상: φ₃ (CRT 3-way interaction), ψ (Experience moderator)
  보정: 없음. 탐색적 발견으로만 보고
  해석 주의: φ₃ ≈ 0 → "미탐지(inconclusive)", "Bergman et al.과 일관" 표현 금지
```

### 4-6. 메커니즘 검증 (Competing Mediation)

```
경로 A (채널 A, Bayesian):
  T3 → 주관적 불확실성↓ → WTP_auction↑ → Bias↓

경로 B-1 (앵커링):
  T4 → 앵커링 점수↑ → AnchorDev ≈ 0 → Bias 왜곡

경로 B-2 (과부하):
  T4 → 과부하 점수↑ → Bid 분산↑ → Bias↑

경로 B-3 (자동화 편향):
  T3/T4 × Pre_Aversion 낮음 → Appreciation 점수↑ → Bid 왜곡
```

**경쟁 매개 모형 (Competing Mediation, v6 추가):**

채널 A와 B-1이 관측적으로 등가하므로, 두 매개변수를 **동시 투입**하여 상대적 강도를 추정:

```
WTP_auction_i = α + Treatment_i·γ
                + a_A · Uncertainty_decrease_i  (채널 A 매개)
                + a_B · Anchoring_score_i        (채널 B-1 매개)
                + δX_i + ε_i

간접효과 비교:
  채널 A 강도: a_A × (Treatment → Uncertainty 경로)
  채널 B-1 강도: a_B × (Treatment → Anchoring 경로)
  두 간접효과의 차이 검정 → 어느 채널이 지배적인지 판별
```

기여 재프레이밍: "채널의 완전 분리" → **"두 채널의 상대적 크기 추정 및 조건부 우세 판별"**

### 4-5. 벤치마크 비교 — 2열 매트릭스 (v6: 열② 제거) [내부 벤치마크만 유지]

```
┌────────────┬───────────────────────┬────────────────────────┐
│ 처치 집단  │ ① Phase 1             │ ② Lee et al.(2020)     │
│            │ Induced Value Dev     │ CRT 분산비             │
├────────────┼───────────────────────┼────────────────────────┤
│ T0 (기준) │ Dev_T0 (문헌 기준)   │ SD_low/SD_high = ?     │
│ T1 Gen×Lo │ Dev_T1 ≈ Dev_T0      │ Var_ratio_T1           │
│ T2 Gen×Hi │ Dev_T2 ≈ Dev_T0      │ Var_ratio_T2           │
│ T3 AI×Lo  │ Dev_T3 ≈ Dev_T0      │ Var_ratio_T3           │
│ T4 AI×Hi  │ Dev_T4 ≈ Dev_T0      │ Var_ratio_T4 (최대?)   │
└────────────┴───────────────────────┴────────────────────────┘

열① Phase 1 Deviation (내부 벤치마크):
  - 집단 간 Dev 차이 없음 → 경매 숙련도 동등 확인 (조작 점검)
  - Dev가 집단별로 같아야 Phase 2 Bias 차이가 처치 효과로 귀인 가능

열② Lee et al.(2020) 인지능력(RSPM) 분산비 (내부 벤치마크):
  - Lee et al.: 저인지(RSPM) 집단이 induced value에서 deviation·변동 더 큼
    [정정 2026-05-31: 정확 "3×" 수치는 본문 근거 없음; 완전계시 13.4% vs 29.4%]
  - 우리 연구: 처치별 Var_ratio = SD_low / SD_high (Phase 2 auction WTP), RSPM 기준
  - T4(AI × High)에서 Var_ratio가 T0 대비 증가하면:
    "AI 상세 정보가 저CRT 집단의 입찰 불안정성을 증폭" → 채널 B-2 이질성 확인

※ 구 열② (List 2001 cheap talk 대비) 제거 이유 [v6]:
  - 본 연구가 cheap talk 처치군을 직접 포함하지 않으므로,
    서로 다른 표본·제품·시기의 효과 크기 단순 나열 → 체계적 벤치마크가 아님
  - → Discussion 섹션에서 "문헌 대비 효과 크기 비교"로 서술 (illustrative)
  - Cheap talk(동기적 메커니즘)과 AI 정보(인지적 메커니즘)의 이론적 구분은
    이론 섹션(섹션 2)에서 별도 단락으로 다룸
```

---

## 5. Proposal 논문 구조

```
1. Introduction (1.5p)
   - Hook: AI 추천이 소비자 의사결정을 개선한다는 통념(Logg et al. 2019) vs.
           Corrigan et al.: 정보가 demand revelation을 악화시킴 + Dietvorst et al.: aversion
   - Puzzle: AI는 cheap talk인가, 앵커인가, 아니면 신뢰 과잉인가?
   - Research Q: AI 정보원·정보량·인지능력이 교차하는 지점에서
                 가상편의가 어떻게 달라지는가?
   - Preview: 5-arm (T0 + 2×2), 2-phase(중립화+순서 수정), 2열 벤치마크 설계
   - Framing: Fox et al. (1998) CVM-X 라인의 21세기 AI 재해석

2. Theoretical Framework (1.5p)
   - 가상편의 이론 (Fox et al.을 실재 근거로만 인용)
   - 채널 A: Bayesian 업데이트 (처치 후 경매 WTP 상승 경로)
   - 채널 B: 3개 행동경제학 왜곡 채널 (B-1 앵커링, B-2 과부하, B-3 Algorithm Bias)
   - 인지능력의 조절 역할 (Lee et al. AJAE, Bergman et al. 2010 — 탐색적)
   - K-R 진영 demotion: Kőszegi-Rabin 2006 / Heffetz-List 2014 / Campos-Mercade 2026 RES
     ("본 연구는 별개 phenomena인 hypothetical bias에 초점")
   - 2×2 예측표 (정보원 × 정보량 × 채널)

3. Experimental Design (2.5p)
   - 2단계 설계 논리:
     Phase 1 중립화(경매 숙련도 동등화) → Phase 2 처치→CVM→경매 순서
   - 5-arm 2×2+T0 처치 및 식별 전략
   - 제품: 기능성 건강식품 / AI 정보 형식 구체화
   - Pre_Aversion 변수 설계 (Dietvorst et al. 근거)
   - 절차 및 표본 (n=250)

4. Analysis Plan (1p)
   - Phase 1: Deviation 집단 비교 (중립화 점검) + CRT 분산비 기준선
   - Phase 2: 주 회귀 (2×2 팩토리얼) + Pre_Aversion 통제
   - 이질성 (2×2×2, 탐색적) + AnchorDev 직접 측정
   - 벤치마크 비교 매트릭스 (2열)
   - Mediation (4경로: A, B-1, B-2, B-3) — Competing mediation

5. Expected Contributions & Limitations (0.5p)
   - 기여 1: AI 정보의 양면성 최초 실증 (채널 A vs. 채널 B 3개 하위 채널)
   - 기여 2: 2×2 팩토리얼로 정보원·정보량 효과 분리
   - 기여 3: CRT × 처치 2×2×2 탐색적 이질성 분석
   - 기여 4: AI 생성 가격 앵커의 WTP 효과 직접 정량화
             (범위: "가상편의 맥락에서 AI 금전 앵커를 직접 측정한 최초의 시도"로 한정.
              Ariely et al.(2003)의 임의적 일관성 실험과의 차별점: AI 개인화 맥락 + 가상편의 갭 측정)
   - 기여 5: Algorithm Appreciation → WTP 왜곡 연결 메커니즘 이론화
             (advice-taking → value elicitation 프레임 설정 경로 명시)
   - 기여 6: Fox et al. (1998) CVM-X 라인의 21세기 AI 재해석
   - 한계: 실험실 → 현장 외적 타당성 / CRT×앵커링 비유의 가능성(Bergman et al.) /
           AI 금전 앵커 명시가 생태적 타당성 약화 / 채널 A·B-1 완전 분리 불가(관측적 등가성)

6. Future Work
   - Companion study: induced value setting에서의 AI source effect 직접 측정
     (v2 archive 참조 — Lee 2020 직접 후속의 별도 paper로 확장 가능)

References (13편)
```

---

## 6. 핵심 인용 문헌 (13편)

| 논문 | 역할 |
|---|---|
| Fox et al. (CVM-X, 1998) | 가상편의 실재 근거 + 본 연구의 *21세기 AI 재해석* 라인 |
| List (2001) *Economic Inquiry* | Cheap talk 비교 대상: AI 효과 크기를 CT 효과 배수로 표현 |
| Corrigan et al. (2012) | 핵심 경고: 정보가 demand revelation 악화 가능 → 채널 B 근거 |
| Lee et al. (2020) *AJAE* | 인지능력(**RSPM**) × 입찰 deviation (벤치마크: 완전계시 29.4% vs 13.4%) + Companion study 직접 전신 |
| Jacquemet et al. (2013) *JEEM* | Oath 비교 장치 (cheap talk 대안 메커니즘 비교) + post-experiment robustness |
| Choi, Lee et al. (2018) *CJAE* | 한국 맥락: 정보 → WTP 이질성 증가 (쌀 등급) + ±15% effect size base rate |
| Plott & Zeiler (2005) *AER* | Phase 1 중립 절차 기준 (등가 절차 원칙) |
| Shogren et al. (2001) *JEBO* | Random nth-price auction 메커니즘 |
| Zhao & Kling (2001) | Commitment cost 이론 (가상편의 배경 이론) |
| Lee & Fox (2015) *Economics Letters* | 경매 설계 방법론 |
| **Bergman, Ellingsen, Johannesson, Svensson (2010) *Economics Letters* 107(1):66–68** | **CRT × 앵커링 비유의(p=0.526, 정성 일치 확인 / 정확 p값은 paywall) — CRT 이질성 탐색적 격하 근거. CAT(Cognitive Ability Test) × 앵커링은 유의** |
| **Logg, Minson, Moore (2019) *OBHDP* 151:90–103** | **Algorithm appreciation 실증(JAS paradigm, WOA d=0.32–0.44 across exps; benchmark Exp 1A d=0.42) — 채널 B-3 근거** |
| **Dietvorst, Simmons, Massey (2015) *JEP:General* 144(1):114–126** | **Algorithm Aversion 실증(forecaster-choice paradigm, 65%→23% Study 1) — 채널 B-3 + Pre_Aversion 설계 근거** |

> **CoVe verification 미완료**: Logg 2019, Dietvorst 2015, Bergman 2010 — 본 세션의 사전 CoVe 라운드에서 검증되지 않은 *신규* 인용 3편. Bibliography 통합 전 별도 CoVe round 필요 (다음 세션 task).

---

## 7. 식별 전략 요약 (심사위원 대비)

| 예상 비판 | 대응 |
|---|---|
| "AI 효과인가, 정보량 효과인가?" | 2×2 팩토리얼: T1 vs. T3 (정보량 통제 AI 효과) / T3 vs. T4 (AI 형식 통제 정보량 효과) 분리 |
| "앵커링을 어떻게 측정하나?" | AnchorDev = Bid - AI_price_estimate (T3/T4) + AnchorDev_generic (T2) → AI 고유 앵커링 분리. 사전에 AI가 금전적 추정 가치를 명시 제공 |
| "Cheap talk과 뭐가 다른가?" | List(2001) 효과 크기 단위로 AI 효과를 정량 표현 + AI는 경험자에게도 작동하는지 검증 |
| "T4가 나쁘면 AI 전체가 나쁜 건가?" | T3(AI × Low)와 T4(AI × High) 분리 → 최적 정보량 제안 가능 |
| "Fox 보정계수랑은 어떻게 다른가?" | Fox et al.은 '가상편의가 실존한다'는 출발점 근거. 본 연구는 갭의 인과 메커니즘을 AI 처치로 규명하는 것이 목표. 본 연구는 CVM-X의 *21세기 AI 재해석* |
| "Corrigan처럼 왜곡이 생기면?" | 왜곡이 생기면 채널 B가 지배적임을 확인하는 것 자체가 기여. T4 결과가 음수든 양수든 해석 가능 |
| "CRT 이질성 주장이 Bergman et al.과 충돌하지 않나?" | 충돌 인정. 따라서 2×2×2는 confirmatory가 아닌 탐색적으로 사전 등록. φ₃ ≈ 0이어도 일관된 결과로 보고 |
| "Phase 1 처치 노출이 없으면 Induced value 앵커링 측정이 안 되지 않나?" | AnchorDev는 Phase 2 경매에서 직접 측정. Phase 1 Deviation은 순수 숙련도 벤치마크로만 사용 |
| "Algorithm Aversion이 처치 효과를 희석시키지 않나?" | Phase 1 중립화 + Pre_Aversion 사전 측정으로 통제. Aversion 자체가 채널 B-3의 실증 대상 |
| "표본이 충분한가?" | 주 분석(2×2 팩토리얼)은 n=250 적절. φ₃(3-way interaction)은 셀당 n=25로 underpowered → 탐색적 사전 등록 + 파워 분석 별도 보고. φ₃≈0은 "Bergman et al.과 일관"이 아닌 "미탐지"로 보고 |
| "이중 앵커링을 어떻게 통제하나?" | CVM-경매 간 5분 filler task 삽입 + 사후 설문 "CVM 금액을 경매에서 참고했나?" + SUR로 CVM/경매 WTP 이동의 비대칭성 검정 |
| "채널 A와 B-1이 관측적으로 등가하지 않나?" | 맞음. 완전 분리 불가 — 인정하고 Limitation에 명시. 최소한 T2 AnchorDev_generic을 통해 AI 고유 앵커링 효과를 간접 분리 + mediation으로 경로 강도 추정 |
| "K-R 검정은 왜 안 하나?" | 본 연구는 hypothetical bias (CVM-auction)에 초점. K-R 논쟁(WTP-WTA 갭)은 *별개 phenomena*. 후속 companion study (v2 archive)로 분리 |

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

특히 Logg-Dietvorst boundary condition 정합은 본 연구 Phase 1 중립화 디자인의 *학문적 정당화*를 강화함 — reviewer가 "Algorithm Appreciation/Aversion이 충돌하지 않나?" 질문 시 *Logg 본인의 reconciliation*을 인용하여 직접 대응 가능.
