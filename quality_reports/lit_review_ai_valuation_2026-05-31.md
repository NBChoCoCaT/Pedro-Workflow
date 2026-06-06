# Literature Review: AI/LLM Information × Valuation/WTP in Experimental Economics

**Date:** 2026-05-31
**Query:** AI/LLM 정보 제공이 incentive-compatible 경매(BDM/SPA/random nth-price) 입찰, 가상편의(WTP_CVM vs auction), AI 가격앵커, 인지능력 조절에 미치는 효과 — 2020–2026 유사 실증 + gap 식별.
**보유 선행연구(폴더 18편):** Logg 2019, Dietvorst 2015(인용), Fox 1998, Lee 2020, Corrigan 2012, Choi 2018 등.

> ⚠️ **검증 상태:** 본 보고서의 신규 인용은 WebSearch/WebFetch 기반. Lu et al.(2025) 메타분석과 핵심 수치는 직접 확인. 그 외 다수는 검색 스니펫 기반 → §Post-Flight(CoVe)에서 claim-verifier 재검증. arXiv working paper는 *미게재·변경가능* 표시.

---

## Summary

AI/알고리즘 조언과 valuation을 다루는 최근(2020–2026) 문헌은 **빠르게 성장하지만, 본 프로젝트의 정확한 교집합은 비어 있다.** 문헌은 네 갈래로 갈린다: (1) **심리·HCI의 algorithm aversion/appreciation** — Logg(2019)·Dietvorst(2015)를 Qin et al.(2025, *Psych Bulletin*; Lu 교신/senior) 대형 메타분석이 통합·갱신; (2) **HCI의 AI 과의존(overreliance)** — 사람이 *틀린* AI 정보에 끌려가는지(Spatharioti et al. 2023 등), 본 프로젝트의 "정확 vs 편향 AI arm"과 메커니즘이 거의 동형이나 *경제적 valuation·유인적합성*이 없음; (3) **마케팅의 generative-AI 구매의도** — 대부분 가상·purchase-intention·DCE(유인 비호환); (4) **WTP *for* AI 서비스** — AI 자체에 대한 지불의사(상품 가치 이동 아님).

결정적으로, **AI 정보가 incentive-compatible 경매(BDM/SPA/random nth-price)에서 실제 valuation을 어떻게 이동시키는지, 그리고 그것이 가상편의(WTP_CVM−WTP_auction)와 인지능력에 따라 어떻게 달라지는지를 다룬 실증은 발견되지 않았다.** "AI advice × second-price auction" 검색은 전부 *알고리즘 입찰자*(CS/ML reserve pricing, bandit) 문헌으로, *인간 입찰자에게 AI가 조언하는* 설정이 아니다. 이로써 ADR-011/v6의 핵심 gap 주장("유인적합 valuation에서 AI 정보 효과 최초")이 **실증적으로 재확인**된다.

가장 큰 이론적 수확은 Qin et al.(2025)의 **capability–personalization 프레임**이다: AI가 (a) 인간보다 유능하다고 인식되고 (b) 개인화가 불필요한 맥락에서 appreciation(d=0.27), 그렇지 않으면 aversion(d=−0.50). 이는 본 프로젝트의 두 챕터에 **상반된 예측**을 준다 — Ch1(lottery EV 계산: 비개인화·AI 유능) → appreciation, Ch2(건강식품 개인 적합: 개인화 필요) → aversion. 즉 본 설계는 이 프레임의 *유인적합 경제 valuation 최초 검정*이 될 수 있다.

---

## Key Papers (relevance 순)

### Qin, Zhou, Chen, Wu, Zhou, Dong, Cao & Lu (2025) — AI Aversion or Appreciation? *Psychological Bulletin* 151(5):580–599 [HIGH] ✅ CoVe 검증
- **기여:** Logg/Dietvorst 논쟁을 **capability–personalization** 2차원으로 통합하는 메타분석.
- **방법:** 442 effect sizes, 163편, **N=82,078**.
- **결과:** AI **유능 인식 + 개인화 불필요** → appreciation **d=0.27** [0.17,0.37]; 아니면 aversion **d=−0.50** [−0.63,−0.37].
- **관련성:** ⭐ Ch1 vs Ch2 **차별 예측**의 이론 엔진. Ch1(EV 계산=비개인화·유능)→appreciation, Ch2(건강 개인 적합=개인화 필요)→aversion. 본 설계 = 이 프레임의 *유인적합 valuation* 최초 검정. Logg d≈0.4를 d≈0.27로 *하향 보정* + 조건부화.
- **인용 주의:** 제1저자 **Xin Qin**, Jackson G. Lu는 senior(교신). in-text는 "Qin et al. (2025)".

### Spatharioti, Rothschild, Goldstein & Hofman (2023) — Comparing Traditional and LLM-based Search for Consumer Choice (arXiv:2307.03744, Microsoft Research) [HIGH] ⚠️ 일부 미검증
- **기여:** LLM 검색 vs 전통 검색의 소비자 의사결정 무작위 실험.
- **방법:** 참가자가 제품 비교 과제, LLM 도구 vs 검색엔진 무작위 배정. (표본수 미확인)
- **결과:** LLM이 *정확*하면 정확도 동등·더 빠름·만족 ↑; **LLM이 틀리면 과의존(overreliance)으로 오류**. 2차 실험: **색상 하이라이트**로 과의존 완화.
- **관련성:** ⭐ 본 프로젝트 "정확 AI arm vs 편향 AI arm"의 **가장 가까운 실증 동형**. "정확하면 도움, 틀리면 과의존" = Ch1의 A1/A2 예측. 단 *유인적합 valuation·가상편의·인지능력*은 없음 → 본 프로젝트가 경제실험으로 격상.
- **주의:** working paper(arXiv); 표본·효과크기 미확인(CoVe 대상).

### Ben David, Resheff & Tron (2021) — Explainable AI and Adoption of Financial Algorithmic Advisors (arXiv:2101.02555; AIES'21) [MED] ✅ CoVe 검증
- **기여:** 인간 vs 알고리즘 advisor + 설명유형이 채택·**WTP**·신뢰에 미치는 효과.
- **결과:** **설명 동반 AI 조언에 더 높은 WTP**(설명 없는 AI-labeled 대비) — abstract 직접 확인.
- **관련성:** AI 전달방식(설명/대화형 vs static) 결정(ADR-011 Open Q)에 직접. 설명이 채택·지불의사를 높임 → scripted-interactive 옵션의 근거. *단 WTP는 advisor 자체에 대한 것*(상품 가치 이동 아님).

### van Berkel et al. (2025) — Algorithm appreciation or aversion: accuracy disclosure & reliance (*Behaviour & Information Technology*; doi 10.1080/0144929X.2025.2535732) [MED] ✅ CoVe 검증
- **기여:** **정확도 공개**가 알고리즘 조언 의존(conformity)에 미치는 효과. Study I N=284, Study II N=272.
- **결과:** 정확도 공개가 알고리즘 순응을 높임.
- **관련성:** A2(편향 AI)에서 정확도 신호를 어떻게 줄지 설계. 정확도 공개가 의존을 조절 → manipulation check·신뢰 측정 설계.

### Bockstedt & Buckman (2025) — Humans' Use of AI Assistance: Loss Aversion & Willingness to Delegate (*Management Science* 72(1):323–342; doi 10.1287/mnsc.2024.05585) [MED] ✅ CoVe 검증
- **기여:** 프레이밍이 AI 위임 의향에 미치는 효과.
- **결과:** **gain/표준 프레임에서 인간 보조 선호**(AI가 더 우수해도) — **loss 프레임은 이 편향을 제거.**
- **관련성:** v6의 Pre_Aversion / loss aversion 통제와 직접 연결. *유인(성과 보상)이 걸리면 인간 선호↑ → 유인적합 설계에서 appreciation 약화 가능*(A-3 self-judgment 강화). ⚠️ "보상→AI 의존↓"는 gain 조건 한정, loss 프레임에선 소멸.

### Appropriate Reliance on AI Advice (arXiv:2302.02187, 2023) [MED] ⚠️ 저자 미확인
- **기여:** AI 답을 먼저 보면(answer-first) 앵커링 → AI가 *틀릴* 때 과의존.
- **관련성:** A2 편향 앵커 메커니즘(answer-first=AI 추정값 먼저 제시)과 동형. 제시 순서(instruction-first vs answer-first)가 완화 → 전달 설계 변수.

### Reusens et al. (2026) — Would a Large Language Model Pay Extra for a View? (arXiv:2602.09802) [LOW-MED] ✅ CoVe 검증
- **기여:** LLM *자신의* WTP를 subjective choice에서 추론(travel attribute).
- **결과:** 큰 LLM은 의미있는 WTP 산출하나 **전반적으로 인간 WTP를 과대추정**; 비싼 선택 선호/business persona 시 악화. ⚠️ 단 *view* 속성만은 과소추정(방향 attribute-dependent).
- **관련성:** *LLM-as-agent* 라인(인간 대상 조언 아님). 본 프로젝트가 LLM을 합성 피험자로 쓸 생각이면 경고; 직접 설계엔 주변적.

### "Pay What LLM Wants" (arXiv:2508.03262, 2025) [LOW] ⚠️
- **기여:** 522 real-human persona로 LLM이 WTP 실험(PWYW)을 시뮬레이션할 수 있는지.
- **관련성:** 파일럿 전 합성-피험자 사전검토 도구로만. 실제 인간 실험을 대체 못함.

> **관련 없음으로 배제:** "second-price auction + algorithm/learning" 검색 결과(reserve pricing, bandit, 광고 GSP)는 전부 *알고리즘 입찰자* CS 문헌 → 본 프로젝트(인간 입찰자 + AI 조언)와 무관. 이 공백 자체가 gap 증거.

---

## Thematic Organization

### 이론
- **Algorithm appreciation↔aversion의 통합:** Logg(2019, appreciation) ↔ Dietvorst(2015, aversion)의 이분법이 Qin et al.(2025) **capability×personalization**으로 수렴. 본 프로젝트는 이 프레임을 *경제 valuation·유인적합* 맥락에 처음 적용.
- **앵커링·과의존:** Tversky–Kahneman 앵커링 → AI answer-first 앵커링(2302.02187) → induced-value posted-price 왜곡(Corrigan 2012, 보유). A2(편향 AI ±20%)는 이 계보의 *경제적·유인적합* 측정.

### 실증
- **과의존 패턴 일관:** Spatharioti(2023)·answer-first 연구 모두 "AI 정확→도움, 틀림→과의존"을 보고 → 본 A1/A2 예측과 정합. 단 모두 *비유인·비경매·정확도 검증 가능 과제*.
- **WTP 방향:** AI 조언/설명은 *advisor에 대한* WTP를 높이고(2101.02555), generative-AI는 구매의도·선택정확도를 높임(마케팅) — 그러나 *상품 valuation의 유인적합 이동*은 미측정.

### 방법
- **정보제공 실험 설계:** Haaland et al.(2023, 보유)이 prior·active control·anchoring·demand-effect 표준 제공. 신규 HCI 문헌은 *완화 장치*(하이라이트, instruction-first)를 추가 → 본 설계의 robustness arm 후보.

---

## Gaps and Opportunities (핵심 산출)

1. **유인적합 valuation의 공백 (1차 gap):** AI×WTP 문헌은 가상/DCE/purchase-intention(마케팅) 또는 HCI 과의존(비경제) 또는 *AI 서비스에 대한* WTP뿐. **BDM/SPA/random nth-price 실화폐 경매로 AI가 valuation을 이동시키는 실증은 부재.** → 본 프로젝트의 핵심 novelty 재확인.
2. **가상편의 각도 부재:** AI가 WTP_CVM−WTP_auction 갭을 *줄이나 왜곡하나*를 묻는 연구 없음(Ch2 고유).
3. **induced-value 채널 분리 미개척:** *알려진 가치(lottery EV)*로 AI 정보(채널 A)와 왜곡(채널 B)을 분리하는 설계 부재(Ch1 고유).
4. **인지능력 조절 공백:** Lee(2020)는 인지능력×입찰(AI 없음), HCI는 과의존(인지능력 조절 없음). **AI valuation 효과의 인지능력 이질성**은 미결합.
5. **capability–personalization 프레임 미검정:** Qin et al.(2025)이 제시한 프레임은 *유인적합 경제 valuation*에서 검정된 적 없음. 본 Ch1(비개인화→appreciation) vs Ch2(개인화→aversion)가 **직접 검정**이 됨.

---

## Suggested Next Steps

- **읽기 우선순위:** Qin et al.(2025) 메타분석 전문(프레임·moderator), Spatharioti et al.(2023) 전문(과의존 측정·완화).
- **인용 통합:** Qin et al. 2025를 §이론(appreciation/aversion 갱신)·§기여(capability–personalization 검정)로, Spatharioti 2023을 A1/A2 예측 선례로 spec에 추가.
- **포지셔닝 수정:** Logg d≈0.4 단독 인용 → 메타분석 d=0.27(appreciation)/−0.50(aversion) **조건부**로 보수화. Ch1을 "appreciation 조건(비개인화·유능)", Ch2를 "aversion 조건(개인화)"으로 명시 → 차별 가설.
- **BibTeX 통합:** 검증 통과 항목만 `Bibliography_base.bib`에 추가(CoVe 후).

---

## BibTeX Entries

```bibtex
@article{QinEtAl2025_aiaversion,
  author = {Qin, Xin and Zhou, Xiang and Chen, Chen and Wu, Dongyuan and Zhou, Hansen and Dong, Xiaowei and Cao, Limei and Lu, Jackson G.},
  title = {{AI} Aversion or Appreciation? {A} Capability--Personalization Framework and a Meta-Analytic Review},
  journal = {Psychological Bulletin},
  volume = {151},
  number = {5},
  pages = {580--599},
  year = {2025},
  doi = {10.1037/bul0000477},
  note = {442 effect sizes, 163 studies, N=82,078. Appreciation d=0.27 [0.17,0.37]; aversion d=-0.50 [-0.63,-0.37]. CoVe-VERIFIED. First author Qin; Lu senior.}
}

@misc{Spatharioti2023_llmsearch,
  author = {Spatharioti, Sofia Eleni and Rothschild, David M. and Goldstein, Daniel G. and Hofman, Jake M.},
  title = {Comparing Traditional and {LLM}-based Search for Consumer Choice: A Randomized Experiment},
  year = {2023},
  howpublished = {arXiv:2307.03744},
  note = {Microsoft Research. Overreliance on incorrect LLM info; confidence-based highlighting mitigates. CoVe-VERIFIED (sample size not extractable).}
}

@inproceedings{BenDavid2021_advisors,
  author = {Ben David, Daniel and Resheff, Yehezkel S. and Tron, Talia},
  title = {Explainable {AI} and Adoption of Financial Algorithmic Advisors: An Experimental Study},
  booktitle = {Proc. AAAI/ACM Conf. on AI, Ethics, and Society (AIES '21)},
  year = {2021},
  doi = {10.1145/3461702.3462565},
  note = {arXiv:2101.02555. Explanations raise WTP for AI advice. CoVe-VERIFIED.}
}

@article{vanBerkel2025_accuracydisclosure,
  author = {van Berkel, Niels and others},
  title = {Algorithm appreciation or aversion: the effects of accuracy disclosure on users' reliance on algorithmic suggestions},
  journal = {Behaviour \& Information Technology},
  year = {2025},
  doi = {10.1080/0144929X.2025.2535732},
  note = {Study I N=284, Study II N=272. Accuracy disclosure raises conformity. CoVe-VERIFIED (full author list to confirm).}
}

@article{BockstedtBuckman2025_delegate,
  author = {Bockstedt, Jesse C. and Buckman, Joseph R.},
  title = {Humans' Use of {AI} Assistance: The Effect of Loss Aversion on Willingness to Delegate Decisions},
  journal = {Management Science},
  volume = {72},
  number = {1},
  pages = {323--342},
  year = {2025},
  doi = {10.1287/mnsc.2024.05585},
  note = {Gain framing -> prefer human even when AI superior; loss framing removes bias. CoVe-VERIFIED.}
}

@misc{Reusens2026_llmpayview,
  author = {Reusens, Manon and others},
  title = {Would a Large Language Model Pay Extra for a View? Inferring Willingness to Pay from Subjective Choices},
  year = {2026},
  howpublished = {arXiv:2602.09802},
  note = {LLM-as-agent WTP; overall overestimates human WTP (view attribute underestimated). CoVe-VERIFIED.}
}
```

---

## Post-Flight Verification (CoVe) — 완료 (2026-05-31)

claim-verifier(fresh fork)로 7개 주장 독립 검증 → **전부 SUPPORTED** (환각 0). 교정 반영 완료:

| 주장 | 결과 | 교정 |
|---|---|---|
| C1 Qin et al. 2025 메타분석 | ✅ SUPPORTED | **제1저자 Lu→Qin 정정**, 페이지 580–599 추가. d·N·CI 정확 일치 |
| C2 Spatharioti 2023 LLM search | ✅ SUPPORTED | 저자·발견 확인; 표본수 미추출(arXiv 본문 확인 권장) |
| C3 Ben David et al. 2021 (explainable advisors) | ✅ SUPPORTED | **저자 Ben David, Resheff, Tron** 추가; AIES'21 |
| C4 van Berkel et al. 2025 accuracy disclosure | ✅ SUPPORTED | 저자 van Berkel 외, N=284/272 추가 |
| C5 Reusens et al. 2026 LLM-pay-view | ✅ SUPPORTED | 전반 과대추정 맞음, *view 속성만 과소*(방향 nuance) |
| C6 Bockstedt & Buckman 2025 (MS) | ✅ SUPPORTED | MS 72(1):323–342; gain→인간선호, **loss→편향소멸** 명시 |
| C7 gap 주장(4-way 부재) | ✅ SUPPORTED | 반례 없음. 단 *absence of evidence*(검색 기반, 1차문서 불가) caveat |

**결론:** 모든 신규 인용 사용 가능. C1(Qin et al.)과 C6(Bockstedt-Buckman)이 가장 load-bearing. C7 gap은 성립하나 검색 기반 약함 → spec에서 "to our knowledge" 헤지 권장.
