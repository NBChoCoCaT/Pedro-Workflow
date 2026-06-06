# ADR-012: A′ 전환 — 의존(reliance) 척추 · 신호기반 코어 · 출처 arm

**Date:** 2026-06-06
**Status:** Accepted
**Supersedes (부분):** ADR-011 (산수 토큰·AI 3-arm 부분), spec v7 (`research_spec_aiwtp_gap.md` value-knowability·결정론 토큰 프레임)
**관련 산출물:** `specs/2026-06-06_Aprime_redesign.md` (재설계 본문), `lit_review_aiwtp_reliance_2026-06-06.md` (증거)
**입력 문서:** `260606_AIWTPGap_프로포절_종합_v2.md` (Obsidian, 코스 폴더)

---

## Context (어떻게 여기까지 왔나)

1. **v6/v7** — induced(결정론 토큰)/homegrown 2-chapter, 통합축 **value knowability**, 헤드라인 = "AI가 가치를 돕나/왜곡하나 + 인지능력(RSPM) 조절".
2. **ADR-011** — induced/homegrown을 between-subject 분리; lottery→**결정론적 산수 토큰**(referee: 복권은 induced value 아님).
3. **methods+domain referee 교차검증** — 산수 토큰은 메커니즘은 valid하나 *"채널 A 부재/순수 왜곡only"* 주장이 거짓: 계산 불확실성이 정보채널을 재도입 → "A1이 돕는다 ⊥ 채널 A 부재" 모순(MAJOR-3).
4. **탑저널 재검토** — 계산형 induced value는 직접 선례 없음(extension); Li(2017) baseline 전략노이즈; 임의앵커는 IC서 약화(Fudenberg/Maniadis) → 출처·벤치마크 정비 필요.
5. **"공통가치 아님" 확정** — 단일 행위자 BDM = 사적가치. RQ1(불확실성↓→수렴)은 *신호기반* private value(또는 credence homegrown)에서만 검정 가능.
6. **v2 종합 프로포절** — 신호기반 코어(V·신호·BDM·BSR), 의존 β(k)·앵커 μ·격차, 사회적학습 과소의존 vs AI 과의존 모순.
7. **v2 검토 + lit-review(3 에이전트)** — 헤드라인(의존 모순)은 *진짜 open*(4조건 동시충족 연구 없음); 단 **출처(AI vs 인간) arm 필수**, WOA용 **2단계 belief**, **BSR center-bias**(Danz 2022), 앵커는 **종류 의존**(Corrigan=관련=강 vs Fudenberg=무관=약).
8. **Corrigan 반영** — induced-value 앵커링/왜곡의 직접 선례 → 왜곡 채널이 *약효과 강등 대상 아님*. 정체성 A/B 재판단 → **A′** 확정.

## Decision

**정체성 = A′ (의존 척추 + 왜곡 공동기여 + 식품 응용).**

- **헤드라인:** known-truth·IC 환경에서 **AI vs 인간 출처 × 정확도**의 의존 보정 β(k) → 사회적학습 과소의존 vs AI 과의존 모순 정면 판정.
- **공동 메커니즘:** AI 숫자의 *믿음 경로 밖* 직접 왜곡 μ (Corrigan 2012 선례 + BSR 매개분해 = 신규성).
- **응용:** 식품 homegrown WTP–WTA 격차 이동 (코스·AIWTPGap 정체성).
- **설계 골자(5종):** ① 출처 arm(AI/인간/익명) ② 2단계 belief(b0/b1) ③ BSR center-bias 통제 ④ μ=매개분석 ⑤ 앵커 종류분리(관련/무관). 상세 = 재설계 스펙.

## Supersede / Retain 관계

| 항목 | 처리 |
|---|---|
| ADR-011 induced/homegrown **between 분리** | **유지** (A′ 두 군) |
| ADR-011 **결정론적 산수 토큰** | **SUPERSEDED** → 신호기반 숨은 V (private value, 계산 confound 제거) |
| ADR-011 **AI 3-arm(A0/A1/A2)** | **확장·교체** → S(출처)×A(정확도) + B(앵커종류) |
| ADR-011 **인지능력(RSPM) 핵심 조절** | **강등** → 선택적 moderator (헤드라인 아님) |
| spec v7 **value-knowability 프레임** | **SUPERSEDED** → reliance/distortion·known-truth 프레임 |
| spec v7 **homegrown 식품 챕터** | **유지** → A′ 응용 군 |
| BDM·no-feedback·Plott-Zeiler 절차·IC 초점 | **유지** |

## Consequences

**긍정:**
- 헤드라인이 *진짜 미해결*(lit-review 확인)인 의존 판정 → publishability↑.
- 왜곡 채널이 Corrigan으로 단단 → AIWTPGap 심장 보존.
- 식별 깨끗(induced 헤드라인), 약한 다리(H4)는 응용으로 강등.

**비용/위험:**
- 출처 arm·2단계 belief로 설계 복잡도·표본↑.
- BSR center-bias·μ 매개식별·β(k) 베이지안 벤치마크(지각 신뢰도)가 정밀설계 요구.
- 식품 격차가 "응용"으로 밀려 코스 임팩트 약화 가능 → 응용 서술 강화로 보완.

## Follow-up (후속 결정)

1. **문서 일원화:** v2 프로포절(Obsidian) = 서사 master; `research_spec_aiwtp_gap.md`를 **v8(A′)** 로 개정(또는 v7 archive + 포인터); 본 ADR = 결정기록.
2. 신호·AI 노이즈 캘리브레이션, 출처 arm between/within, 지각 신뢰도 유도, 식품 객관속성 m 선택 → 별도 모수 ADR.
3. 검정력: μ(약효과 전제), β(k) 출처차·기울기 (Bailey WOA=0.39 prior).
4. 인용 정정·신규(별도 (d)): Noti·Nguyen·Sunstein venue + Danz·Bailey·Greiner·Möbius·Ioannidis·Weizsäcker·Corrigan 복원.
5. 사전등록(PAP) 초안 — 다중비교 위계 + BSR center-bias·μ 매개 사전명시.

## Open / 미확인 (인용 전 확인)

- Klingbeil(2024) known-truth 유무, You·Yang·Li(SSRN 4083722) 게재처, Jussupow(2024 MISQ) 페이지.
