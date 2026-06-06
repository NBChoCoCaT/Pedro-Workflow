# ADR-013: 모수·검정력 프레임워크 (A′, 파일럿 전)

**Date:** 2026-06-06
**Status:** Proposed (파일럿 후 수치 확정 → PAP 봉인)
**관련:** ADR-012, `specs/2026-06-06_Aprime_redesign.md`, `preregistrations/2026-06-06_PAP_Aprime_draft.md`

---

## Context

A′ 설계는 PAP 봉인 전 (i) 신호/AI 노이즈 캘리브레이션, (ii) 출처 arm 구조, (iii) 검정력 기반 표본을 확정해야 한다. 현 단계는 *프레임워크*만 고정하고 수치는 파일럿에 위임.

## Decision — 모수 프레임

| 모수 | 결정/방향 | 근거 |
|---|---|---|
| 사전분포 | 평균 50, SD 20 (포인트 스케일) | v2 출발값 유지 |
| 신호 노이즈 | 사전과 *동등 가중* 수준에서 출발, 파일럿 보정 | belief 업데이트 식별력 확보 |
| AI 노이즈(정확도) | 고지 90% / 60% | β(k) 기울기 식별 (2점) |
| **출처(S)** | **between-subject** (AI / 인간 / 익명) | 오류 목격→aversion carryover 차단(Dietvorst 2015) |
| **belief 측정** | **pre(b0)/post(b1) 2단계** | WOA 정의상 필수(Bailey 2022) |
| **지각 신뢰도** | 별도 유도 *포함 권장* | β(k) 베이지안 벤치마크 정밀화(고지≠지각) |
| BSR | center-bias 통제(neutral framing·인센티브 정보 최소화) | Danz et al. 2022 |
| 앵커(B) | 가치-관련(AI값) + 무관(임의) 2종 | Corrigan(강) vs Fudenberg(약) |
| 가격분포 | BDM U[0,100] | v2 유지 |
| 라운드 | 20–30 within | v2 유지 |
| 식품 m | **객관 속성**(영양·품질지표) — *시장가 금지* | 선호≠시장가 |

## Decision — 검정력 접근

- **확정적 검정 = 사전등록 가설(H1·H_S·H3)만**, 검정력은 **파일럿 후 사전분석**으로 표본 결정.
- 추정량별 prior:

| 추정량 | 효과크기 prior | 함의 |
|---|---|---|
| **β(k) 기울기** | WOA≈0.39 메타(Bailey 2022) 주변, 정확도 2점 차 | 개인 within → 상대적 고효율 |
| **H_S 출처 프리미엄** | You-Yang-Li(2022): AI>인간 appreciation 존재 | between → 셀당 N 충분히 |
| **μ(앵커)** | **약효과 전제** — Fudenberg(무관 0), 가치-관련은 Corrigan 상향 | *보수적* 표본(최대 N 결정자) |
| **격차(H4)** | homegrown, 정성 floor | 헤드라인 아님 → 표본 부담 작음 |

→ **표본 크기 결정자 = μ(가장 약효과) 또는 H_S(between).** 둘 중 큰 쪽으로.

## Consequences

- 출처 between + 2단계 belief + 지각신뢰도 → 세션·문항 부담↑. 라운드 수·arm 수 trade-off 파일럿서 점검.
- μ 약효과 전제 = 보수적(큰) 표본 → 비용. 가치-관련 앵커(Corrigan)로 효과 상향 기대가 완충.

## Follow-up

- [ ] 파일럿(N 소): 신호/AI 노이즈, b0·b1 분산, μ·β(k)·H_S 예비 효과크기
- [ ] 사전분석 → 표본 확정 → PAP 봉인
- [ ] 출처 between vs 부분 within 최종(carryover 검증)
- [ ] 지각 신뢰도 유도 문항 확정
