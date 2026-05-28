# Research Specification: AI 정보 제공과 Valuation — Two-Study Cross-Calibration Design

**Date:** 2026-05-27 (revised from v1: 2026-05-26)
**Researcher:** 이도현 (leedohyeon@kakao.com)
**Working language:** 한국어 본문 + 영문 전문용어
**Paper type:** survey-experiment (Two-study unified proposal)
**용도:** 지도교수·동료 피드백용 내부 문서
**상태:** REVISED — Story B framing 확정, Two-study cross-calibration design 채택

### 버전 history

- **v1 (2026-05-26)**: WTP-WTA 갭 + K-R 5-channel framing — *superseded* (사용자 결정으로 후속 연구로 분리)
- **v2 (2026-05-27)**: Two-Study (induced + homegrown) + cross-calibration — *본 문서*

---

## Common Umbrella — Research Questions

AI(LLM) 정보 제공이 valuation behavior에 미치는 영향을 *두 차원*에서 측정하고, 둘을 *cross-calibrate*한다.

| | 차원 | RQ |
|---|---|---|
| **RQ1 (Study 1)** | 메커니즘 검정 | "SPA 실험경매의 demand-revealing 속성이 AI 외생 정보 source 하에서 robust한가? AI 메시지가 V_induced와 다를 때 피험자의 bid는 어디로 이동하는가?" |
| **RQ2 (Study 2)** | 선호 shift 검정 | "AI 정보 제공이 한국 농산물(또는 환경재)에 대한 실제 소비자 선호(WTP)를 어떻게 이동시키는가?" |
| **RQ3 (Cross)** | Cross-calibration | "Study 1의 추정량(demand effect + anchoring)을 external benchmark로 사용하여 Study 2의 *순수 정보 효과*를 분리할 수 있는가?" |

> **본 proposal의 novelty 한 줄**: *"Fox et al. (1998) CVM-X 라인의 21세기 AI 버전 — lab induced experiment로 homegrown lab experiment의 demand/anchoring confound를 보정하여, AI 정보의 *순수* 인과 효과를 분리한다."*

---

## Motivation

### 학문적 배경

WTP·WTA에 대한 30년 실험경제 연구는 두 갈래로 진화해왔다.
- **첫 번째 갈래** (induced value 라인): Vickrey 1961, BDM 1964 이래 실험경매의 demand-revealing 속성을 검정. 최근 Lee et al. (2020)이 인지능력의 모더레이션 효과 보고. *메커니즘 robustness*가 핵심 관심.
- **두 번째 갈래** (homegrown value 라인): KKT 1990 endowment effect 이래 실제 소비자 선호 측정. Choi et al. (2018)이 한국 쌀 grade 정보 효과를 비-hypothetical 실험경매로 측정. *선호 측정*이 핵심 관심.

이 두 갈래는 *완전히 다른 연구 목적*을 추구하나, AI(LLM) 정보 source가 등장하면서 *공통 confound*에 직면한다:
- AI 메시지는 *정보 가치*를 제공함과 동시에 *demand effect·anchoring*을 일으킬 가능성.
- 두 효과를 *분리*하지 못하면 AI 효과의 해석이 흐려진다.

### 본 연구의 자리

본 연구는 induced 라인과 homegrown 라인을 *cross-calibrate*하여 이 confound를 분리한다.

(a) **Study 1 — induced value branch**: AI 메시지가 V_induced와 다를 때 피험자 반응 측정 → demand effect와 anchoring의 *크기 정량화* (Lee 2020 라인의 AI source 확장).

(b) **Study 2 — homegrown value branch**: AI 정보 제공이 실제 한국 농산물 WTP를 어떻게 이동시키는지 측정 (Choi 2018의 AI source 확장).

(c) **Cross-calibration**: Study 1의 추정량을 Study 2 결과 해석의 external benchmark로 사용 → *순수 정보 효과* 분리.

### 청중과 정책 함의

- **실험설계방법론자**: Study 1 — AI confound 경고.
- **소비자정책**: Study 2 — AI 챗봇이 소비자 의사결정에 미치는 인과 효과.
- **행동경제학 이론가**: Cross-calibration 논리 — 정보 채널과 demand/anchoring 채널의 분리.

---

## Hypotheses

### Study 1 (Induced Value Branch)

| H | 가설 | 식별 |
|---|---|---|
| H1-1 | AI 메시지가 V_induced와 일치할 때도 효과 ≠ 0 → **demand effect 존재** | arm 2 vs arm 1 비교 |
| H1-2 | AI 메시지가 V_induced와 다를 때 bid이 anchor 방향으로 이동 → **anchoring 존재** | arm 3·4 vs arm 1 비교 |
| H1-3 | 하향 anchor (arm 3) 효과와 상향 anchor (arm 4) 효과가 *비대칭* | arm 3 \|effect\| vs arm 4 \|effect\| |
| H1-Het | 인지능력 (RSPM) 높은 피험자가 anchoring 효과 ↓ | RSPM × arm 3·4 interaction (Lee 2020 직접 확장) |

### Study 2 (Homegrown Value Branch)

| H | 가설 | 식별 |
|---|---|---|
| H2-1 | label-only → AI info 처치에서 WTP shift ≠ 0 → **AI 정보 효과 존재** | arm 2 vs arm 1 비교 (Choi 2018 replication with AI source) |
| H2-2 | shift 방향이 시장가 쪽 → **outside option 채널 또는 정보 갱신** (Cherry 2004) | shift direction sign |
| H2-3 | AI info arm에서 WTP 분산 ↓ → **신념 수렴** (Zhao-Kling 2001 commitment cost 채널) | variance ratio test |

### Cross-Calibration (RQ3)

| H | 가설 | 식별 |
|---|---|---|
| H3-decomp | Study 2 total effect $\theta_{\text{total}}$는 demand·anchoring·정보의 합 | $\theta_{\text{total}} = \theta_{\text{info}} + \delta_{\text{demand}} + \delta_{\text{anchor}}$ |
| H3-pure | $\theta_{\text{info}} = \theta_{\text{total}} - \delta_{\text{demand}} - \delta_{\text{anchor}}$를 cross-study로 추정 | Study 1 추정량을 Study 2 결과에서 차감 |

---

## Empirical Strategy

### 공통 디자인 (양 study 공유)

- **Mechanism**: Second-price auction (Vickrey 1961). 실행은 Canavari et al. (2019) 표준 따름.
- **Subject pool**: 한국 lab subject pool.
- **Stimulus**: 정적 AI 텍스트 (스크린샷 또는 고정 메시지). LLM source = GPT-4 또는 Claude *단일*. 모든 메시지 사전등록 (ADR-003).
- **Design**: Pure between-subject (ADR-001).
- **Sessions**: SPA 그룹 4–6명, private booth.
- **Cross-study link**: 양 study가 *동일 LLM·동일 prompt 구조·동일 piece-meal 통제*로 실행되어 AI source가 *비교 가능*해야 함 (cross-calibration의 핵심 가정).

### Study 1 — Induced Value

| 항목 | 결정 |
|---|---|
| 재화 | 알려진 redemption value의 token (예: monitor에게 ₩X 받고 판매 가능) — 구체 결정은 ADR-006 |
| V_induced 분포 | 시장가 근처 좁게 (Shogren 2001 off-margin 회피) |
| Arms | 4 — control / AI agree / AI low / AI high |
| Δ (anchor magnitude) | 사전 결정 (V_induced의 10–20% 범위) — 구체 ADR-006 |
| Primary outcome | $\|\text{bid} - V_{\text{induced}}\|$ |
| Secondary outcome | bid의 signed deviation, bid 분산 |

**Arm 구조 표**:

| Arm | 처치 | 가설 식별 |
|---|---|---|
| 1. Control | (정보 없음) | Baseline — SPA truth-revealing 검정 |
| 2. AI agree | "이 token은 ₩X에 거래됩니다" (V_induced 일치) | H1-1 (demand effect) |
| 3. AI low | "이 token은 ₩(X−Δ)에 거래됩니다" | H1-2 (하향 anchor) |
| 4. AI high | "이 token은 ₩(X+Δ)에 거래됩니다" | H1-2, H1-3 (상향 anchor + 비대칭) |

### Study 2 — Homegrown Value

| 항목 | 결정 |
|---|---|
| 재화 (TBD) | 후보: (a) 한국 쌀 4 등급 (Choi 2018 직접 따름), (b) 환경재 (탄소상쇄 인증서), (c) 기프티콘 — ADR-007 |
| Format | Choi 2018의 full bidding (다 grade 동시 입찰) — outside option 통제에 유리 |
| Arms (main) | 2 — label only / AI info |
| Arms (optional extension) | 4 — + Human source / + AI placebo |
| Primary outcome | WTP shift (arm 1 vs arm 2) |
| Secondary outcome | WTP 분포 (분산·왜도), grade premium ($\Delta_{\text{super,no-test}}$ 등) |

**Arm 구조 표**:

| Arm | 처치 | 가설 식별 |
|---|---|---|
| 1. Label only | "super grade" 등급 label만 (Choi 2018 Round 2 등가) | Baseline 정보 |
| 2. AI info | AI 응답 "이 super 등급 쌀은 ___ 특성으로 평균 ₩X에 거래됩니다" | H2-1, H2-2 (AI 효과) |
| 3 (optional). Human source | "전문가" 익명 텍스트로 동일 정보 | AI source effect 분리 |
| 4 (optional). AI placebo | 내용 없는 AI 메시지 ("이 쌀은 한국에서 재배됩니다") | 정보 함량 vs AI source 분리 |

### Cross-Calibration 절차

1. **Same-time sample**: Study 1과 Study 2를 *같은 lab에서 같은 시기*에 실행 (피험자 풀 시간적 균일성 확보).
2. **Demographic balance**: 양 study의 피험자 인구통계 균형 통제.
3. **Decomposition 추정**:
   - $\hat{\delta}_{\text{demand}}$: Study 1 arm 1 vs arm 2 difference.
   - $\hat{\delta}_{\text{anchor}}$: Study 1 arm 3·4 effect magnitude.
   - $\hat{\theta}_{\text{total}}$: Study 2 arm 1 vs arm 2 difference.
   - $\hat{\theta}_{\text{info}} = \hat{\theta}_{\text{total}} - \hat{\delta}_{\text{demand}} - \hat{\delta}_{\text{anchor}}$.
4. **Bootstrap SE + delta method**로 $\hat{\theta}_{\text{info}}$의 분포 추정.

### Robustness (양 study 공유)

- **Oath arm**: Jacquemet et al. (2013) — AI info arms에 oath 추가 사본. Demand effect 통제 robust check.
- **Cognitive ability**: Raven RSPM 단축형 사전 측정 (Lee 2020 직접 확장).
- **AI familiarity**: ChatGPT 사용 빈도 사전 측정 (heterogeneous treatment effect 분석).
- **Manipulation check**: AI 메시지 read-time logging, 이해 quiz.
- **Risk attitude**: Holt-Laury 6-question (보조 covariate).

### Key Identifying Assumptions

1. ⭐ **Cross-calibration 핵심 가정**: Study 1의 AI source effect ($\delta_{\text{demand}} + \delta_{\text{anchor}}$)가 Study 2에서도 *동일하게 작동* — 동일 LLM·동일 prompt·동일 매체로 강제.
2. SUTVA (peer effects 없음) — private booth로 통제.
3. SPA가 (no info arm에서) 진실 입찰 induce.
4. AI 메시지의 *내용*만 처치 — 길이·톤·구체성 통제.

---

## Data

| 항목 | 결정 / 상태 |
|---|---|
| Subject pool | 한국 대학생 lab (잠정) |
| Sample size | ADR-008에서 결정 |
| Mechanism | Second-price auction (Vickrey 1961) |
| Sessions | 4–6명/세션, private booth |
| AI source | GPT-4 또는 Claude (한국어 정적 텍스트), 단일 |
| Pre-registration | ADR-009에서 결정 (pilot 후 또는 일괄) |

### Variables

| Type | Variables |
|---|---|
| Treatment | Study 1: arm ∈ {1,2,3,4}; Study 2: arm ∈ {1,2,(3),(4)} |
| Primary outcome | Study 1: \|bid − V_induced\|; Study 2: WTP shift |
| Secondary outcome | bid 분산, signed deviation, grade premium |
| Pre-treatment covariates | 연령, 성별, 학년, 전공, ChatGPT 사용빈도, RSPM, Holt-Laury, 경매 경험 |
| Manipulation check | AI 메시지 read-time, 이해 quiz |
| Post-experiment | AI 신뢰 평정, 자기보고 reference point |

---

## Expected Results

### Study 1 결과 매트릭스

| Scenario | arm 2 effect (agree) | arm 3·4 effect | 해석 |
|---|---|---|---|
| S1-A | ≈ 0 | strong | Pure anchoring (demand 無) |
| S1-B | ≠ 0 | strong | Demand + anchoring (분리 가능) |
| S1-C | ≠ 0 | weak | Demand effect dominant |
| S1-D | ≈ 0 | weak | AI source가 거의 무효 |

### Study 2 결과 매트릭스

| Scenario | arm 2 effect | 분산 변화 | 해석 |
|---|---|---|---|
| S2-A | strong, 시장가 방향 | ↓ | 정보 갱신 dominant + 신념 수렴 |
| S2-B | strong, 시장가에서 멀어짐 | ↑ | Source distrust |
| S2-C | ≈ 0 | unchanged | AI 정보 무효 |

### Cross-Calibration 해석 매트릭스

| Study 1 결과 | Study 2 결과 | 해석 |
|---|---|---|
| arm 2 ≈ 0 (demand 無) | strong shift | **순수 정보 효과** 확정 — AI가 *진짜* 가치 신념을 갱신 |
| arm 2 ≠ 0 (demand 有) | Study 2 effect ≈ Study 1 effect | **선호 변화 아님, demand effect dominant** |
| arm 2 ≠ 0 | Study 2 effect > Study 1 effect | demand + 추가 정보 효과 (분해 가능) |
| arm 3·4 강함 | Study 2 시장가 방향 shift | **Anchoring/outside option dominant** (Cherry 2004) |

→ *어떤 결과가 나와도 해석 가능*. 사전등록 가설로서 robust.

---

## Contribution

1. **방법론 (Study 1)**: 실험경매의 demand-revealing 속성이 *외생적 정보 source (LLM) 하에서* 어떻게 약화되는지의 첫 직접 증거. Lee et al. (2020)의 인지능력 라인을 *AI source*로 확장.

2. **정책 (Study 2)**: AI 정보 제공이 한국 농산물 소비자 WTP에 미치는 인과 효과 — Choi et al. (2018)의 grade 정보 효과를 *AI source*로 확장한 최초 lab 실험.

3. **이론·방법 (Cross-calibration)** ⭐: Study 1으로 Study 2의 demand·anchoring confound를 분리한 *순수 정보 효과* 추정. **Fox et al. (1998) CVM-X 라인의 21세기 AI 버전** — 새로운 실험 디자인 방법.

4. **방법론 적용 (Haaland 2023)**: 정보 제공 실험 방법론(Haaland-Roth-Wohlfart 2023)을 *valuation 도메인*에 첫 이식.

---

## Open Questions

| # | 항목 | 상태 | 다음 행동 |
|---|---|---|---|
| Q1 | Study 1 token 종류·V_induced 분포 | BLOCKED | ADR-006 작성 |
| Q2 | Study 2 homegrown 객체 (쌀 vs 환경재 vs 기프티콘) | BLOCKED | ADR-007 작성 |
| Q3 | AI 메시지 prompt 구조·길이·톤 | BLOCKED | Pilot 전 prototype 작성 |
| Q4 | Δ (Study 1 anchor magnitude) 크기 | BLOCKED | V_induced 분포 결정 후 |
| Q5 | 양 study cell당 N + power | OPEN | ADR-008 |
| Q6 | Study 2 Optional arms (Human source, AI placebo) 포함 여부 | OPEN | pilot 후 결정 |
| Q7 | Pre-registration 시점 | OPEN | ADR-009 |
| Q8 | IRB 신청 시점 | OPEN | 디자인 확정 후 |
| Q9 | 저자명·소속 | OPEN | 프로포절 골격 시 |

### Clarity status of major aspects

| Aspect | Status |
|---|---|
| Research questions (RQ1, RQ2, RQ3) | CLEAR |
| Theoretical framing (valuation accuracy + shift) | CLEAR |
| Paper type (survey-experiment, two-study) | CLEAR |
| Mechanism (SPA) | CLEAR — ADR-002 |
| Between-subject | CLEAR — ADR-001 |
| AI delivery (static text) | CLEAR — ADR-003 |
| **Two-study framing + cross-calibration** | **CLEAR — ADR-005 (본 결정)** |
| Study 1 arm 구조 (4 arms) | CLEAR |
| Study 2 main arm 구조 (2 arms) | CLEAR |
| Study 1 V_induced 객체 | BLOCKED — ADR-006 |
| Study 2 homegrown 객체 | BLOCKED — ADR-007 |
| AI 메시지 내용 | BLOCKED |
| Hypothesis 방향성 | CLEAR (양방향 H 명시) |
| Contribution 표현 | CLEAR (4중 진술) |

---

## Citations used in this spec (v2)

### Tier 1 (load-bearing)
- **Choi et al. (2018)** — Study 2 직접 전신 (한국·SPA·grade 정보)
- **Lee et al. (2020)** — Study 1 직접 전신 (induced × \|bid − V\|)
- **Haaland, Roth & Wohlfart (2023, JEL)** — 정보 제공 실험 방법론 표준
- **Vickrey (1961)** + **Canavari et al. (2019)** — SPA 메커니즘 표준
- **Fox et al. (1998) CVM-X** — Cross-calibration 라인의 원조
- **Plott & Zeiler (2005)** — Study 1 induced control 정통성

### Tier 2 (channel reference / robustness)
- **Jacquemet et al. (2013)** — Oath robustness
- **Cherry et al. (2004)** — Study 2 outside option 통제
- **Shogren et al. (2001)** — SPA off-margin (induced V 분포 결정 근거)
- **Zhao & Kling (2001)** — Study 2 분산 감소 채널 (commitment cost)

### Tier 3 (context)
- **KKT (1990)** — Endowment effect 배경
- **Tunçel & Hammitt (2014) meta** — Effect size base rate
- **BDM (1964)** — 메커니즘 대안 언급

### Demoted from v1 (배경 인용만)
- Kőszegi & Rabin (2006), Ericson & Fuster (2011), Heffetz & List (2014), Campos-Mercade et al. (2026 RES) — K-R 논쟁 배경. 본 연구가 *직접 검정하지 않음* (후속 연구 가능성).

> **Post-Flight CoVe**: 본 spec의 모든 Tier 1–3 인용은 2026-05-26 / 2026-05-27 CoVe 라운드에서 검증 완료 ([lit_review_aiwtp_gap.md](../lit_review_aiwtp_gap.md), [lit_review_kr_post2014.md](../lit_review_kr_post2014.md)).

---

## Cross-references

- **ADR-001** (between-subject) — 유지
- **ADR-002** (SPA single mechanism) — 유지
- **ADR-003** (static AI text) — 유지
- **ADR-005** (NEW): Two-study unified proposal + cross-calibration framing
- **ADR-006** (TBD): Study 1 induced value 객체 결정
- **ADR-007** (TBD): Study 2 homegrown 객체 결정
- **ADR-008** (TBD): Sample size / power planning
- **ADR-009** (TBD): Pre-registration timing

---

## Next Session Recommendations

1. **ADR-006** (Study 1 token 종류·V_induced 분포·Δ 크기) 작성
2. **ADR-007** (Study 2 homegrown 객체 결정) — 쌀 vs 환경재 vs 기프티콘
3. **AI 메시지 prototype** 작성 — 양 study에서 공유할 prompt 구조와 sample messages
4. **프로포절 골격 (4–6장)** 설계 — 본 spec의 §섹션들을 Beamer slide 구조로
5. (선택) **Pilot 디자인** — Study 1 pilot으로 Δ 크기 calibrate
