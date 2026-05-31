# 세션 로그: 2026-05-31 — Induced-Value 분리 실험 설계

**상태:** COMPLETED (ADR-011 초안 작성 + 커밋)

## 목표

induced와 homegrown을 별개 실험으로 분리할지 검토하고, induced 팔의 lottery·AI·인지능력 설계를 ADR 초안으로 정리.

## 논의 흐름

1. **선행연구 본문 재확인** (PDF 직접 추출):
   - **PZ 2005**: within-subject지만 induced-value 토큰은 *무처치 훈련*, 분석 안 함. (앞선 웹검색 "lottery만 썼다"는 정정 — induced 토큰도 사용)
   - **Lee et al. 2020**: induced 단독 실험. 인지능력은 **RSPM**(CRT 아님). homegrown은 동기일 뿐 미측정.
   - **Corrigan et al. 2012**: induced 경매에서 *정보→Nash 이탈* — 본 연구 induced-AI 논리의 직접 선례.
   - **Fox 1998**: cross-sample 보정. **List 2001**: 경험자는 외부신호에 둔감.

2. **핵심 식별 통찰**: induced는 진짜 가치(EV)가 고정 → AI 효과가 베이지안일 수 없고 **채널 B(왜곡) 순수 측정**. 채널 분리의 지렛대.

3. **사용자 결정**: between-subject 분리 채택.

4. **induced 팔 구체화**:
   - lottery (계산 간극 → AI 보조 역할)
   - 3-arm: 통제 / AI-정확 / AI-편향(±20%)
   - 인지능력 RSPM 측정·층화 → AI(3)×능력(2) 6셀
   - 전달방식: static vs scripted-interactive (미결)

5. **위험선호 vs AI 분리** (사용자 질문):
   - 1차: between 무작위화가 평균에서 소거
   - 결정적: **A2 앵커 방향 ±20% 무작위화** → λ가 위험선호와 직교
   - 보조: Holt–Laury 별도 측정 (특히 A1 해석)

6. **인지능력 + 벤치마크**: 3겹(EV/CE · A0 내부 · Lee 2020 외부). 핵심 예측 = "AI는 저인지능력을 가장 돕고 가장 오도" 상호작용.

## 사용자 의사 결정 (2026-05-31)

| 결정 | 선택 |
|---|---|
| induced ↔ homegrown | **between-subject 분리** |
| induced 대상재 | lottery (다중·중저분산) |
| AI 처치 | 3-arm (통제/정확/편향±20%) |
| 인지능력 | RSPM 측정·층화 (treatment 아님) |
| 위험·AI 분리 | 앵커 방향 무작위화 + Holt–Laury |

## 산출물

| 파일 | 종류 |
|---|---|
| `quality_reports/decisions/2026-05-31_induced-value-separate-experiment.md` | ADR-011 (초안) |
| `quality_reports/session_logs/2026-05-31_induced-separate-design.md` | 본 로그 |

## 학습 / 정정

- `[LEARN:lit]` PZ 2005는 induced-value 토큰을 *썼다* (앞선 웹검색 기반 "lottery만" 진술 정정). 단 무처치 훈련 용도.
- `[LEARN:design]` 인지능력은 처치가 아니라 측정·층화 변수. AI-정확 arm이 사실상 "인지 보조 treatment" 역할.
- `[LEARN:method]` 앵커 방향 무작위화(±)가 위험선호와 AI 앵커를 직교시키는 핵심 장치 — 위험선호 측정의 전이성 가정에 의존하지 않음.
- `[LEARN:method]` Lee 2020 = RSPM, 본 연구 spec = CRT → 벤치마크 비교 위해 RSPM 측정 필요(Open Q7 실체).

## 열린 결정 / 블로커

- [ ] AI 전달 방식: static vs scripted-interactive (IRB/deception 고려)
- [ ] 인지부하 *조작* 추가 여부 (측정·층화 외)
- [ ] Lottery 파라미터 / 위험 instrument / 셀당 power
- [ ] Lee 2020 "분산 3배" 정확 수치 본문 재검증
- [ ] **spec §3·§4 재조정** — 현 spec은 still within-subject 2-phase 기술 → ADR-011과 정합화 필요

## 다음 세션 권장

1. AI 전달 방식 결정 → ADR-003 갱신 여부
2. spec §3(설계)·§4(분석) 개정 — induced 분리 실험 반영
3. Lee 2020 본문에서 능력별 분산비 정확 수치 추출 (벤치마크 확정)
4. 셀당 power 분석 (연속 vs 이분 인지능력)
