# ADR-010: V2 (Two-Study Cross-Calibration) → V6 (Hypothetical Bias Framing) Pivot

**Status:** ACCEPTED
**Date:** 2026-05-28
**Context:** 사용자 v6 제안서를 본 세션의 v2 spec과 비교한 결과, v6의 *hypothetical bias framing*이 거의 모든 차원에서 우월함이 확인되어 메인 spec으로 격상.
**Supersedes:** ADR-005 (Two-Study Unified Proposal + Cross-Calibration Framing)
**Promotes:** 사용자 사전 작성 v6 → `research_spec_aiwtp_gap.md` 메인 spec
**Archives:** v2 spec → `research_spec_companion_v2_archived.md` (후속 companion study로 보존)

## Problem

본 세션(5월 26~27일)은 *내부 작업*으로 다음 발전 경로를 거쳤다:

- v1 (5/26): WTP-WTA 갭 + K-R 5-channel framing
- v2 (5/27): Two-Study (induced + homegrown) + Cross-Calibration framing (ADR-005)

그러나 사용자가 *별도로 사전 작성한* v6 제안서를 5/28에 공유했고, 비교 결과 v6가 다음 8개 차원에서 우월함이 확인됨:

1. **AI 행동경제 채널 통합**: v6에 Logg 2019 (Algorithm Appreciation), Dietvorst 2015 (Algorithm Aversion), Bergman 2010 (CRT × anchoring 반박) 포함 — v2는 *세 편 모두 누락*.
2. **Outcome 변수 명료성**: v6의 Bias = WTP_CVM − WTP_auction은 *단일 숫자, Fox CVM-X 직접 후속*. v2의 θ_info decomposition은 추정 복잡 + identifying assumption 강함.
3. **Phase 1의 더 나은 역할**: v6 Phase 1 = 중립화·숙련도 균형 (Plott-Zeiler 등가 절차). v2 Study 1 = AI 처치 → *Algorithm Aversion contamination* 위험 (Dietvorst 2015).
4. **5-arm with T0 baseline**: v6의 통합 5-arm이 식별 비교가 더 명확. v2는 4 + 2 arms로 분산.
5. **통계 정교성**: v6는 SUR 병렬 / Holm + FDR 위계 / Competing mediation / pre-registration protocol. v2는 decomposition + delta method만.
6. **디자인 구체성**: v6는 제품 (기능성 건강식품 credence good) + N=250 + AnchorDev 직접 측정. v2는 다수 TBD.
7. **Filler task + Pre_Aversion + Anchor price 명시**: v6에 모두 포함. v2 누락.
8. **심사 비판 사전 대응**: v6 §7에 12개 비판 + 대응 표. v2 누락.

## Options considered

### Option A: v2 그대로 유지, v6 거부

**Pro:** 본 세션 작업의 일관성 보존.
**Con:** 위 8개 차원에서 v2가 *명백히 열등*. 본 proposal의 학술 강도가 v2 유지 시 약화.

### Option B: v2 + v6 통합 (하이브리드)

v2의 cross-calibration logic + v6의 hypothetical bias outcome 결합.

**Pro:** 두 framing의 장점 결합.
**Con:** 통합 시 디자인이 *비대*해짐. v6의 *명료성*과 v2의 *식별 깊이*가 충돌. 결정적: 같은 피험자에게 induced AI 처치 + homegrown AI 처치 동시 적용 시 *Algorithm Aversion contamination* 위험 → v6의 핵심 sophistication 훼손.

### Option C: v6를 메인으로 격상, v2를 companion follow-up으로 archive (본 결정)

v6 = 본 proposal의 단일 기준. v2 = 별도 후속 paper (Lee 2020 직접 후속, induced value × AI source) 노트로 archive.

**Pro:**
- v6의 8개 우월 차원 모두 보존
- v2의 cross-calibration 라인은 *후속 companion study*로 자연스럽게 보존 (논문 분리 시 Paper 2 candidate)
- v6 spec에 Fox CVM-X "AI 재해석" framing, K-R demoted 단락, Choi 2018 effect size 등 본 세션 v2 작업의 *작은 기여*가 통합됨
- 단일 통합 proposal로 *논리적 일관성* 강함

**Con:**
- 본 세션의 v2 작업 일부 (cross-calibration framing, two-study decomposition) 은 *후속 연구로 분리*되며 본 proposal에서 직접 활용 안 됨
- v2의 자세한 lit review 작업 일부는 v6에서 demoted citation으로만 등장

## Decision

**Chose:** Option C — v6 격상, v2 archive.

**Rationale:**

1. v6의 *모든 측면 우월성* — 8개 차원에서 객관적으로 더 발전된 형태.
2. v6의 *Algorithm Aversion contamination 회피*가 본 연구 디자인의 *결정적 sophistication* — v2가 놓친 부분.
3. Fox 1998 CVM-X 라인의 *직접* 후속이라는 v6의 학술적 positioning은 K-R 논쟁 우회 + 정책 함의 강화에 최적.
4. v2 작업이 *완전 폐기*가 아닌 *companion study*로 archive되어 후속 paper 가능성 보존.
5. 본 세션의 작은 기여 (Fox CVM-X "AI 재해석", K-R demoted, Choi effect size) 는 v6에 *통합* 가능.

## Consequences

### 즉시 변경된 산출물

- **메인 spec 격상**: `quality_reports/specs/research_spec_aiwtp_gap.md` ← v6 content (사용자 사전 작성)
- **Archive 생성**: `quality_reports/specs/research_spec_companion_v2_archived.md` ← v2 보존
- **ADR-005 SUPERSEDED**: header에 명시
- **ADR-010** (본 문서): pivot 결정 기록
- **세션 로그**: 2026-05-28 추가

### v6 spec에 통합된 v2 세션 기여

1. ✅ Fox 1998 CVM-X "21세기 AI 재해석" framing — §Context, §6 기여에 명시
2. ✅ K-R 진영 demoted 단락 — §2-1 및 §Proposal 구조 §2에 명시
3. ✅ Choi 2018 ±15% effect size base rate — §3-6 표본 규모 근거에 명시
4. ⏳ Jacquemet oath 사후 instrument 추가 검토 — Open Q8
5. ⏳ Lee 2020 RSPM 단축형 추가 측정 검토 — Open Q7

### 후속 결정 사항

- **Logg 2019, Dietvorst 2015, Bergman 2010** — CoVe 검증되지 않은 신규 인용 3편 → 다음 세션 task
- **Companion study (v2)** — Lee 2020 직접 후속의 별도 paper로 확장 가능. 본 proposal 이후 follow-up 단계.
- **v6 spec의 Open Questions** — 메시지 prototype, anchor variation 설계, filler task 콘텐츠, 사전등록 시점, IRB, Lee 2020 RSPM/Jacquemet oath 추가 여부

### 알려진 위험

- v2의 cross-calibration 논리가 v6에서 직접 활용되지 않음 → *후속 paper*로 분리되므로 사용자가 *이를 후속 연구로 진행하지 않으면* v2 작업이 매몰비용이 됨. → 본 ADR과 archive 파일이 *기록 보존* 역할.
- v6의 신규 인용 3편이 CoVe 미검증 상태 → 다음 세션에서 우선 처리.
- v6의 Algorithm Aversion framing이 한국 lab 셋팅에서 Logg 2019 (US) / Dietvorst 2015 (US)의 결과와 *재현*되지 않을 위험 → §Limitations에 cultural specificity 고려 검토.

## Rejected alternatives — why not

- **A (v2 유지)**: v6의 8개 차원 우월성이 명백 → 학술 강도 손실 받아들일 수 없음.
- **B (v2 + v6 통합)**: Algorithm Aversion contamination 위험 부활. v6의 핵심 sophistication 훼손.

## References

- **메인 spec**: `quality_reports/specs/research_spec_aiwtp_gap.md` (v6)
- **Archive**: `quality_reports/specs/research_spec_companion_v2_archived.md` (v2)
- **Superseded ADR**: `quality_reports/decisions/2026-05-27_two-study-cross-calibration.md` (ADR-005)
- **유지 ADR**: ADR-001 (between-subject), ADR-002 (SPA — Random nth-price로 v6 미세 조정), ADR-003 (static AI text)
- **Lit reviews**: `lit_review_aiwtp_gap.md`, `lit_review_kr_post2014.md` (참고 자료로 보존)
- **신규 인용 (CoVe 미검증)**: Logg et al. (2019, OBHDP), Dietvorst et al. (2015, JEP:General), Bergman et al. (2010, Econ Letters)
