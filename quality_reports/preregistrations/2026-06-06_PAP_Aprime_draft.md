# Pre-Analysis Plan (PAP) 초안 — AIWTPGap A′

**Date:** 2026-06-06 · **Status:** DRAFT (파일럿 전 봉인 예정)
**근거:** `specs/2026-06-06_Aprime_redesign.md` · ADR-012 · `lit_review_aiwtp_reliance_2026-06-06.md`
**양식:** 내부 초안 (OSF/AsPredicted 이식 전). 본 초안은 *확정적 가설·통제·다중비교 위계*를 사전명시하는 데 목적.

---

## 1. 설계 요약

- 개인 BDM(무작위 가격) 가치유도 + BSR 사후믿음. 단일 행위자 = **사적가치(common value 아님)**.
- 코어(라운드): 역할(구매/판매) → 참값 V 추첨(숨김) → 신호 s → **[1단계] b0·v0** → 조언(숫자 a + 신뢰도 k + 출처 라벨) → **[2단계] b1·v1** → N라운드·무작위 1회 지급·no-feedback.
- 두 군: **induced(토큰, 정답 V 보유)** [헤드라인] / **homegrown 식품(정답 없음)** [응용].
- 처치: **S 출처**(AI/인간/익명, between) × **A 정확도**(고지 90%/60%, within) + **B 앵커종류**(가치관련/무관) ; C 정보량(탐색).

## 2. 가설 (확정적)

| ID | 가설 | 추정량 | 군 |
|---|---|---|---|
| **H1** | AI 가중(WOA)이 고지 정확도 k에 *증가*; 베이지안 기울기 대비 이탈(과소/과의존) | 의존–정확도 기울기 β(k) | induced |
| **H_S** | 동일 숫자·신뢰도에서 **AI 라벨 의존 > 인간 라벨 의존**(appreciation/과의존) | 출처 프리미엄 = WOA(AI) − WOA(인간) | induced |
| **H3** | 가치-관련 AI 숫자가 value를 *믿음 경로 밖*으로 끎(앵커) | μ = advice→value 직접경로(매개분석) | induced |
| **H2** | 정확 AI는 정답 대비 오차↓(탈편향), 부정확 AI는 오차↑(왜곡) | bias, RMSE | induced |
| **H4**(보조) | 동일 처치가 식품 WTP/WTA·격차를 이동; induced 채널과 정합 | 격차 이동 + 다리 사영(정성) | homegrown |

**방향 예측:** H1 기울기>0(보정)·평평(과의존)·낮음(과소); H_S>0; H3 μ>0(가치관련, Corrigan), 무관-앵커 μ≈0(Fudenberg); H2 정확<0/부정확>0.

## 3. 분석 모델 (말로) + 사전명시 통제

- **H1/H_S(믿음채널):** WOA_i = (b1−b0)/(a−b0). 출처×정확도 회귀로 β(k)·출처 프리미엄. **베이지안 벤치마크** = 고지 k(+지각 신뢰도 유도분)로 계산. 군집 SE(피험자).
- **H3(μ, 매개):** value의 advice 효과를 **믿음매개 경로 + 직접 경로로 분해**(causal mediation; 단순 통제 금지 — 믿음은 매개변수). 무관-앵커 arm = 순수앵커 벤치마크.
- **H2:** |bid−V|, (bid−V) 회귀; 정확/부정확 처치 대조.
- **사전명시 통제(편향 차단):**
  1. **BSR center-bias**(Danz et al. 2022): neutral framing, 인센티브 정보 최소화, b0·b1 동일 프로토콜(분자에서 부분상쇄 가정 사전기록).
  2. **2단계 belief 필수**(Bailey 2022): WOA는 b0·b1 둘 다로만 식별.
  3. **출처 arm = between**: AI 오류 목격→aversion carryover 차단(Dietvorst 2015).
  4. **무기만(no-deception)**: 실제 노이즈 추정기 + 신뢰도 진실 고지.
  5. **순서·헤징**: 믿음↔가치 순서 무작위화, 과제 독립 지급.

## 4. 다중비교 위계

```
1단계 Confirmatory (Holm):  H1 β(k) · H_S 출처 프리미엄 · H3 μ
2단계 Secondary (FDR):      H2 bias/RMSE · H3 무관-앵커 벤치마크 · 지각신뢰도 보정
3단계 Exploratory (무보정): H4 식품 격차·다리 사영 · C 정보량(혼란) · 인지능력 moderator
```

## 5. 검정력 (사전분석 항목)

- **β(k):** 사전 prior WOA≈0.39(Bailey 2022 메타) → 기울기·출처차 MDE. 파일럿서 b0·b1 분산 확정.
- **μ:** **약효과 전제**(Fudenberg 2012: 무관앵커 0; 가치관련은 Corrigan 효과로 상향) → 보수적 표본.
- **H_S:** 출처 between → 셀당 N 충분히. 파일럿 후 사전 검정력 분석으로 표본 확정.

## 6. 표본·제외

- 이해도 퀴즈 게이트 통과자만 분석(Plott-Zeiler). 주의점검 실패·BDM 게임폼 오인(comprehension) 사전 제외 규칙 명시.
- 라운드 20–30, 무작위 1회 지급.

## 7. 봉인 전 확정 필요 (열린 항목)

- [ ] 신호·AI 노이즈 캘리브레이션(사전과 동등 가중?)
- [ ] 지각 신뢰도 유도 포함 여부(β(k) 벤치마크 정밀화)
- [ ] 출처 arm between 확정 vs 부분 within(carryover 검증)
- [ ] 식품 재화 + **객관 속성 벤치마크 m**(시장가 금지) 선택
- [ ] BSR center-bias 잔차의 WOA 편향 방향(파일럿 검증)
- [ ] C(정보량) 채널 최종 위치(homegrown·탐색)

## 8. 미확인 인용 (PAP 인용 전 확인)

- Klingbeil(2024) known-truth 유무 · You·Yang·Li(SSRN 4083722) 게재처 · Jussupow(2024 MISQ) 페이지.
