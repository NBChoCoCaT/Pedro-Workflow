# Literature Review: AI 조언 의존(reliance) — 과소의존 vs 과의존, BSR+BDM 분리, gap·인용 검증

**Date:** 2026-06-06
**Query:** AIWTPGap 프로포절 v2 헤드라인 문헌 — (1) 과소의존(사회적학습) vs 과의존(AI) 모순 + 출처비교, (2) BSR+BDM 믿음/앵커 분리 방법, (3) AI×induced-value gap, (4) 위험 인용 검증.
**Method:** 3개 병렬 검색 에이전트(① 모순·출처, ② 방법, ③ gap·검증[claim-verifier]). 모든 인용 직접 출처 확인. UNVERIFIED 명시.

---

## Summary

본 프로포절의 헤드라인 모순 — **인간 조언에는 과소의존(under-reliance), AI 조언에는 과의존(over-reliance)** — 은 **두 문헌이 서로 다른 패러다임에서 따로 자란 결과**다. 과소의존 근거는 social-learning/known-DGP·induced-value·incentive-compatible 경제학 실험(Weizsäcker 2010; Möbius et al. 2022; Bonaccio–Dalal 2006)에서, 과의존 근거는 homegrown estimation·약한 인센티브·ground-truth 불명확한 HCI/심리 실험(Logg et al. 2019; Klingbeil et al. 2024; Greiner et al. 2025)에서 나온다. **네 조건(induced-value known-truth + 동일 숫자 내용 + AI vs 인간 라벨 + IC elicitation)을 동시에 충족해 두 축을 한 설계에서 직접 대결시킨 연구는 확인되지 않았다** → 모순은 known-truth 인센티브 환경에서 진정으로 미해결.

방법 측면에서, BSR belief elicitation(Hossain–Okui 2013)과 BDM anchoring(Ariely et al. 2003)은 각각 정립돼 있으나 **둘을 결합해 AI-advice 효과를 belief-mediated path와 direct anchoring path로 분해한 발표 경제학 실험은 없다**(가장 근접 Ioannidis 2023은 매개분석 안 함) → 분해 설계는 기여 가능. 단 두 가지 제약: **(i) WOA는 정의상 pre/post 2단계 belief 측정 필요**(Bailey et al. 2022), **(ii) BSR은 행동상 center-bias**(Danz et al. 2022)가 있어 프로토콜에서 다뤄야 함. 또한 **앵커링은 IC elicitation에서 크게 약화**(Fudenberg et al. 2012; Maniadis et al. 2014; binary lottery선 0) → 앵커 채널 효과크기를 보수적으로 잡아야 한다.

Gap 주장은 **좁히면 생존**: "AI advice를 처치로, induced-value known-truth 과제에서, IC elicitation으로 인간 reliance를 식별하는 최초"는 방어 가능. "AI advice 실험 최초"는 명백히 거짓(Klingbeil·Alon-Barkat 존재).

---

## Key Papers (verified)

### 과소의존 축
- **Weizsäcker (2010), AER 100(5):2340–2360** — 13개 cascade 실험 메타. 자기 신호 반대로 남을 따르는 게 최적일 때도 따르지 않아 수익 포기; 평균 참가자는 **2:1 odds 넘어야** 신호 거스름(합리적이면 1:1). 외부신호 **과소의존**의 앵커.
- **Möbius, Niederle, Niehaus & Rosenblat (2022), Management Science 68(11):7793–7817** — known DGP·IC belief tracking. **conservatism(과소 업데이트)** + 긍정피드백 과대가중. known-truth 조건과 직접 정합.
- **Ambuehl & Li (2018), GEB 109:21–39** — 신호 정보성↑일 때 정보 가치 **과소반응**. (질의의 JRU는 오기 → GEB.)
- **Bonaccio & Dalal (2006), OBHDP 101(2):127–151** — advice-taking 기본값은 **egocentric discounting(조언에 과소가중)**. WOA 프레임 표준 인용.

### 과의존 축
- **Logg, Minson & Moore (2019), OBHDP 151:90–103** — 동일 조언도 "알고리즘 출처"면 더 채택(**appreciation**). AI 라벨이 가중↑.
- **Dietvorst, Simmons & Massey (2015), JEP:General 144(1):114–126** — 오류 목격 후 회피(**aversion**) = 과의존의 boundary.
- **Klingbeil, Grützner & Schreck (2024), Computers in Human Behavior 160:108352** — incentivized·interactive. **AI 생성임을 아는 것만으로 과의존**, 자기 판단과 상충해도 따름. 가장 근접한 인센티브 과의존 증거. ⚠️ known-truth 명시 여부 UNVERIFIED.
- **Greiner et al. (2025), Management Science 72(1), DOI 10.1287/mnsc.2022.02777** — ~1,500명 Airbnb 가격추정. **금전 인센티브가 알고리즘 의존 *증가*** (통설 반대); 정확도 고정·프레이밍만 조작.

### 방법
- **Hossain & Okui (2013), REStud 80(3):984–1001** — BSR 원전. risk-attitude-robust truthful belief elicitation.
- **Danz, Vesterlund & Wilson (2022), AER 112(9):2851–2883** — ⚠️ BSR은 *행동상* IC 아님; 인센티브 정보↑→**center-bias(0.5쪽)**. neutral framing·인센티브 정보 최소화 권고.
- **Bailey et al. (2022), Current Psychology 42(28):24516–24541** — WOA 메타(346 ES). 평균 **WOA=0.39** [0.37,0.42]. **WOA=(final−initial)/(advice−initial) → pre/post 2단계 필수.**
- **Haaland, Roth & Wohlfart (2023), JEL 61(1):3–40** — information-provision 표준틀; belief-mediation(prior 도구화) 식별. (단 outcome이 보통 태도/행동이지 BDM valuation 아님 → 차별점.)
- **Ioannidis (2023), JBEE 106:102060** — valuation+앵커+perceived informativeness(정보 많을수록 앵커↑). **belief 매개분석은 안 함** → 가장 근접하나 분해 갭 잔존.
- **Ariely, Loewenstein & Prelec (2003), QJE 118(1):73–106** — coherent arbitrariness; BDM WTP에 임의 앵커 영향.
- **Fudenberg, Levine & Maniadis (2012), AEJ:Micro 4(2):131–145** — ALP 재현: market goods 매우 약함, **binary lottery 앵커 0**.
- **Maniadis, Tufano & List (2014), AER 104(1):277–290** — 앵커링 훨씬 약함 + false-positive·power 이론.
- **Erkal, Gangadharan & Koh (2020), JEP 81:102315** · **Schotter & Trevino (2014), Ann. Rev. Econ. 6:103–128** — BSR replication·belief-elicitation 서베이(보조).

### 인용 검증 정정 (③)
- **Sunstein (2022)** = *Duke Law Journal* 71(6):1175–1205 ✅
- "Noti & Chen" ❌ → **Noti, Donahue, Kleinberg & Oren (2025), EC'25 (arXiv:2502.13062)**
- "LLM anchoring 2024 arXiv" ❌ → **Nguyen (2024), J. Behavioral & Experimental Finance 43:100971** (J&K 1995 귀속 재확인 필요; anchoring index ≈0.37)
- Alon-Barkat & Busuioc (2023), JPART 33(1):153–169 ✅ (automation bias 부분만, 핵심=selective adherence)
- arXiv 2602.09802(Reusens et al., LLM WTP 과대추정; "view"=호텔 전망)·2506.23107(Song et al., LLM risk-averse)·2411.06837(Noels et al., 설득 서베이) ✅

---

## Gaps and Opportunities

1. **핵심 gap (생존):** induced-value known-truth + 동일 숫자 내용 + **AI vs 인간 라벨** + IC elicitation을 동시 충족해 과소/과의존을 한 설계서 대결한 연구 없음. → 본 설계가 정확히 겨냥. **단 SOURCE ARM(AI vs 인간, 내용 고정)이 adjudication의 필수 조건** — 현 v2엔 없음.
2. **방법 gap:** BSR(belief)+BDM(value)로 AI-advice를 belief-mediated vs direct-anchoring 분해 — 발표 선례 없음. 기여 가능(절제된 주장).
3. **설계 강제사항(A/B 무관):** (i) WOA용 **pre/post 2단계 belief**, (ii) **BSR center-bias** 통제, (iii) 앵커 채널 **약효과 전제** power.

## Suggested Next Steps

- **SOURCE ARM 추가** (AI 라벨 / 인간 동료 / 익명, 숫자 동일) — 헤드라인 식별의 핵심.
- **2단계 belief(pre/post AI) + center-bias 통제 프로토콜** 설계 반영.
- gap 문구를 4조건 한정형으로 교체.
- 인용 정정(Noti·Nguyen·Sunstein venue) + 신규 추가(Danz 2022, Bailey 2022, Greiner 2025, Möbius 2022, Ambuehl–Li 2018, Ioannidis 2023, Schotter–Trevino 2014, Erkal 2020).
- ⚠️ 인용 전 확인: Klingbeil(2024) known-truth 유무, You·Yang·Li(SSRN 4083722) 게재처, Jussupow et al.(2024 MISQ) 페이지.

## BibTeX (verified)

```bibtex
@article{Weizsacker2010, author={Weizs\"acker, Georg}, title={Do We Follow Others When We Should? A Simple Test of Rational Expectations}, journal={American Economic Review}, volume={100}, number={5}, pages={2340--2360}, year={2010}}
@article{MobiusNiederleNiehausRosenblat2022, author={M\"obius, Markus and Niederle, Muriel and Niehaus, Paul and Rosenblat, Tanya}, title={Managing Self-Confidence: Theory and Experimental Evidence}, journal={Management Science}, volume={68}, number={11}, pages={7793--7817}, year={2022}}
@article{AmbuehlLi2018, author={Ambuehl, Sandro and Li, Shengwu}, title={Belief Updating and the Demand for Information}, journal={Games and Economic Behavior}, volume={109}, pages={21--39}, year={2018}}
@article{BonaccioDalal2006, author={Bonaccio, Silvia and Dalal, Reeshad S.}, title={Advice Taking and Decision-Making: An Integrative Literature Review}, journal={Organizational Behavior and Human Decision Processes}, volume={101}, number={2}, pages={127--151}, year={2006}}
@article{LoggMinsonMoore2019, author={Logg, Jennifer M. and Minson, Julia A. and Moore, Don A.}, title={Algorithm Appreciation: People Prefer Algorithmic to Human Judgment}, journal={Organizational Behavior and Human Decision Processes}, volume={151}, pages={90--103}, year={2019}}
@article{DietvorstSimmonsMassey2015, author={Dietvorst, Berkeley J. and Simmons, Joseph P. and Massey, Cade}, title={Algorithm Aversion: People Erroneously Avoid Algorithms After Seeing Them Err}, journal={Journal of Experimental Psychology: General}, volume={144}, number={1}, pages={114--126}, year={2015}}
@article{KlingbeilGrutznerSchreck2024, author={Klingbeil, Artur and Gr\"utzner, Christina and Schreck, Philipp}, title={Trust and Reliance on AI: An Experimental Study on the Extent and Costs of Overreliance on AI}, journal={Computers in Human Behavior}, volume={160}, pages={108352}, year={2024}, doi={10.1016/j.chb.2024.108352}}
@article{GreinerEtAl2025, author={Greiner, Ben and Gr\"unwald, Philipp and Lindner, Thomas and Lintner, Georg and Wiernsperger, Martin}, title={Incentives, Framing, and Reliance on Algorithmic Advice: An Experimental Study}, journal={Management Science}, volume={72}, number={1}, year={2025}, doi={10.1287/mnsc.2022.02777}}
@article{HossainOkui2013, author={Hossain, Tanjim and Okui, Ryo}, title={The Binarized Scoring Rule}, journal={Review of Economic Studies}, volume={80}, number={3}, pages={984--1001}, year={2013}}
@article{DanzVesterlundWilson2022, author={Danz, David and Vesterlund, Lise and Wilson, Alistair J.}, title={Belief Elicitation and Behavioral Incentive Compatibility}, journal={American Economic Review}, volume={112}, number={9}, pages={2851--2883}, year={2022}}
@article{BaileyEtAl2022, author={Bailey, Phoebe E. and Leon, Tarren and Ebner, Natalie C. and Moustafa, Ahmed A. and Weidemann, Gabrielle}, title={A Meta-Analysis of the Weight of Advice in Decision-Making}, journal={Current Psychology}, volume={42}, number={28}, pages={24516--24541}, year={2022}}
@article{HaalandRothWohlfart2023, author={Haaland, Ingar and Roth, Christopher and Wohlfart, Johannes}, title={Designing Information Provision Experiments}, journal={Journal of Economic Literature}, volume={61}, number={1}, pages={3--40}, year={2023}}
@article{Ioannidis2023, author={Ioannidis, Konstantinos}, title={Anchoring on Valuations and Perceived Informativeness}, journal={Journal of Behavioral and Experimental Economics}, volume={106}, pages={102060}, year={2023}}
@article{ArielyLoewensteinPrelec2003, author={Ariely, Dan and Loewenstein, George and Prelec, Drazen}, title={Coherent Arbitrariness: Stable Demand Curves Without Stable Preferences}, journal={Quarterly Journal of Economics}, volume={118}, number={1}, pages={73--106}, year={2003}}
@article{FudenbergLevineManiadis2012, author={Fudenberg, Drew and Levine, David K. and Maniadis, Zacharias}, title={On the Robustness of Anchoring Effects in WTP and WTA Experiments}, journal={American Economic Journal: Microeconomics}, volume={4}, number={2}, pages={131--145}, year={2012}}
@article{ManiadisTufanoList2014, author={Maniadis, Zacharias and Tufano, Fabio and List, John A.}, title={One Swallow Doesn't Make a Summer: New Evidence on Anchoring Effects}, journal={American Economic Review}, volume={104}, number={1}, pages={277--290}, year={2014}}
@article{Sunstein2022, author={Sunstein, Cass R.}, title={Governing by Algorithm? No Noise and (Potentially) Less Bias}, journal={Duke Law Journal}, volume={71}, number={6}, pages={1175--1205}, year={2022}}
@inproceedings{NotiDonahueKleinbergOren2025, author={Noti, Gali and Donahue, Kate and Kleinberg, Jon and Oren, Sigal}, title={AI-Assisted Decision Making with Human Learning}, booktitle={Proc. 26th ACM Conf. on Economics and Computation (EC'25)}, year={2025}, note={arXiv:2502.13062}}
@article{AlonBarkatBusuioc2023, author={Alon-Barkat, Saar and Busuioc, Madalina}, title={Human--AI Interactions in Public Sector Decision Making: Automation Bias and Selective Adherence to Algorithmic Advice}, journal={Journal of Public Administration Research and Theory}, volume={33}, number={1}, pages={153--169}, year={2023}}
@article{Nguyen2024, author={Nguyen, Jforrest K.}, title={Human Bias in AI Models? Anchoring Effects and Mitigation Strategies in Large Language Models}, journal={Journal of Behavioral and Experimental Finance}, volume={43}, pages={100971}, year={2024}, note={J\&K 1995 attribution to reconfirm}}
```

---

> [!check]- Post-Flight Verification (CoVe) — inline
> 인용은 3개 에이전트가 직접 출처 fetch로 검증(③은 claim-verifier 전용). 10개 위험 인용 PASS 7 / 정정 2(Noti·Nguyen) / venue 정정 1(Sunstein). UNVERIFIED 잔존 3건 명시: Klingbeil(2024) known-truth 유무, You·Yang·Li(SSRN 4083722) 게재처, Jussupow et al.(2024 MISQ) 페이지 — 인용 전 사용자 확인 권고. 별도 claim-verifier 재호출 생략(인라인 검증으로 충족).
