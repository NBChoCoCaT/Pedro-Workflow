# Research Specification: AI 정보 제공과 WTP–WTA 갭

**Date:** 2026-05-26
**Researcher:** 이도현 (leedohyeon@kakao.com)
**Working language:** 한국어 본문 + 영문 전문용어
**Paper type:** theory+empirics (Kőszegi–Rabin reference-dependent 모형 + survey-experiment)
**용도:** 지도교수·동료 피드백용 내부 문서 (제출 전 단계)
**상태:** DRAFT — 다수 항목 `/lit-review` 후 최종 확정 예정

---

## Research Question

> **AI(LLM)가 제공하는 가치 관련 정보가 WTP–WTA 갭의 *크기와 방향*에 영향을 미치는가? 그리고 그 효과는 induced value 조건과 homegrown value 조건에서 어떻게 달라지는가?**

부수 질문:
- AI 정보의 효과는 (i) 정보 보정, (ii) 앵커링, (iii) 정보원(source) 신뢰 중 어느 채널을 통해 발생하는가?
- AI 정보가 induced value 조건에서도 효과를 보인다면, 그것은 갭의 *measurement error* 채널에 대한 새로운 증거인가, 아니면 demand effect / comprehension confound의 발현인가?

---

## Motivation

WTP와 WTA의 격차(이하 "갭")는 실험경제학·환경경제학·소비자정책에서 반복적으로 보고된 robust한 발견이다 (Kahneman, Knetsch, and Thaler 1990; Horowitz and McConnell 2002 meta-analysis). 갭의 원천에 대한 학술 논쟁은 두 진영으로 정리된다.

- **Misconception account** (Plott and Zeiler 2005, in folder): 갭은 BDM·SPA 같은 elicitation 메커니즘에 대한 피험자의 *오해*에서 발생하며, 적절한 통제(training, anonymity, practice rounds)를 부여하면 사라진다.
- **Reference-dependent account** (Kőszegi and Rabin 2006): 갭은 피험자의 *expectation-based reference point* 주위로 형성된 reference-dependent 선호의 자연스러운 귀결이다. 따라서 갭은 통제로 사라지지 않으며, 외생적 reference point 조작에 반응한다.

기존 문헌에서 induced value × homegrown value 교차는 두 가설을 식별하는 표준 도구로 사용되어 왔다. induced에서는 객관적 가치가 알려져 있으므로 misconception이 통제되면 갭은 0에 수렴해야 하나, reference-dependent 모형은 induced에서도 약한 갭을 예측할 수 있다. 본 연구는 이 교차 식별 전략에 **새로운 외생 변동**으로 **AI(LLM) 정보 제공**을 추가한다.

AI 정보 제공을 도입하는 세 가지 동기:

1. **이론적 매력 — 외생적 expectation shifter**: K-R 모형의 핵심 변수인 *기대값 기반 reference point*를 직접 조작하기 어려웠던 기존 실험에서, 사전 고정된 LLM 메시지는 *내용을 통제 가능한* 외생적 정보 원천을 제공한다.
2. **방법론적 매력 — 측정 오차 채널의 추가 검정**: 갭에 영향을 주는 채널이 (a) misconception, (b) commitment cost (Zhao and Kling 2001, in folder), (c) outside option (Cherry et al. 2004, in folder), (d) demand effect / experimenter cue (Jacquemet et al. 2013 oath, in folder) 외에 (e) **외생적 정보 신호**가 추가될 때 어떻게 변하는지를 직접 측정한다.
3. **정책적 매력**: LLM 기반 챗봇이 소비자 정보 채널로 광범위하게 도입되는 가운데, 그 정보가 valuation behavior에 미치는 영향에 대한 직접 증거가 부재하다. 소비자정책·행동경제학·실험설계방법론 세 영역의 교차 기여.

---

## Hypothesis

본 연구는 효과의 *방향성을 사전에 단정하지 않는다* (연구자 본인의 명시적 입장 — Q15에서 확인). 대신 채널별로 차별적 예측을 제시한다.

| 가설 | 예측 (induced) | 예측 (homegrown) | 채널 |
|---|---|---|---|
| **H0** (영가설) | AI 효과 = 0 | AI 효과 = 0 | — |
| **H1a** (misconception correction) | AI 효과 ≈ 0 (induced에서는 misconception 없음) | AI 효과 < 0 (갭 축소) | Plott–Zeiler |
| **H1b** (reference-point shift) | AI 효과 ≠ 0, 방향은 AI 메시지 내용에 의존 | AI 효과 ≠ 0, 방향은 AI 메시지 내용에 의존 | Kőszegi–Rabin |
| **H1c** (anchoring) | AI 효과 ≠ 0, WTP·WTA 동방향 이동 (갭 크기 변화는 작음) | 동일 | Tversky–Kahneman 류 |
| **H1d** (source / demand) | AI 효과 ≠ 0 (induced에서도) → demand effect 의심 | AI 효과 있음, 인간 expert arm과 비교로 source 분리 | Bursztyn 류 [pending lit review] |

**핵심 식별**: induced × AI 상호작용 효과가 0인가 아닌가가 misconception 가설(H1a) vs. 다른 모든 가설을 가르는 1차 시험이다.

---

## Empirical Strategy

### Method

Lab experiment with pure between-subject randomisation.

### Mechanism

**Second-price auction (SPA, Vickrey 1961)** 단일 메커니즘.
- BDM 대신 SPA를 선택한 이유: ADR-002 참조.
- *주의*: SPA는 그룹 단위(통상 4–6명/세션)로 실행되므로 독립 관찰 단위는 *세션*이며, clustered standard error를 사용한다.

### Treatment design

**Provisional 2×4 (= 8 cells)** — 단, lit review 후 축소 가능 (ADR-001 + Open Questions 참조).

- Factor 1: **Value type** ∈ {induced, homegrown}
- Factor 2: **Information arm** ∈ {AI info, AI placebo (numerical but uninformative), human-source info, no info}
- Total: 8 cells

축소 시나리오는 §Open Questions에 명시. 현재 시점에서 가장 현실적인 축소는 2×2 minimum {induced, homegrown} × {AI info, no info}.

### Stimulus — AI 정보 제공

- **Format**: 정적 텍스트(스크린샷 또는 고정 메시지). 실시간 LLM 호출 없음.
- **LLM source**: GPT-4 또는 Claude (한국어 응답).
- **Pre-registration**: 모든 AI 메시지 텍스트는 데이터 수집 *전*에 결정되고 사전등록된다 (Q12-(4) confound 통제).

### Identification

- **1차 식별 (information correction vs reference-shift)**: induced × {AI info, no info} 셀의 평균 차이. 차이 = 0 → misconception 가설 우호적; 차이 ≠ 0 → reference-shift 또는 demand effect.
- **2차 식별 (channel decomposition, 8-cell 디자인 가용 시)**: AI info vs AI placebo 차이 = 정보의 가치 함량 효과; AI info vs human-source info 차이 = source 효과.
- **Robustness**: commitment cost 통제를 위한 practice round 제거 / 포함 비교 (Zhao–Kling 2001).

### Key identifying assumptions

1. AI 메시지의 *내용*은 처치 외 channel을 통해 valuation에 영향을 주지 않는다 (메시지 길이·톤·구체성을 arm 간 일치시킴).
2. 피험자는 SPA 메커니즘을 이해한다 (training phase + comprehension check 통과 시 분석에 포함).
3. SPA 세션 내 입찰자 간 affiliation은 정보 처치와 독립적이다 (Milgrom–Weber). 위반 시 clustered SE로 처리.

### Robustness checks

- Practice round 유·무 비교 (commitment cost 통제)
- ChatGPT 사용 경험 사전질문 → AI familiarity로 층화 분석 (Q12-(2) selection 검토)
- Comprehension check 미통과자 sensitivity (Q12-(3) comprehension confound)
- AI 메시지 read-time logging (피험자가 실제로 읽었는지 행동지표)

---

## Data

| 항목 | 결정 | 근거 |
|---|---|---|
| **피험자 풀** | 한국 대학생 lab pool | Q7 |
| **표본 규모(상한)** | 한 학기 ~200명 | Q14 (제약) |
| **모집 채널** | 학내 lab subject pool | 표준 절차 |
| **메커니즘** | Second-price auction (Vickrey 1961) | ADR-002 |
| **Induced value 객체** | **TBD** | Open Q1 |
| **Homegrown value 재화** | **TBD** | Open Q2 — 사용자의 ag·환경경제 배경상 농산물(Choi et al. 2018, in folder) 또는 환경재 후보 가능 |
| **AI 정보 원천** | GPT-4 또는 Claude (한국어 정적 텍스트) | Q9 |
| **세션 크기** | 4–6명/SPA 세션 (잠정) | 실험경매 표준 (Canavari et al. 2019, in folder) |
| **분석 단위** | 개인 입찰가; 그러나 SE는 세션 clustered | SPA design |
| **사전등록** | OSF, pilot 이후 작성 권고 | Open Q3 |

### Variables

| Type | Variables |
|---|---|
| **Treatment (assigned)** | Value type ∈ {induced, homegrown}; Info arm ∈ {AI, [AI placebo], [human], no info} |
| **Primary outcome** | WTP 입찰가, WTA 호가; 갭 = WTA − WTP |
| **Pre-treatment covariates** | 연령, 성별, 학년, 전공, ChatGPT 사용빈도, 위험회피(Holt–Laury 6-question), 경매 경험 |
| **Manipulation checks** | AI 메시지 read-time, comprehension check 정답 |
| **Mechanism probes (post-experiment)** | 자기보고 reference point, AI 신뢰 평정 |

---

## Expected Results

연구자 본인은 효과의 **방향성을 사전에 단정하지 않는다** (Q15). 다음은 시나리오별 해석 매트릭스이다.

| Scenario | induced × AI 효과 | homegrown × AI 효과 | 해석 |
|---|---|---|---|
| **S1** | ≈ 0 | < 0 (갭 축소) | Plott–Zeiler misconception 가설 강력 지지. AI = 효과적 정보 보정 도구. **정책 함의**: 비용편익분석의 valuation phase에 AI 통합 정당화 |
| **S2** | ≠ 0 | ≠ 0 (AI placebo와 비교 시 정보가 유의) | K-R reference-shift 가설 지지. AI는 expectation shifter로 작동 |
| **S3** | ≠ 0, AI placebo 효과 ≈ AI info 효과 | 동일 | Anchoring 채널 dominant. 기존 misconception 논쟁 재해석 — 갭의 일부는 anchoring artifact |
| **S4** | ≠ 0 (induced에서도) | 동일 | Demand effect / comprehension confound 의심. AI 정보의 외부타당도에 의문 → robustness 분석 강화 |
| **S5** | AI > human-source | 동일 | AI 정보원에 대한 *과대신뢰* — LLM 정보 채택의 외부효과 |

**놀라울 결과** (다음 중 어느 것이든 페이퍼의 핵심 발견이 된다):
- AI 정보가 갭을 *확대*한다 (S2에서 K-R 예측에 반하는 reference-point 방향).
- 한국 피험자에서 AI familiarity가 효과의 부호를 결정한다 (heterogeneous treatment effect).
- AI placebo만으로도 갭이 움직인다 (의미 정보가 아닌 *AI라는 인지된 정보원* 자체가 효과).

---

## Contribution

> **본 연구의 1차 컨트리뷰션**: WTP–WTA 갭 문헌에 AI/LLM 정보 제공을 *경제학적 도구*로 도입한 최초의 실험. (이 주장은 `/lit-review`로 검증 후 확정.)

부수 컨트리뷰션:

1. **이론적**: K-R reference-dependent 모형에 *외생적·통제 가능한 expectation shifter* 도구를 추가. Heffetz–List 류 expectation 조작 실험에서 LLM이 새로운 도구 채널.
2. **방법론적**: induced × homegrown × {AI, placebo, human, none} 교차 디자인을 통해 misconception vs reference-dependent 식별에 정보 채널 차원을 확장.
3. **정책적**: LLM 기반 정보 제공이 소비자 valuation에 미치는 인과 효과의 직접 증거 — 소비자정책·소비자보호·디지털 시장 규제 논의에 활용 가능.

---

## Open Questions

| # | 항목 | 상태 | 다음 행동 |
|---|---|---|---|
| **Q1** | Induced value 객체 선택 (토큰 vs lottery ticket vs 기프티콘) | BLOCKED | 선행연구 검토에서 induced 객체별 misconception 발생률 비교 |
| **Q2** | Homegrown 재화 선택 (KKT mug / Korean ag product / 환경재 / 기프티콘) | BLOCKED | 사용자 학문 배경(ag·환경경제)과 정책 함의를 함께 고려; Choi et al. 2018 참조 |
| **Q3** | 사전등록 시점 (pilot 이후 vs 본실험 이전 일괄) | BLOCKED | 표본 제약(N=200)상 pilot+main 분리 가능성 검토 |
| **Q4** | 8-cell 풀 디자인 유지 vs 2×2 축소 vs 다단계 (ADR-001 잠정) | BLOCKED | lit review에서 흔히 보고되는 interaction effect size 확인 후 power 재계산 |
| **Q5** | AI 메시지 내용 설계 (정보 보정 vs 앵커링 분리 가능한 메시지 쌍) | BLOCKED | LLM 메시지 prototype 작성 + pilot |
| **Q6** | Affiliation 위협 통제 (SPA 그룹 내 정보 공유 위험) | OPEN | Milgrom–Weber 류 controls; private booth 환경 |
| **Q7** | Commitment cost (Zhao–Kling 2001, 폴더 보유) 통제 | OPEN | practice round 디자인 변형으로 검증 |
| **Q8** | AI/LLM × experimental valuation 선행연구 존재 여부 | BLOCKED | `/lit-review` 1순위 — "first study" 주장 검증 |
| **Q9** | Reference-dependent + exogenous information 실험 문헌 (Heffetz–List 등) | BLOCKED | `/lit-review` 2순위 — K-R 프레임 정당화 |
| **Q10** | 한국 IRB / lab 등록 일정 | OPEN | 디자인 확정 후 |
| **Q11** | 저자명·소속 (CLAUDE.md `[YOUR INSTITUTION]` 플레이스홀더) | OPEN | 프로포절 골격 작성 시 |

### Clarity status of major aspects

| Aspect | Status |
|---|---|
| Research question | CLEAR |
| Theoretical framing (K-R reference-dependent 주, Plott–Zeiler 비교) | CLEAR |
| Paper type (theory+empirics) | CLEAR |
| Subject pool (Korean university lab) | CLEAR |
| Mechanism (SPA single) | CLEAR — ADR-002 |
| Between-subject design | CLEAR — ADR-001 |
| AI delivery (static text) | CLEAR — ADR-003 |
| Sample size cap (~200/semester) | CLEAR (제약), 디자인 함의 BLOCKED |
| Treatment design (8 cells vs 축소) | ASSUMED 2×4 잠정; **lit review 후 재결정** |
| Induced/homegrown 객체 선택 | BLOCKED |
| AI 메시지 내용 | BLOCKED |
| Hypothesis 방향성 | EXPLORATORY (양방향 H1 허용) |
| Contribution 표현 | ASSUMED ("WTP-WTA × AI 최초"); lit review 검증 필요 |

---

## Citations used in this spec

폴더(`master_supporting_docs/supporting_papers/`)에서 직접 확인 가능한 12편 + 확립된 핵심 문헌(KKT 1990, K-R 2006, Vickrey 1961, BDM 1964, Horowitz–McConnell 2002)만 인용. AI/LLM 측 인용은 모두 `[pending lit review]` 처리 — Post-Flight Verification 위험 최소화.

### Folder papers cited
- Plott and Zeiler (2005) — endowment, misconception account
- Cherry et al. (2004) — outside option in WTP-WTA
- Zhao and Kling (2001) — commitment cost
- Jacquemet et al. (2013) — oath / demand effect control
- Choi et al. (2018) — rice grade (Korean ag context)
- Canavari et al. (2019) — running experimental auctions methodology

### Foundational citations (확립 문헌)
- Kahneman, Knetsch, and Thaler (1990) — endowment effect 발견
- Kőszegi and Rabin (2006) — expectation-based reference-dependent preferences
- Horowitz and McConnell (2002) — WTP-WTA meta-analysis
- Vickrey (1961) — second-price auction
- Becker, DeGroot, and Marschak (1964) — BDM mechanism

### Pending verification via `/lit-review`
- AI/LLM information provision in economic experiments (e.g., Bursztyn 류, Capraro 류 — 정확한 인용 미확정)
- Reference-dependent + exogenous information manipulation (Heffetz–List 류, Ericson–Fuster 류 — 정확한 인용 미확정)
- WTP-WTA × information correction (List 2003/2004 류, Engelmann–Hollard 2010 — 정확한 venue·연도 미확정)

> **Post-Flight CoVe note**: AI/LLM 측 핵심 주장("AI × WTP-WTA가 최초")은 `/lit-review` 후 `claim-verifier`로 fact-check 필요. 현 명세서는 내부 피드백용이며, 외부 제출 전 본 CoVe 단계를 반드시 거친다.

### CoVe 1차 결과 (2026-05-26, claim-verifier fresh-context fork)

폴더 12편 + 확립 5편 + Isoni–Loomes–Sugden 2011, Milgrom–Weber affiliation까지 총 **13 claim** 검증.

| 결과 | 수 | 비고 |
|---|---|---|
| PASS | 9 | 본문 인용 그대로 사용 가능 |
| PARTIAL | 4 | 본문 표현은 안전(`et al.` 형식, 학술지 미명시) — bibliography 작성 시 풀저자·학술지·권/호 정확 표기 필요 |
| FAIL | 0 | — |
| UNVERIFIABLE | 0 | — |

**PARTIAL 항목** (Bibliography_base.bib 작성 시 주의):
- Cherry et al. 2004 → 풀저자: **Cherry, Frykblom, Shogren, List, and Sullivan** (5인); 학술지: *Environmental & Resource Economics* 29:285–294.
- Zhao and Kling 2001 → 학술지: *Economics Letters* 73:293–300 (짧은 노트 형식 — "theoretical framework"이라 표현하지 말 것).
- Choi et al. 2018 → 학술지: *Canadian Journal of Agricultural Economics* 66:511–531.
- Milgrom–Weber 1982 → *Econometrica* 50(5):1089–1122. Affiliation은 *private/interdependent/common* value 전반에 적용되는 일반 개념 ("common-value-like settings"로 좁히지 말 것).

**권고**: SAFE TO PROCEED. AI/LLM 측 인용은 모두 `[pending lit review]` placeholder로 처리되어 있어 hallucination risk 0.

---

## Next session recommendations

1. **`/lit-review` 두 갈래 병렬 실행**:
   - (a) AI/LLM information provision in economic experiments (2022–2026)
   - (b) WTP–WTA × exogenous information manipulation (전체)
2. lit review 결과로 (i) "first study" 컨트리뷰션 주장 검증, (ii) 표본 N과 interaction effect size 표 작성, (iii) ADR-001 (8 cells vs 2×2) 최종 결정.
3. 결정 후 → 프로포절 골격 (4–6장 구조) → Beamer 슬라이드 작성.
4. 사전등록 초안 (`/preregister --style osf`)은 pilot 이후로 연기.
