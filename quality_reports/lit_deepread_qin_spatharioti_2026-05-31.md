# 전문 정독 노트 — Qin et al. (2025) & Spatharioti et al. (2023)

**Date:** 2026-05-31
**맥락:** lit-review에서 발굴한 두 핵심 신규 논문 전문 정독. ADR-011 두-챕터 설계의 이론 엔진(Qin)과 가장 가까운 실증 동형(Spatharioti).

---

## 1. Qin, Zhou, Chen, Wu, Zhou, Dong, Cao & Lu (2025) — *Psychological Bulletin* 151(5):580–599

> 전문 확보(저자 공개 PDF, jacksonlu.net). DOI 10.1037/bul0000477. 제1저자 Xin Qin, Lu senior. (단 Supplement/OSF per-domain 표는 미확보.)

### Capability–Personalization 프레임 (2×2)
두 차원(각 1–6 코딩):
- **(a) AI 인식 역량** (인간 대비): "이 맥락에서 AI는 인간보다 얼마나 유능한가"
- **(b) 개인화 필요성**: "이 맥락에서 개인화가 필요한가"

**예측:** appreciation은 **역량 高 + 개인화 不필요(Quadrant I)에서만**. 나머지 3사분면은 aversion(AI가 객관적으로 우수해도). 개인화 필요성은 **당사자 관점 의존**(같은 맥락도 누구 관점이냐에 따라 사분면 이동).

### 메타분석 규모·효과크기 (확정)
- **442 effect sizes / 163 studies / N=82,078** ✓, 93 decision contexts, 13 coders (r_wg .86–.89).
- 전체 pooled **d=−0.26** [−0.37,−0.15].

| 사분면 | 역량/개인화 | d | 95% CI | k_es |
|---|---|---|---|---|
| **I** | 高 / **低** | **+0.27** | [0.17,0.37] | 106 |
| II | 高 / 高 | **−0.43** | [−0.54,−0.32] | 27 |
| III | 低 / 高 | −0.38 | [−0.53,−0.23] | 184 |
| IV | 低 / 低 | −0.69 | [−0.98,−0.39] | 97 |

- **Q I만 유일한 양(+) 셀.** 이질성 매우 큼(I²≈91–98%) → 중심경향, 보장 아님.
- **유의 moderator(주의):** appreciation은 *교육수준·인터넷이용 높을수록 약화* → **교육수준 높은 실험 표본에서 appreciation이 작게 나올 수 있음**(본 lab 표본 경고).
- robot(유형) > algorithm, between > within에서 appreciation ↑.

### Logg vs Dietvorst 화해
- Logg 2019(수치추정/예측=역량高·개인화低=**Q I**) → appreciation은 예측된 결과.
- Dietvorst 2015 → Q I 밖. 또 "오류 목격" 아닌 *맥락(2차원)*이 driver(Bigman-Gray, Longoni는 오류 없이도 aversion).
- 결론: 기존 문헌은 모순이 아니라 *under-conditioned*.

### 유인적합·실화폐·경제 valuation — **전무 (전문 검색 확인)**
"incentive/monetary/lottery/expected value/financial" = 0 hits. → 순수 stated-preference/advice-uptake 메타분석. **유인적합 valuation은 깨끗한 gap.**

### 프로젝트 직결
- **Ch1(lottery EV = 비개인화·역량高 = Q I) → appreciation d≈+0.27** vs **Ch2(건강식품 개인화 = Q II) → aversion d≈−0.43** → **부호 역전 예측**(프레임이 거의 by construction으로 차별 예측 제공).
- **프레임 자체를 검정하려면** 두 차원을 manipulation check/mediator로 측정:
  1. 인식 역량(1–6) — Ch1·Ch2 모두 "유능" 확인(→ Ch2 aversion이 개인화 때문임을 식별)
  2. 개인화 필요성(1–6) — Ch1 低 / Ch2 高 (**load-bearing 조작**)
  3. (건강은 self-relevant → 개인화 *관점* 측정 고려)
- **기여 포지셔닝:** (i) 0 incentive-compatible → BDM/SPA로 패턴이 *유인·실화폐 하에서도 유지되나* 검정; (ii) 프레임은 *방향*만 예측, WTP/WTA 대칭성·endowment 상호작용은 미답 → 본 설계 고유.
- **인용 주의:** 사분면 효과는 고이질적(중심경향); 교육-attenuation; Ch2 예측은 피험자가 *개인화 필요를 실제로 인식*해야 성립 → 검증 필수.

---

## 2. Spatharioti, Rothschild, Goldstein & Hofman (2023) — arXiv:2307.03744 (Microsoft Research)

> ⚠️ **preprint(미게재).** dblp = journals/corr. 인용 시 working paper 표기.

### 설계
- **공통 과제:** SUV 2대 중 택1, *객관적 정답 존재*(적재공간/길이 비율). MTurk, **flat fee(성과보상 없음 = 비유인적합)**, 검색 10회·1000자 제한.
- **Exp1 N=90** (between): 전통검색(Bing) vs LLM검색(GPT-3.5, 비대화형 단발). 5과제, **task5는 의도적 난제**(2020 4Runner, LLM이 적재공간 혼동).
- **Exp2 N=120** (between): 전원 LLM, **confidence 색상 하이라이트** 변이만(GPT-3 token prob ≤50% 빨강).

### 결과
- **정상 과제(LLM 정확):** 정확도 동등 — 전통 92.3% vs LLM 95.3%(n.s.).
- **난제(LLM 오류) = 과의존:** 전통 93% vs **LLM 47%**(z=−3.46, p<.001). 60%가 단일 쿼리; **이상값 봐도 재쿼리 안 함.**
- **인식 신뢰도 null:** 오도된 LLM 사용자도 신뢰도 낮게 평가 안 함(t=0.11, p=.91) → *틀린 줄 모름*.
- 효율: LLM 1.6분 vs 전통 3.4분(~50%↓); 쿼리 적지만 복잡; 만족 4.41 vs 3.10.
- **Exp2 하이라이트 완화:** 난제 정확도 control 26% → high+low **58%**, low-only **53%**(둘 다 2배↑). 기제 = follow-up 검증쿼리 유발(5→15). 신뢰도·만족 비용 미미, 시간만 약간↑. **단 token prob는 정답과 불완전 상관(한계).**

### 프로젝트 직결
- **가장 가까운 실증 동형:** 정확→무해(95.3 vs 92.3), 오류→과의존(47 vs 93). = 본 A1/A2 arm 핵심 메커니즘.
- **의도적 rigged 오류 = ±20% 편향 arm의 직접 선례**(알려진 크기·일방향 planted error vs ground truth).
- **인식 신뢰도 null** → 편향 AI가 *신뢰 저하 없이* 입찰 이동시킬 수 있음 → manipulation check 설계 prior.
- **하이라이트 완화 = 후보 mitigation arm:** "편향 AI + 불확실성 플래그" vs "플래그 없음". 단 **실험자 통제 신호**로(모델 token prob는 불완전).
- **핵심 차이(인용 주의):** ① 유인적합 elicitation 없음(이진 정답, bid 아님); ② **실화폐 없음(flat fee)** → 과의존이 *저항 유인 없는* 환경 → 실화폐 경매선 과대일 수도; ③ **인지능력 조절 없음**; ④ 검색(재쿼리) vs 단발 AI 메시지 → 완화 채널(검증)이 단발 설계엔 부재; ⑤ *검증가능 사실* vs *valuation*; ⑥ GPT-3/3.5·SUV·MTurk(외적타당성).
- **포지셔닝:** "정확→도움/오류→과의존"과 "confidence 완화"의 최선 선례로 인용하되, 본 설계가 이를 **유인적합·실화폐·인지능력 조절** 경매로 이식하는 것이 기여.

---

## 액션 아이템 (반영 후보)
1. **Ch1/Ch2 차별 가설을 Qin 사분면(Q I vs Q II)으로 정식화** → spec §2(이론)·§5(기여)에 추가.
2. **두 차원(역량·개인화 필요성) 1–6 측정**을 양 챕터 manipulation check/mediator로 설계.
3. **교육-attenuation 경고** → 표본 인구통계 통제·해석 주의.
4. **Spatharioti rigged-error**를 A2(±20%) 설계 근거로, **confidence 하이라이트**를 선택적 mitigation arm 후보로 ADR-011 Open Q에 추가.
5. Spatharioti는 **preprint** 표기. Qin은 BibTeX 이미 통합 준비됨(`QinEtAl2025_aiaversion`).
