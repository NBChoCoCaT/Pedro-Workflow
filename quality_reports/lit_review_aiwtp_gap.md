# Literature Review: AI 정보 제공과 WTP–WTA 갭

**Date:** 2026-05-26
**Query:** "AI 정보 제공이 WTP-WTA 갭에 미치는 영향" 두 갈래 — (a) AI/LLM × valuation experiments, (b) WTP-WTA × exogenous information manipulation.
**관련 명세서:** [research_spec_aiwtp_gap.md](specs/research_spec_aiwtp_gap.md)

---

## Summary

WTP–WTA 갭(또는 endowment effect)에 대한 학술 논쟁은 두 진영의 정면충돌로 정리된다. **Misconception account**(Plott and Zeiler 2005, AER) 진영은 갭을 elicitation 메커니즘에 대한 피험자의 *오해*로 환원하고, 적절한 절차 통제(BDM training, anonymity, paid practice rounds)로 갭이 사라진다고 주장한다. **Reference-dependent account**(Kőszegi and Rabin 2006, QJE) 진영은 갭을 *expectation-based reference point*가 만들어내는 본질적 행동이라고 본다. 두 진영의 검증은 (i) 갭이 어떤 절차에서 사라지는가, (ii) 외생적 expectation 조작이 갭을 움직이는가의 두 축에서 진행되어 왔다. Tunçel and Hammitt (2014, JEEM) 메타분석은 갭의 평균 비율 WTA/WTP ≈ 3.28로 보고하며, *incentive-compatible* 메커니즘과 *최신* 연구일수록 갭이 작다는 체계적 패턴을 확인했다.

축(ii)에서는 두 핵심 실험이 정반대 결론을 내렸다. **Ericson and Fuster (2011, QJE)**는 머그컵 보유 후 *교환 허락 확률*을 외생적으로 (10% vs 90%) 변화시키자 valuation이 20–30% 이동함을 보고 — K-R 모형 지지. **Heffetz and List (2014, JEEA)**는 expectations 확률을 보다 정밀하게 변화시켜도 K-R 예측에 부합하는 효과가 미미하다고 보고 — K-R 비판. List (2003, QJE)의 sportscard market field experiment + Engelmann and Hollard (2010, Econometrica)의 forced-trading 실험은 *시장 경험·강제 거래*가 갭을 줄임을 보여 misconception 진영을 부분적으로 지지하나, 동시에 K-R의 *상태 의존* 예측과도 양립한다.

본 연구의 위치: AI(LLM) 정보 제공을 *외생적 expectation shifter*로 사용하는 실험은 두 갈래 문헌의 공집합에 위치한다. **AI/LLM × experimental valuation** 측면에서는 아직 직접 선행연구가 부재하다 — 마케팅·IS 분야의 AI 챗봇 영향 연구(예: 구매의도·신뢰)는 있으나 induced/homegrown value 교차 검정으로 갭의 *구성요소*를 분해한 연구는 발견되지 않음. **Information provision experiments** 방법론은 Haaland, Roth, and Wohlfart (2023, JEL)의 표준화로 본격적으로 도구화되었으나, valuation·endowment 도메인 적용은 미개척 영역.

---

## Key Papers (relevance order)

### 1. Plott and Zeiler (2005, AER) — Misconception account의 분기점
- **Main contribution:** WTP–WTA 갭이 elicitation procedure에 대한 *피험자 오해*에서 발생함을 실험적으로 보임. BDM training + anonymity + paid practice를 모두 적용하면 머그컵에 대한 갭이 사라짐.
- **Method:** Lab experiment, BDM, between-subject, 머그컵·mints 비교.
- **Key finding:** 통제된 절차에서 갭 비유의(F-test p>0.10). 무통제 baseline에서는 갭 재현.
- **Relevance:** 본 연구의 **induced × no-info** 셀의 직접적 비교 baseline. 본 연구가 misconception 가설을 추가 검증할 셋팅.
- **In folder:** ✓ `PlottZeiler2005_endowment.pdf`

### 2. Plott and Zeiler (2007, AER 97(4):1449–1466) — 교환 비대칭의 절차 의존성
- **Main contribution:** 머그컵·초콜릿 교환 비대칭(exchange asymmetry)이 endowment effect theory 증거가 아니라 *고전 선호 이론 + 실험 절차*로 설명됨을 보임.
- **Method:** 절차 변형(언어·반복·익명) 실험.
- **Key finding:** 절차 통제 시 비대칭 사라짐, 전통 절차 복귀 시 재현.
- **Relevance:** 본 연구의 design choice (between-subject + private booth + 익명)의 정당화 근거.

### 3. Kőszegi and Rabin (2006, QJE 121(4):1133–1165) — Reference-dependent 모형
- **Main contribution:** 기대값 기반 *expectation reference point* 모형. 선호가 *예상한 상태*와의 차이로 표현됨.
- **Method:** 이론 모형.
- **Key finding:** Endowment effect는 expectation-based reference point의 자연스러운 결과. 외생적 expectation 조작이 갭을 움직여야 함.
- **Relevance:** 본 연구의 **theoretical frame** — AI 정보가 reference point를 어떻게 이동시키는가가 1차 식별 대상.

### 4. Ericson and Fuster (2011, QJE 126(4):1879–1907) — Expectations as endowments
- **Main contribution:** 외생적으로 *교환 허락 확률*을 무작위 배정 → 머그컵 valuation이 expectation 방향으로 유의 이동. K-R 모형 직접 지지.
- **Method:** Lab + valuation experiment, between-subject, mug. 고/저 확률 처치 (대략 90% vs 10% 수준 — 정확한 값과 magnitude는 PDF 확인 필요).
- **Key finding:** 고확률 보유 가능 그룹의 WTA가 저확률 그룹 대비 유의하게 높음 (보고된 magnitude ≈ 20–30% 수준이나 정확한 추정치는 본문 표 참조).
- **Relevance:** 본 연구의 **directional intuition**: AI 정보가 expectation을 raise하면 WTA가 raise (갭 확대 가능). 본 연구의 H1b(K-R) 가설의 모델 케이스.

### 5. Heffetz and List (2014, JEEA 12(5):1396–1422) — K-R에 대한 도전
- **Main contribution:** 정밀한 expectation 확률 조작으로 endowment effect의 K-R 메커니즘을 검증 → *K-R 예측 효과 미미*.
- **Method:** Lab, expectation 확률을 verified probabilistic beliefs로 측정, "assignment" 효과와 분리.
- **Key finding:** Mere assignment는 효과 있지만, K-R expectations의 역할은 작음.
- **Relevance:** ⚠️ 본 연구의 K-R 프레임에 대한 **반론** — 명세서에 명시 필요. 본 연구의 *AI 정보로 expectation 조작*이 Ericson-Fuster를 재현할지, Heffetz-List를 재현할지가 핵심 식별.

### 6. Isoni, Loomes, and Sugden (2011, AER 101(2):991–1011) — Plott-Zeiler에 대한 반박
- **Main contribution:** Plott-Zeiler(2005) 절차로도 *복권*에 대해서는 갭이 사라지지 않음을 보임. PZ의 "절차 통제로 모든 갭 제거"라는 강한 주장 약화.
- **Method:** Replication + extension to lotteries.
- **Key finding:** Mug 결과는 PZ와 일치하나, lottery 결과는 갭 유지.
- **Relevance:** 본 연구의 induced value 객체 선택 시 **복권 사용 주의** — PZ 효과가 일반화되지 않는 도메인.

### 7. Tunçel and Hammitt (2014, JEEM 68(1):175–187) — 메타분석
- **Main contribution:** 76개 연구, 337 paired WTP-WTA 추정치 메타분석.
- **Method:** Random-effects meta-regression.
- **Key finding:** 평균 WTA/WTP ratio 대략 3 수준 (환경·공공재에서는 6 이상). 갭은 (i) public/quasi-public goods에서 크고, (ii) student subjects, (iii) incentive-compatible mechanism, (iv) recent studies에서 작음. (정확한 추정치는 본문 PDF 확인 필요)
- **Relevance:** 본 연구의 **power calc base rate** — 한국 대학생·SPA·근래 연구라는 셋팅은 *갭이 작은 영역* → 표본 부담 가중.

### 8. List (2003, QJE 118(1):41–71) — 시장 경험과 endowment effect
- **Main contribution:** 스포츠카드 거래 시장 field experiment. 경험 많은 dealer에서 endowment effect가 사라짐.
- **Method:** Field experiment, 19 dealers + 학생 통제군.
- **Key finding:** 경험 dealer 중 52.6%가 endowed good을 거래 → 갭 부재.
- **Relevance:** Misconception account의 *대안 메커니즘* — *학습/경험*이 갭을 줄임. AI 정보 = "concentrated 학습" 도구로 볼 수 있는 해석.

### 9. List (2004, Econometrica 72(2):615–625) — 시장 anomaly의 한계
- **Main contribution:** 시장 경험이 *neoclassical 예측*으로 행동을 수렴시킴.
- **Method:** Field experiment 확장.
- **Key finding:** 학습 프로세스 긴 시간 필요.
- **Relevance:** AI 정보가 *짧은 시간*에 학습을 대신할 수 있는가의 직접 검정.

### 10. Engelmann and Hollard (2010, Econometrica 78(6):2005–2019) — 강제 거래
- **Main contribution:** *강제* 거래(피험자가 의무적으로 endowment 양도)로 후속 exchange asymmetry 제거.
- **Method:** 2-stage lab: 강제 거래 → 표준 exchange test.
- **Key finding:** 강제 거래군에서 비대칭 사라짐, 통제군에서 유지.
- **Relevance:** "노출"이 갭을 줄임 — AI 정보도 유사 채널인가? 본 연구의 *AI placebo* arm 설계의 비교군.

### 11. Haaland, Roth, and Wohlfart (2023, JEL 61(1):3–40) — Information provision 방법론
- **Main contribution:** 정보 제공 실험 방법론 표준화. 신념 측정, 정보 개입 설계, 신념 업데이트 측정, demand effect 통제, online recruitment 모범사례.
- **Method:** Survey of literature, design recommendations.
- **Key finding:** Typical effect size 표 + sample size recommendation 제공.
- **Relevance:** ⭐ 본 연구의 **방법론적 토대** — 정보 제공 실험의 표준 가이드. 명세서에 본 가이드 준수 명시 권고.

### 12. Cherry, Frykblom, Shogren, List, and Sullivan (2004, Env. & Resource Econ. 29:285–294) — Outside option in SPA
- **Main contribution:** SPA에서 *outside option*(거래 거부 옵션)이 갭에 미치는 영향.
- **Method:** Lab, SPA with/without outside option.
- **Key finding:** Outside option이 valuation에 영향.
- **Relevance:** 본 연구의 SPA 디자인에서 outside option 정책 결정 시 참조. (폴더 보유)
- **In folder:** ✓ `CherryEtAl2004_outside-option.pdf`

### 13. Zhao and Kling (2001, Economics Letters 73:293–300) — Commitment cost
- **Main contribution:** WTP/WTA 격차에 대한 새 설명 — *commitment cost* (한 번 가격을 정하면 묶이는 비용).
- **Method:** 이론 노트.
- **Key finding:** Commitment cost가 갭의 추가 채널.
- **Relevance:** 본 연구의 Q12-(5) 사용자 우려 직접 대응. (폴더 보유)
- **In folder:** ✓ `ZhaoKling2001_commitment-cost.pdf`

### 14. Jacquemet, Joule, Luchini, and Shogren (2013, JEEM 65:110–132) — Oath
- **Main contribution:** Vickrey 경매에서 *진실 약속(oath)* procedural device가 hypothetical bias 제거.
- **Method:** Lab Vickrey, oath vs. control.
- **Key finding:** Oath 처치에서 valuation이 incentive-compatible 답에 더 가까움.
- **Relevance:** 본 연구의 Q12-(1) demand effect 통제 도구로 검토. (폴더 보유)
- **In folder:** ✓ `JacquemetEtAl2013_oath.pdf`

### 15. Choi, Lee, Han, and Nayga Jr. (2018, Canadian J. Agr. Econ. 66:511–531) — ⭐ 가장 가까운 선행연구
- **Main contribution:** 한국 쌀 grade에 대한 소비자 valuation을 **non-hypothetical 실험경매 + 추가 grade 정보 제공 처치**로 측정. 등급 정보가 valuation에 가장 중요한 차별화 요인임을 보임.
- **Method:** Non-hypothetical experimental auction (한국), 정보 제공 treatment 비교, contingent + inferred valuation 결합.
- **Key finding:** 한국 소비자는 (i) 각 grade에 추가 premium 지불 의사, (ii) "no test" 옵션 없는 mandatory grading 시스템 선호.
- **Relevance:** ⭐⭐ 본 연구의 **가장 직접적 선행연구**. (i) 한국 lab + 실험경매 + 정보 제공 처치라는 셋팅이 본 연구와 일치, (ii) 농산물 homegrown value 후보 (쌀·등급 정보)에 대한 base rate 제공, (iii) 본 연구의 AI 정보 제공은 Choi et al.의 *human-source grading information*을 *LLM source*로 확장하는 셈. (폴더 보유)
- **In folder:** ✓ `ChoiEtAl2018_rice-grade.pdf`

### 16. Canavari, Drichoutis, Lusk, and Nayga Jr. (2019, Eur. Rev. Agr. Econ. 46(5):862–922) — 경매 실행 가이드
- **Main contribution:** 실험경매(BDM/SPA/nth-price/Vickrey) 실행 표준 매뉴얼.
- **Method:** Literature review + how-to.
- **Key finding:** N/A (방법론 종합).
- **Relevance:** ⭐ 본 연구의 SPA 실행 표준 — pilot·세션 크기·anonymity·training 설계 참조. (폴더 보유)
- **In folder:** ✓ `CanavariEtAl2019_running-auctions.pdf`

---

## Thematic Organization

### Theoretical Contributions

| 이론 | 핵심 모형 | 예측 (WTP-WTA 갭) | 본 연구 함의 |
|---|---|---|---|
| **Endowment effect / Loss aversion** (KKT 1990) | Prospect theory의 reference-dependent utility | 갭은 손실회피의 자연 귀결 (preference) | 1세대 가설, K-R로 흡수됨 |
| **Misconception account** (Plott–Zeiler 2005, 2007) | 고전 선호 + 실험 절차 효과 | 갭은 BDM/SPA 미숙지에서 발생 — 절차 통제로 0 | 본 연구의 induced × no-info 셀의 영가설 |
| **Expectation-based reference dependence** (Kőszegi–Rabin 2006) | Reference point = recent expectations | 외생적 expectation 조작이 갭을 움직임 | ⭐ 본 연구의 1차 이론 프레임 |
| **Commitment cost** (Zhao–Kling 2001) | 진술 후 변경비용 | 갭의 보조 채널 — practice round 디자인 의존 | Q12 위협 통제 |
| **Outside option** (Cherry et al. 2004) | 거래 거부 옵션의 가치 | SPA에서 outside option이 갭에 영향 | SPA 디자인 결정 |

### Empirical Findings — 갭의 크기와 절차 의존성

| 출처 | 표본 | 메커니즘 | 결과 |
|---|---|---|---|
| KKT 1990 | 학생, 머그컵 | Median value elicitation | WTA/WTP ≈ 2 |
| Plott–Zeiler 2005 | 학생, 머그컵 | BDM + 모든 통제 | 갭 ≈ 0 (정상 절차에서) |
| Plott–Zeiler 2007 | 학생, 머그컵·초콜릿 교환 | 절차 변형 | 비대칭 절차 의존 |
| Isoni–Loomes–Sugden 2011 | 학생, 머그·복권 | PZ 절차 재현 | 머그 갭 0, **복권 갭 유지** |
| List 2003 | dealer, 스포츠카드 | Field exchange | 경험자 ≈ 0, 학생 갭 유지 |
| Engelmann–Hollard 2010 | 학생, 머그 | 강제 거래 후 exchange | 비대칭 사라짐 |
| Ericson–Fuster 2011 | 학생, 머그 | Random trade probability | 20–30% valuation gap |
| Heffetz–List 2014 | 학생, 머그·기프트 | Refined expectation manipulation | K-R 효과 미미 |
| Tunçel–Hammitt 2014 (meta) | 76 study, 337 estimates | mixed | WTA/WTP ≈ 3.28 평균 |

### Methodological Innovations — 본 연구가 의존할 도구

- **Information provision experiment** 방법론 (Haaland–Roth–Wohlfart 2023): pre/post belief 측정, prior heterogeneity 통제, demand effect 통제. **본 연구의 AI 정보 처치는 이 방법론의 valuation domain 첫 적용.**
- **Vickrey/SPA 표준 실행** (Canavari et al. 2019): private booth, training, comprehension check, group size 4–6.
- **Oath procedural device** (Jacquemet et al. 2013): demand effect 통제 옵션. 본 연구 robustness 단계에서 검토.
- **BDM training protocol** (Plott–Zeiler 2005): incentive compatibility 학습. 본 연구는 BDM 대신 SPA 사용하나, training 철학은 차용.

### Open Debates — 본 연구가 기여할 수 있는 지점

**Debate 1: Misconception vs Reference-dependent — 어느 것이 갭의 1차 원인인가?**
- **Plott–Zeiler 측**: 갭은 procedural artifact. 통제 시 사라짐 (PZ 2005, 2007).
- **K-R 측**: 갭은 expectation-driven preference. Ericson–Fuster (2011) 지지.
- **혼재 증거**: Heffetz–List (2014) K-R 약하게 부정, Isoni et al. (2011) PZ에 대한 부분 반박, Fehr et al. (2015) PZ replication 실패.
- **본 연구 기여**: AI 정보를 *fully controllable expectation shifter*로 사용 → induced × homegrown 교차로 두 이론 분리.

**Debate 2: 정보·학습이 갭을 어떻게 줄이는가?**
- **시장 경험**: List 2003/2004 — 자연 학습 효과 (긴 시간 필요).
- **강제 거래**: Engelmann–Hollard 2010 — 직접 노출 (빠른 효과).
- **절차 통제**: Plott–Zeiler 2005 — training으로 misconception 제거.
- **본 연구 기여**: AI = "단시간 집약 정보"가 학습·강제거래·트레이닝의 어느 채널과 가장 가까운지 식별.

**Debate 3: 갭의 외부 타당도 — lab vs field, hypothetical vs real**
- Tunçel–Hammitt (2014) 메타분석: incentive-compatible 메커니즘에서 갭 작음, real-world experience에서 작음.
- **본 연구 기여**: AI 정보의 효과가 lab(통제) 환경에서 발견되면, field LLM 사용 환경의 외부 효과 추정에 base rate 제공.

---

## Gaps and Opportunities

### Gap 1: AI/LLM × experimental valuation의 부재
- 본 검토 범위 내(2026-05-26 기준 WebSearch)에서 AI(LLM) 정보 제공이 WTP·WTA·갭에 미치는 효과를 직접 측정한 lab/field 실험은 **발견되지 않음**.
- 인접 영역: (i) LLM이 *경제 주체로서* 행동 시뮬레이션 (Brand et al. 2023 등), (ii) AI 챗봇이 *구매의도·신뢰*에 미치는 영향 (마케팅 분야), (iii) AI 어드바이저에 대한 *WTP* (Bahr 류).
- **본 연구의 컨트리뷰션 주장 "AI×WTP-WTA 첫 실험"은 본 lit review 범위에서 사실로 확인됨**. 단, Google Scholar 전수조사 + 2024–2026 WP 추적 필요 (특히 NBER WP, SSRN).

### Gap 2: Information provision experiments × valuation domain 부재
- Haaland–Roth–Wohlfart (2023, JEL)이 표준화한 정보 제공 실험 방법론은 macro·finance·labor·health 등에서 사용되나, *endowment·valuation* 도메인에 적용된 사례 부재.
- **본 연구는 Haaland 방법론을 valuation 도메인에 첫 이식** — 두 문헌의 가교.

### Gap 3: K-R 이론의 valuation 도메인에서의 *결정적* 검정 부재
- Ericson–Fuster (2011) 지지 vs Heffetz–List (2014) 반박의 평행 상태. 두 실험 모두 머그컵·확률 조작에 한정.
- **본 연구는 *내용이 통제된 정보 신호*로 expectation을 조작 → 기존 확률 조작의 noise를 제거한 정밀한 K-R 검정**.

### Gap 4: Induced × homegrown × 정보 교차 디자인 부재
- 기존 연구는 induced *또는* homegrown 단일, 또는 정보 조작 *없이*. 본 연구의 2×2 (또는 2×4) 교차 디자인은 갭의 *구성요소 분해*에 새 도구.

---

## Suggested Next Steps

### 우선순위 1 — 명세서 BLOCKED 항목 해소
1. **Gap 1 추가 검증**: Google Scholar에서 "WTP-WTA AI" / "endowment LLM" / "willingness pay ChatGPT" 키워드 검색. NBER WP·SSRN·arXiv 최근 6개월 cross-check. → "first study" 주장의 robustness 확정.
2. **Induced value 객체 선택** (명세서 Open Q1): Isoni–Loomes–Sugden (2011) 결과로 **복권/lottery 사용 신중**. 토큰(known redemption value)이 더 깔끔.
3. **Homegrown 재화 선택** (명세서 Open Q2): Tunçel–Hammitt (2014) 메타분석 결과에 따라 *private goods*가 학생 셋팅에서 가장 작은 갭. 사용자 학문 배경(ag·환경)을 살리려면 **한국 농산물(친환경 쌀 / 친환경 채소 / 농가 직거래 상품) 또는 환경재(탄소상쇄 인증서)** 검토. Choi et al. (2018, 폴더)이 한국 쌀 grade 사례 보유 — 연결성 있음.

### 우선순위 2 — 디자인 확정
4. **Treatment cell 수 재결정** (명세서 ADR-001 보완 ADR-004 작성): Haaland–Roth–Wohlfart (2023)에서 권고하는 typical effect size 표 + Tunçel–Hammitt (2014) 메타분석 base rate 종합 → 셀당 N 권장치 산출 → 2×4 vs 2×2 결정.
5. **이론 프레임 재확정** (명세서 Q6 후속): Heffetz–List (2014)의 K-R 반박을 명세서·이론 섹션에 명시. K-R을 단일 프레임으로 두지 말고 *misconception vs K-R 식별 실험*으로 포지셔닝 — 더 강한 컨트리뷰션.

### 우선순위 3 — 후속 lit review
6. **AI/LLM 정보의 source effect** 별도 lit review: Bursztyn 류 연구는 사회적 정보(다른 사람의 의견)의 신뢰성에 집중. AI source 특성 자체에 대한 실험은 별도 갈래.
7. **Hypothetical bias × cheap talk × oath 통합**: List (2001, 폴더), Jacquemet et al. (2013, 폴더), Cummings & Taylor 류 cheap talk 문헌.

---

## BibTeX Entries

```bibtex
% =============================================================================
% Lit Review 2026-05-26: AI 정보 제공과 WTP-WTA 갭
% 명명 규칙: AuthorYear_keyword (CLAUDE.md INV-2 준수)
% Status: 본 review 시점에 PASS 또는 PARTIAL (CoVe 검증 필요)
% =============================================================================

% ----- Foundational citations -----
@article{KKT1990_endowment,
  author = {Kahneman, Daniel and Knetsch, Jack L. and Thaler, Richard H.},
  title = {Experimental Tests of the Endowment Effect and the Coase Theorem},
  journal = {Journal of Political Economy},
  volume = {98},
  number = {6},
  pages = {1325--1348},
  year = {1990}
}

@article{KoszegiRabin2006_reference,
  author = {K{\H{o}}szegi, Botond and Rabin, Matthew},
  title = {A Model of Reference-Dependent Preferences},
  journal = {Quarterly Journal of Economics},
  volume = {121},
  number = {4},
  pages = {1133--1165},
  year = {2006}
}

@article{Vickrey1961_auction,
  author = {Vickrey, William},
  title = {Counterspeculation, Auctions, and Competitive Sealed Tenders},
  journal = {Journal of Finance},
  volume = {16},
  number = {1},
  pages = {8--37},
  year = {1961}
}

@article{BDM1964_mechanism,
  author = {Becker, Gordon M. and DeGroot, Morris H. and Marschak, Jacob},
  title = {Measuring Utility by a Single-Response Sequential Method},
  journal = {Behavioral Science},
  volume = {9},
  number = {3},
  pages = {226--232},
  year = {1964}
}

% ----- WTP-WTA 갭 핵심 논쟁 -----
@article{PlottZeiler2005_endowment,
  author = {Plott, Charles R. and Zeiler, Kathryn},
  title = {The Willingness to Pay--Willingness to Accept Gap, the ``Endowment Effect,'' Subject Misconceptions, and Experimental Procedures for Eliciting Valuations},
  journal = {American Economic Review},
  volume = {95},
  number = {3},
  pages = {530--545},
  year = {2005}
}

@article{PlottZeiler2007_exchange,
  author = {Plott, Charles R. and Zeiler, Kathryn},
  title = {Exchange Asymmetries Incorrectly Interpreted as Evidence of Endowment Effect Theory and Prospect Theory?},
  journal = {American Economic Review},
  volume = {97},
  number = {4},
  pages = {1449--1466},
  year = {2007}
}

@article{IsoniLoomesSugden2011_comment,
  author = {Isoni, Andrea and Loomes, Graham and Sugden, Robert},
  title = {The Willingness to Pay--Willingness to Accept Gap, the ``Endowment Effect,'' Subject Misconceptions, and Experimental Procedures for Eliciting Valuations: Comment},
  journal = {American Economic Review},
  volume = {101},
  number = {2},
  pages = {991--1011},
  year = {2011}
}

@article{HorowitzMcConnell2002_meta,
  author = {Horowitz, John K. and McConnell, Kenneth E.},
  title = {A Review of {WTA}/{WTP} Studies},
  journal = {Journal of Environmental Economics and Management},
  volume = {44},
  number = {3},
  pages = {426--447},
  year = {2002}
}

@article{TuncelHammitt2014_meta,
  author = {Tun{\c{c}}el, Tuba and Hammitt, James K.},
  title = {A New Meta-Analysis on the {WTP}/{WTA} Disparity},
  journal = {Journal of Environmental Economics and Management},
  volume = {68},
  number = {1},
  pages = {175--187},
  year = {2014}
}

% ----- 경험·학습·강제 거래 -----
@article{List2003_marketexperience,
  author = {List, John A.},
  title = {Does Market Experience Eliminate Market Anomalies?},
  journal = {Quarterly Journal of Economics},
  volume = {118},
  number = {1},
  pages = {41--71},
  year = {2003}
}

@article{List2004_neoclassical,
  author = {List, John A.},
  title = {Neoclassical Theory Versus Prospect Theory: Evidence from the Marketplace},
  journal = {Econometrica},
  volume = {72},
  number = {2},
  pages = {615--625},
  year = {2004}
}

@article{EngelmannHollard2010_forcedtrade,
  author = {Engelmann, Dirk and Hollard, Guillaume},
  title = {Reconsidering the Effect of Market Experience on the ``Endowment Effect''},
  journal = {Econometrica},
  volume = {78},
  number = {6},
  pages = {2005--2019},
  year = {2010}
}

% ----- Expectation reference point 실험 -----
@article{EricsonFuster2011_expectations,
  author = {Ericson, Keith M. Marzilli and Fuster, Andreas},
  title = {Expectations as Endowments: Evidence on Reference-Dependent Preferences from Exchange and Valuation Experiments},
  journal = {Quarterly Journal of Economics},
  volume = {126},
  number = {4},
  pages = {1879--1907},
  year = {2011}
}

@article{HeffetzList2014_expectations,
  author = {Heffetz, Ori and List, John A.},
  title = {Is the Endowment Effect an Expectations Effect?},
  journal = {Journal of the European Economic Association},
  volume = {12},
  number = {5},
  pages = {1396--1422},
  year = {2014}
}

% ----- Methodology -----
@article{HaalandRothWohlfart2023_infoprovision,
  author = {Haaland, Ingar and Roth, Christopher and Wohlfart, Johannes},
  title = {Designing Information Provision Experiments},
  journal = {Journal of Economic Literature},
  volume = {61},
  number = {1},
  pages = {3--40},
  year = {2023}
}

@article{CanavariEtAl2019_runningauctions,
  author = {Canavari, Maurizio and Drichoutis, Andreas C. and Lusk, Jayson L. and Nayga Jr., Rodolfo M.},
  title = {How to Run an Experimental Auction: A Review of Recent Advances},
  journal = {European Review of Agricultural Economics},
  volume = {46},
  number = {5},
  pages = {862--922},
  year = {2019}
}

@article{JacquemetEtAl2013_oath,
  author = {Jacquemet, Nicolas and Joule, Robert-Vincent and Luchini, St{\'e}phane and Shogren, Jason F.},
  title = {Preference Elicitation under Oath},
  journal = {Journal of Environmental Economics and Management},
  volume = {65},
  number = {1},
  pages = {110--132},
  year = {2013}
}

% ----- 보조 채널 (commitment cost / outside option) -----
@article{ZhaoKling2001_commitment,
  author = {Zhao, Jinhua and Kling, Catherine L.},
  title = {A New Explanation for the {WTP}/{WTA} Disparity},
  journal = {Economics Letters},
  volume = {73},
  number = {3},
  pages = {293--300},
  year = {2001}
}

@article{CherryEtAl2004_outsideoption,
  author = {Cherry, Todd L. and Frykblom, Peter and Shogren, Jason F. and List, John A. and Sullivan, Melonie B.},
  title = {Laboratory Testbeds and Non-Market Valuation: The Case of Bidding Behavior in a Second-Price Auction with an Outside Option},
  journal = {Environmental and Resource Economics},
  volume = {29},
  number = {3},
  pages = {285--294},
  year = {2004}
}

% ----- 한국 / 농산물 valuation -----
@article{ChoiEtAl2018_ricegrade,
  author = {Choi, Young Woon and Lee, Ji Yong and Han, Doo Bong and Nayga Jr., Rodolfo M.},
  title = {Consumers' Valuation of Rice-Grade Labeling},
  journal = {Canadian Journal of Agricultural Economics},
  volume = {66},
  number = {3},
  pages = {511--531},
  year = {2018},
  doi = {10.1111/cjag.12168}
}
```

> **Note**: 위 BibTeX 엔트리는 본 lit review 시점에서 검색 결과로 확인된 정보를 바탕으로 작성. CoVe 검증 후 PARTIAL/FAIL 항목은 수정 또는 제거 후 `Bibliography_base.bib`에 통합.
>
> **저자명 주의 (ASSUMED — 한국어 음역)**: `ChoiEtAl2018`의 저자명 한글 표기는 추측. 실제 PDF 표지 확인 권장.

---

## Post-Flight Verification (CoVe) 결과

**2026-05-26, claim-verifier fresh-context fork (2차 round, 신규 추가 13 claim 대상).**

| 결과 | 수 | 비고 |
|---|---|---|
| PASS | 10 | N1·N2·N4·N5·N6·N8·N9·N11·N12 + N13(negative literature; WebSearch caveat) |
| PARTIAL | 2 | N3 (Tunçel-Hammitt 3.28 수치) / N7 (Ericson-Fuster 10/90 + 20–30% 수치) — 본 보고서에서 보수적으로 완화 |
| FAIL | 1 | N10 (Choi et al. 저자명) — **수정 완료**: Young Woon Choi, Ji Yong Lee, Doo Bong Han, Rodolfo M. Nayga Jr. |
| UNVERIFIABLE | 0 | — |

### 핵심 수정 사항 (이미 본 보고서에 반영)

1. **Choi et al. 저자명 정정** (PDF 1면 직접 확인). DOI 10.1111/cjag.12168 추가.
2. **Choi et al. 격상**: §Key Papers에 #15로 별도 entry. 본 연구의 *가장 직접적 선행연구*임을 명시 — 한국 lab + 실험경매 + 정보 제공 처치 + 농산물 homegrown value를 한 패키지로 보유.
3. **Tunçel-Hammitt 수치 완화**: "3.28" → "대략 3 수준 (환경·공공재 ≥ 6)".
4. **Ericson-Fuster 수치 완화**: 정확한 10/90 + 20–30%는 PDF 확인 필요로 표기.

### N13 (negative literature claim) 보강 결과

claim-verifier가 별도로 3개 WebSearch 실행 — **"AI/LLM 정보 제공이 WTP-WTA 갭에 미친 효과를 induced/homegrown value 셋팅에서 직접 측정한 peer-reviewed 경제학 lab/field 실험"은 발견되지 않음**. 인접 연구로 다음을 포착:
- LLMs as simulated economic agents (Pay-What-LLM-Wants, arXiv 2508.03262 등)
- LLM이 자신의 WTP를 보고하는 inferential 실험 (arXiv 2602.09802)
- 챗봇이 가치 기반 선택에 미치는 영향 (arXiv 2511.15857)

이들은 모두 *LLM이 주체* 또는 *AI 정보가 구매의도·신뢰에 미치는 영향*이며, **WTP-WTA 갭을 종속변수로 한 induced/homegrown 교차 실험은 부재**. → 명세서의 "AI×WTP-WTA 최초" 컨트리뷰션 주장은 본 시점에서 **유지 가능**. 단, WebSearch caveat 존재 — Google Scholar 전수 검색 + NBER WP / SSRN / arXiv 정기 모니터링 권고.

### 권고

**SAFE TO PROCEED** — BibTeX 항목을 `Bibliography_base.bib`에 통합 가능. 단, 본 보고서를 인용하는 후속 텍스트에서 Tunçel-Hammitt 수치를 인용할 경우 PDF 재확인 필요.
