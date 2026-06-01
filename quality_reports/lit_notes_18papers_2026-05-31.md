# 선행연구 정독 노트 — 폴더 18편 (2026-05-31)

**목적:** `master_supporting_docs/supporting_papers/` 18편 전체 정독. ADR-011(induced/homegrown 2-chapter 분리 설계) 정합성 점검 + lit-review 기반.
**방법:** PDF 본문(pypdf) 전체 추출 → 4개 클러스터 병렬 정독. 모든 수치는 본문 인용(추정 아님).
**언어:** 종합 시사점은 한국어, 다이제스트는 정밀 인용 위해 영문 유지.

---

## A. 종합 시사점 (프로젝트 직결)

### A-1. Chapter 1 (induced lottery) 메커니즘 — 확정 근거
- **Random nth-price 채택 정당화 = Shogren et al. (2001).** n∈{2,…,k} 무작위, (n−1)명 낙찰·nth가격 지불. **off-margin 입찰자 재참여**가 핵심 이점 — AI 앵커(±20%)가 다수를 시장청산가에서 멀리 밀어내므로(=off-margin) SPA보다 적합.
- **대가:** 분산 ↑, on-margin은 SPA가 우수, **음수 입찰 왜곡 심함**(Lee & Fox 2015) → **lottery는 EV≥0 + WTP full-bidding 프레임**으로 음수 입찰 경로 차단(endowment-exchange 프레임 회피).
- **BDM 기각:** lottery에서 non-EU 하 incentive-compatible 아님(Karni–Safra; Canavari). → nth-price가 맞음.
- **가격 피드백 금지:** Corrigan et al. (2012) — 라운드 간 가격 게시가 induced 입찰을 *진짜 가치에서 멀어지게* 함(앵커링). Lee 2020도 이 근거로 no-feedback. → 본 설계 no-feedback 유지.
- **outside option 통제:** Cherry et al. (2004) — 대체 경로가 있으면 입찰을 그쪽 가격으로 shave. lottery EV를 얻는 대안 경로가 없도록 설계.

### A-2. 인지능력 — Lee 2020이 직접 템플릿 + **spec 수치 정정**
- Lee, Nayga, Deck & Drichoutis (2020, AJAE 102(5)): **RSPM**(CRT 아님), induced-value SPA, 값 $0–30, **no-feedback**. → Ch1과 거의 동일 셋업.
- **⚠️ 정정:** 기존 spec/ADR-011의 "저인지능력 입찰 분산 **3배**"는 **본문에서 확인 안 됨.** 실제 load-bearing 수치:
  - perfect demand-revealing 입찰: **고능력 29.4% vs 저능력 13.4%**
  - 집계 revelation ratio: **고 106.73% vs 저 114.83%**
  - RSPM 점수 분산 차이 F=2.42 (p<0.001) — 이건 *점수* 분산이지 입찰 분산 아님
  - RE-probit 한계효과: 전체 −0.08***, 고능력 −0.19***, 저능력 +0.05(n.s.)
  - → **"3배" 표현 삭제하고 위 수치로 교체. RSPM 측정 필수(CRT 단독 불가).**

### A-3. AI appreciation/aversion — **결정적 scope condition**
- Logg, Minson & Moore (2019, OBHDP 151): algorithm appreciation, WOA d≈**0.42(1A), 0.44(1C)**, 범위 0.29–0.44.
- **그러나 Exp 3:** 알고리즘 vs *타인* 판단이면 88% 선택, 알고리즘 vs *자기 자신* 판단이면 66%로 **appreciation 약화**. 전문가는 오히려 aversion.
- **함의:** **경매 입찰 = 피험자 자신의 판단**이므로, 본 설계는 Logg의 낙관적 조건이 아니라 **aversion-prone 조건(self-judgment)에 가깝다.** → Ch1을 "appreciation을 *유인 적합·자기판단* 환경에서 검증한 최초"로 포지셔닝하되, 효과는 d≈0.4를 *상한*으로 보수적 해석.

### A-4. Chapter 2 (homegrown) — 가상편의 계보
- **Fox et al. (1998) CVM-X:** 보정계수 auction/survey ≈ **0.55–0.86 (commodity-specific)**. Bias = WTP_CVM − WTP_auction의 원형. *경고:* 사전 가상 입찰을 보여주면 앵커링으로 보정계수가 1쪽으로 편향 → Ch2가 CVM 숫자를 경매 전 노출하면 동일 오염.
- **List (2001):** cheap talk이 **비경험자엔 효과(편의 제거), 경험자엔 무효** → "AI 정보도 저지식/저능력 소비자에게 더 크게 작동" 이질성 가설의 직접 근거. 가상/실제 비율 ≈ **1.9**.
- **Jacquemet et al. (2013) oath:** **동일 메커니즘(Vickrey)으로 induced + homegrown 병렬 실험** = 본 2-chapter 구조의 가장 가까운 템플릿. off-margin(저가치) 입찰자가 over-revelation 주도 → AI 앵커가 분포의 특정 지점에서 가장 왜곡한다는 예측의 선례. Tobit slope-on-induced(목표=1)가 왜곡 지표.
- **Choi et al. (2018):** 한국·random nth-price·식품·정보처치. **단순 라벨이 대부분 효과, 상세 정보는 추가 효과 미미**(Round2 vs 3 n.s.) → AI dose-response의 강한 prior. CV/IV 근사 동일.

### A-5. 위험선호 교란 (Ch1 lottery 필수 주의)
- **Sprenger (2015, JPE):** elicitation 프레임(certain vs stochastic referent)이 측정 위험태도를 **3–4배** 바꿈. → lottery 자체가 reference-dependent/risk 교란 주입. **referent를 AI arm 간 동일 고정 + 위험선호 별도 측정** 필요(ADR-011의 Holt–Laury 정합).
- **Zhao–Kling (2001) commitment cost:** known value→cost≈0 (Ch1), uncertain value→cost>0 (Ch2). → **AI 정보 효과가 Ch2에서 더 클 것**이라는 비행동(rational) 채널 예측. 앵커링과 구분 필요.
- **Imas (2016):** realization effect — 반복 lottery에서 realize/bracketing이 위험태도 변경 → feedback·realization 구조 고정해 AI 효과와 분리(주변적이지만 설계 통제 근거).

### A-6. KR 논쟁(강등) 방어 + 설계 교훈
- **Ericson–Fuster (2011, 친-KR, 22.7% vs 56.5% 교환) vs Heffetz–List (2014, 반-KR, expectations per se 효과 없음).** 미해결 → 강등 정당. 
- **HL 핵심 설계 교훈:** 제시하는 *확률/정보를 피험자가 "가치 신호"로 읽음*(Plott–Zeiler value-inference 교란). **투명 무작위화**로 중화. → AI arm(정확/편향)이 "실험자/AI가 진짜 가치를 알려준다"로 읽히지 않게 설계 가드 필요.
- **Plott–Zeiler (2005):** misconception 통제 절차(훈련+익명+유인적합)가 갭을 켜고 끔. induced/lottery 라운드는 **분석 안 한 paid practice**였음(fn15) + induced 정답이 "이해"가 아니라 "주어진 값 보고"일 수 있다는 경고(fn11) → Ch1이 induced를 *분석 대상*으로 쓸 때 이 해석 한계 명시.

### A-7. 방법론 플레이북
- **Haaland, Roth & Wohlfart (2023, JEL):** 정보제공 실험 설계서. **prior 측정**(이질성·learning-rate), **active control**(=정확 arm), **numerical anchoring 주의**(=편향 arm이 곧 의도적 앵커), demand-effect 완화, learning-rate β₁ = 유인적합 환경의 WOA 아날로그.
- **Canavari et al. (2019, ERAE) 리뷰:** power 공식(라운드·ρ 반영), **3-arm 배분 ½–¼–¼**(통제·정확·편향), Tobit/double-hurdle/multilevel, 그룹 크기 일정, house-money 완화(실노력 endowment), 연습+퀴즈+placebo 무작위화 점검. Lee et al.(2017) RSPM 선례 명시.

### A-8. 핵심 액션 아이템 (정정/반영)
1. **ADR-011·spec: "분산 3배" → Lee 2020 실제 수치(29.4%/13.4%, 106.7%/114.8%, F=2.42)로 교체.**
2. Logg 효과를 *self-judgment 상한*으로 보수 해석 추가.
3. Jacquemet 2013을 2-chapter 구조의 핵심 템플릿 인용으로 격상.
4. Sprenger를 Ch1 risk 교란 핵심 인용으로, referent 고정 명시.
5. 음수 입찰 차단(EV≥0, WTP 프레임) — Lee & Fox 근거.
6. 3-arm 표본 배분 ½–¼–¼ + Canavari power 공식 적용(후속 ADR).

---

## B. 클러스터별 다이제스트 (18편)

### B-1. 메커니즘·방법 (4편)

#### Shogren, Margolis, Koo & List (2001), *JEBO* 46:409–421 — Random nth-price auction
- **RQ:** off-margin 입찰자까지 sincere 입찰을 끌어내는 메커니즘?
- **설계:** 봉인입찰 후 순위, n∈{2,…,k} 무작위 추첨, (n−1)명 낙찰·nth가격 지불. Exp I(10명·20R, 값 U[$0.10,$10]), Exp II(37명, ABA로 SPA↔nth 비교).
- **결과:** Exp I 평균입찰 $5.14 vs 값 $5.32(차이 n.s.; slope 0.89, 완전계시 기각 못함 F=1.43,p=0.24). Exp II: SPA는 on-margin 우수(p<0.05), nth는 off-margin 우수(p<0.10), 풀하면 동등. nth 분산 ↑.
- **관련성(Ch1):** 메커니즘 1차 근거. Vickrey×BDM 하이브리드(가격 endogenous-but-random). AI 앵커가 off-margin 양산 → nth 적합.
- **주의:** 소표본; "more confusing"(on-margin 열등); 토큰(=lottery 아님, risk 미고려); 입찰 stickiness 48%.

#### Canavari, Drichoutis, Lusk & Nayga (2019), *ERAE* 46(5):862–922 — How to run an experimental auction
- **성격:** 방법 리뷰(2016–18 ~102편/년).
- **핵심:** nth/random-NPA 선택 이유 = Shogren 2001(off-margin). 단점=판매단위 예측불가(비용). **BDM lottery 부적합**(Karni–Safra) + 앵커링. 그룹크기 일정·소그룹 다수. house-money=실노력 endowment로 완화. **라운드 간 가격게시 금지**(Corrigan). 연습+퀴즈, practice를 무작위화 placebo로. **Power 공식 Eq.1**(라운드 M·상관 ρ). **3-arm 배분 ½–¼–¼**(List et al. 2011). Tobit/double-hurdle/multilevel. **Lee et al.(2017) RSPM** 선례.
- **관련성(양 chapter):** 방법 백본. 표본·배분·추정·house-money·그룹·instruction 전반.
- **주의:** 2차 종합(원전 추적 필요); 농식품 편향.

#### Lee & Fox (2015), *Economics Letters* 136:151–153 — Positive/negative values
- **RQ:** 음수 입찰 허용 시 sincere 입찰? 5th-price vs random-nth.
- **설계:** KSU 27명 분석, endowment 교환(WTP+ / WTA−), Trail Mix↔Dried Fruit, n∈{2,…,8}.
- **결과:** **양수 WTP는 양 메커니즘서 계시적**(nth: slope 0.91, p=0.92); **음수 WTA는 기각**(과대절댓값; WTA≫WTP 16 vs 3). **음수 과대입찰은 random-nth서 더 심함.**
- **관련성(Ch1):** lottery EV≥0 + WTP full-bidding이면 음수 경로 회피 안전. endowment-exchange·WTA 프레임은 위험.
- **주의:** 소표본(Econ Letters note); 스낵재(risk 아님); 교환 프레임.

#### Cherry, Frykblom, Shogren, List & Sullivan (2004), *Env & Resource Econ* 29:285–294 — Outside option
- **RQ:** SPA 입찰이 outside option(대체재 게시가)을 반영하나? 실제/가상 모두?
- **설계:** induced-value Vickrey, 2×4(실/가상 × oo가격 $2/$4/$6/none), 10명·10R, Wyoming, N=800 panel Tobit.
- **결과:** outside option 있으면 입찰 shave(↓), 낮을수록 강함($2→−4.22***). 실제<가상(−2.08,p=0.057). **shave는 실/가상 동일**(상호작용 n.s.) → Smith 1994 conjecture 미지지.
- **관련성(Ch1):** lottery EV 대체경로 없도록 통제 안 하면 WTP가 대체재 가격 반영. Tobit 양단 censoring.
- **주의:** induced·인위적 완전대체재; 가상편의 p=0.057 한계적; 소표본.

### B-2. 가상편의·보정 (4편)

#### Fox, Shogren, Hayes & Kliebenstein (1998), *AJAE* 80(3):455–465 — CVM-X
- **RQ:** 설문 WTP의 상향 가상편의를 경매로 *측정·보정*하는 4단계 절차(CVM-X)? 보정계수는 재화특정적?
- **설계:** 조사(182 전화) → 부표본 lab 경매(N=58/19) → 보정함수 추정 → 비참여자 적용. 재화=방사선조사 돈육 risk. Vickrey/random nth.
- **결과:** **보정계수 조사→경매: irradiated 0.67–0.69, non-irradiated 0.55–0.59(재화특정).** 모델 ECF irradiated 0.69(trial2)→0.86(final). Wald로 계수=1, =0.5 모두 기각(단일 deflator 부적절). 시설견학 정보가 입찰 이동.
- **관련성(Ch2 앵커논문):** Bias=WTP_CVM−WTP_auction의 원형. 정보처치(견학)→가치 이동 = AI 처치 선례. 사전입찰 reminder=앵커링 경고.
- **주의:** 소표본(N=19); reminder로 계수 상향편향(보수적); 단일 deliverable 사적재 한정.

#### List (2001), *AER* 91(5):1498–1507 — Cheap talk, sportscards
- **RQ:** cheap talk이 가상편의 제거? 경험에 따라 달라지나?
- **설계:** Vickrey 2nd-price, Cal Ripken 카드, 현장(Tampa). 3처치(가상/cheap talk/실제)×딜러vs비딜러. N=121딜러+250비딜러.
- **결과:** 가상/실제 비율 ≈1.85–1.95. **비딜러: cheap talk 작동(실제와 동일, t=−0.07).** **딜러: cheap talk 무효(t=−0.32).** 회귀: 비딜러 D_cheaptalk=−21.59*, 딜러 D_cheaptalk=−12.55(n.s.).
- **관련성(Ch2):** "편의완화 도구는 저지식자에만 작동" → AI 정보 이질성 가설 직접 근거. ~1.9 벤치마크.
- **주의:** 단일재/단일쇼; 1인1입찰; 경험=관찰적·혼재.

#### Jacquemet, Joule, Luchini & Shogren (2013), *JEEM* 65(1):110–132 — Oath
- **RQ:** 선서(commitment device)가 sincere 입찰 유도? induced·homegrown 양쪽? cheap talk보다?
- **설계:** Vickrey 일관. IV실험(유도수요 9값, 72명) + HG실험(돌고래 입양 기부, 90 obs). Baseline/Incentives/Oath + Training/CheapTalk 보조.
- **결과:** IV 개인계시: Baseline·Incentives 완전계시 기각, **Oath만 기각 안됨(W=15.55,p=0.11)**, Tobit slope **Oath 0.969**(최근접1). HG: Baseline €17.43 / Incentives €2.98(갭 584.9%) / **Oath €11.46**(갭 절반). 예산위반 47.7%→18.9%, false-zero 26.7%→1.1%. Training 무효과(misconception 치료 아님). Oath+CheapTalk 상보.
- **관련성(양 chapter 핵심 템플릿):** **동일 메커니즘으로 IV+HG 병렬** = 2-chapter 구조의 가장 가까운 선례. slope-on-induced=왜곡 지표. 가상편의를 과대+false-zero로 분해.
- **주의:** 소표본/세션; 프랑스풀은 집계 IV 편의 無(이전); HG 진짜가치 미관측; oath 자발(자기선택).

#### Choi, Lee, Han & Nayga (2018), *CJAE* 66(3):511–531 — Rice-grade labeling
- **RQ:** 쌀 등급 정보가 WTP에 미치는 효과? 의무등급제 WTP?
- **설계:** N=212 서울 주구매자, **random nth-price**, 4등급 1kg, **within-subject 3R(무정보→라벨→상세)**, 이후 CV/IV(DBDC)+cheap talk.
- **결과:** R1 무정보 등급구분 못함(F=1.3 n.s.). R2 라벨: Super +15.7%, 프리미엄 Super +36.9%/Good +23.3%/Normal +10.6%(F=77.6***). **R2 vs R3(상세) 차이 n.s. — 단순 라벨이 대부분.** CV≈600 / IV≈623 KRW(차이 n.s.).
- **관련성(Ch2 한국 템플릿):** 동 연구군·동 메커니즘·식품·정보처치. **단순 라벨=대부분 효과** → AI dose-response prior. CV+경매+cheap talk 병행.
- **주의:** 결과=등급프리미엄(깨끗한 within-good 가상편의 아님); within-subject 순서 혼재; 주부 표본.

### B-3. WTP-WTA·endowment·risk (5편)

#### Plott & Zeiler (2005), *AER* 95(3):530–545 — Misconceptions
- **RQ:** WTP-WTA 갭은 endowment effect인가 subject misconception 산물인가?
- **설계:** 수정 BDM, 머그(+lottery practice). KKT 재현 arm vs 풀통제 arm(훈련+유인적합+유료연습+익명). N=74 머그라운드.
- **결과:** KKT 재현=갭 재현(WTP $1.74 vs WTA $4.72, p=0.00). 풀통제=**갭 소멸**(Exp1 $5.20 vs $5.69, p=0.94). Exp2(유료연습 없음)도 갭 無 → 훈련+익명만으로 충분. WTA=2×WTP 기각.
- **관련성(Ch2):** 훈련절차가 load-bearing. **induced/lottery는 분석 안 한 paid practice였음(fn15);** induced 정답=이해 아닐 수 있음(fn11) → Ch1 해석 한계. 갭=절차 산물 → KR 강등 방어.
- **주의:** 소셀(n=8–16); 저검정력; 2007 Econometrica판과 혼동 금지.

#### Heffetz & List (2014), *JEEA* 12(5):1396–1422 — Expectations effect?
- **RQ:** KR expectations가 endowment effect 설명하나?
- **설계:** 머그/펜, 투명 동전, assignment×expectations 2×2(→2×2×2), N=560.
- **결과:** **assignment는 13–22pp 효과**(non-KR)지만 **expectations per se 효과 無**(점추정 역방향). EF의 34pp 효과 재현 못함·CI가 기각.
- **관련성:** KR 강등 배경(반-KR). **설계교훈:** 확률/정보를 가치신호로 읽는 교란 → 투명 무작위화로 중화(AI arm 가드).
- **주의:** 이진 keep/trade(가격 아님); EF와 미해결 대립쌍.

#### Ericson & Fuster (2011), *QJE* 126(4):1879–1907 — Expectations as endowments
- **RQ:** expectations가 reference point? 확률 조작이 교환·가치 이동?
- **설계:** Exp1 교환(N=45, 10%vs90%), Exp2 가치(N=112, modified BDM price-list). 투명 무작위화.
- **결과:** Exp1 교환 **22.7% vs 56.5%(p=.033, 34pp)**. Exp2 고기대 머그 **20–30%↑**(pen 통제 후 β≈0.27–0.31,p<.05). motivated taste change 無.
- **관련성:** KR 강등 배경(친-KR, HL과 대립쌍). **설계도구:** BDM price-list(단일switch, $0.33 focal 회피), **control-good(pen) 분산흡수** → AI효과/잡음 분리에 이식 가능. 머그 WTA 고분산(SD≈2.5) → Ch2 잡음·검정력 경고.
- **주의:** 소표본; 원효과는 pen 통제 의존; HL과 대립.

#### Zhao & Kling (2001), *Economics Letters* 73(3):293–300 — Commitment cost
- **RQ:** WTP/WTA 격차가 reference-dependence 없이 *합리적* commitment cost로 발생?
- **설계:** 이론(real-options/quasi-option) + 기존 실험 재해석.
- **결과:** 불확실+비가역+학습기회제약 → 학습옵션 보상 요구 → WTP<EV, WTA>EV. KKT 토큰=격차無, 머그=격차有; List 경험↑→격차↓ 와 정합.
- **관련성:** Ch2 가상편의 비행동 배경. **known value(Ch1)→cost≈0 vs uncertain(Ch2)→cost>0 → AI효과 Ch2서 더 큼** 예측. 앵커링과 구분 필요.
- **주의:** 8p 노트; 실증은 재해석; WTP·WTA 양측 joint 예측.

#### Sprenger (2015), *JPE* 123(6):1456–1499 — Endowment effect for risk
- **RQ:** referent가 certain→stochastic이면 위험태도 변하나(KR vs DA 분리)?
- **설계:** 금전 lottery, between(N=136, PE vs CE 과제) + within(N=76, A&S 2011 재분석). price-list 단일switch, 일부 BDM.
- **결과:** **stochastic referent(PE)에서 위험회피 분류 3–4배** ↑. KR이 집계·개인·in/out-sample 조직, DA와 분리.
- **관련성(Ch1 직결):** lottery 가치=elicitation 프레임(referent)에 의존. **risk·referent 교란을 AI효과와 분리 필수** → referent 고정 + 위험선호 별도측정.
- **주의:** 금전gamble(물리적 endowment 아님); within은 재사용데이터; HL과 반대극.

### B-4. 인지능력·AI·정보·위험 (5편)

#### Lee, Nayga, Deck & Drichoutis (2020), *AJAE* 102(5):1494–1510 — Cognitive ability & bidding
- **RQ:** 인지능력이 induced SPA 입찰편차 설명?
- **설계:** **RSPM**(CRT 아님). Exp1 학생 150(median split·고지), Exp2 일반 120(무고지). induced 값 $5.18~$29.12, **no-feedback**.
- **결과:** perfect-revealing **고 29.4% vs 저 13.4%**. revelation ratio **106.73% vs 114.83%**. 점수분산 F=2.42. RE-probit 한계효과 전체 −0.08***, 고 −0.19***, 저 +0.05(n.s.). 고능력만 경험으로 개선.
- **관련성(Ch1 직접 템플릿):** 동 RSPM·induced SPA·no-feedback. **"AI가 저능력 가장 도움" = Lee 확장.** ⚠️ "3배" 주장 본문 無 → 위 수치로 교체.
- **주의:** Exp1 type 고지(믿음조작); 값 재사용; RSPM 무유인.

#### Logg, Minson & Moore (2019), *OBHDP* 151:90–103 — Algorithm appreciation
- **RQ:** 조언이 알고리즘 출처면 더 채택?
- **설계:** JAS, DV=WOA. 6실험(체중·노래·매력 등).
- **결과:** WOA **d=0.42(1A), 0.44(1C)**. **Exp3: vs 타인 88% but vs 자기 66%(약화).** 전문가는 aversion(Exp4).
- **관련성(Ch1):** appreciation 극 벤치마크. **경매=자기판단 → aversion-prone 조건. 효과는 d≈0.4 상한으로 보수.** "유인적합·자기판단서 검증 최초"로 포지셔닝.
- **주의:** 비유인 advice-revision(경매 아님); 대부분 외부알고 vs 외부타인; "알고리즘"=단순 통계모형(LLM 아님).

#### Corrigan, Drichoutis, Lusk, Nayga & Rousu (2012), *AJAE* 94(1):97–115 — Repeated rounds & price feedback
- **RQ:** 가격 피드백이 합리성 ↑(학습) or ↓(앵커)?
- **설계:** Exp1 lottery(N=71, 2×2), Exp2 induced(N=104/93, posting vs no).
- **결과:** 피드백→preference reversal ↑(+0.197**). **Exp2: 피드백→|bid−value| 증가(+0.031***/+0.186***), no-feedback→감소.** → 반복은 도움이나 *피드백은 해로움*.
- **관련성:** **no-feedback 설계의 직접 근거**(Lee 2020 인용처). 외부 정보(게시가)가 induced 입찰 왜곡 = 편향 AI arm의 메커니즘. 앵커 모델 b=αt+βA.
- **주의:** 정보=게시가(AI 아님); 소표본; Exp2A/2B 초기 부호 반대.

#### Imas (2016), *AER* 106(8):2086–2109 — Realization effect
- **RQ:** realized vs paper loss가 이후 위험감수 좌우?
- **설계:** CPT+bracketing 이론 + 3 투자게임(N=128/246/120).
- **결과:** realize→위험감수↓(β=−0.38~−0.47), paper→↑. 계좌이체(비현금)만으로 충분. Flexible→loss-chasing.
- **관련성(주변적):** 반복 lottery에서 realize/bracketing이 위험태도 변경 → feedback/realization 고정해 AI효과와 분리.
- **주의:** 경매·정보·인지 아님(개념적); prior loss 특정; 소셀.

#### Haaland, Roth & Wohlfart (2023), *JEL* 61(1):3–40 — Designing information-provision experiments
- **성격:** 정보제공 실험 방법 서베이.
- **핵심:** **prior 측정**(이질성·learning-rate), **active control**(placebo 정보), **numerical anchoring 주의**, demand-effect 완화(de Quidt 2018: 온라인선 작음), 온라인표본. learning rate β₁: 인플레 0.39, 주택 0.18 등(시간감쇠). 신념효과 ≫ 행동효과.
- **관련성:** AI 처치 설계 플레이북. prior(=lottery EV) 측정→WOA 아날로그 β₁. **정확 arm=active control, 편향 arm=의도적 앵커.** demand-effect 가드.
- **주의:** 설문기반(유인경매 아님); 효과수치=거시도메인; "정보"=연구자 통계(AI 아님).

---

## C. 후속

- 본 노트 → `/lit-review`로 **AI/LLM × valuation/WTP × experiment** 유사연구 추가 탐색(폴더에 AI-경제 실증이 Logg 1편뿐 — gap 검증 필요).
- 정정 액션(A-8) → ADR-011 및 spec §3/§4 갱신 시 반영.
