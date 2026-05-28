# 세션 로그: 2026-05-28 — V6 격상 + V2 Archive

**상태:** COMPLETED

## 목표

사용자가 사전 작성한 v6 제안서를 본 세션의 v2 spec과 비교, 우월한 framing으로 확인 → v6를 메인 spec으로 격상, v2는 companion follow-up 노트로 archive.

## 결정 배경

사용자가 본 세션 중반(5/28)에 *별도로 사전 작성한* v6 제안서를 공유했음. v6는 "AI Information, Hypothetical Bias & WTP Measurement"를 중심 puzzle로 하는 5-arm × 2-phase 디자인이며, 본 세션의 v2 (Two-Study Cross-Calibration) 보다 *명료하고 발전된 형태*임.

비교 결과 v6가 다음 8개 차원에서 우월:

1. AI 행동경제 채널 통합 (Logg, Dietvorst, Bergman)
2. Outcome 변수 명료성 (Bias = WTP_CVM − WTP_auction)
3. Phase 1 역할 (중립화로 Algorithm Aversion 회피)
4. 5-arm with T0 baseline 통합
5. 통계 정교성 (SUR / Holm + FDR / Competing mediation)
6. 디자인 구체성 (제품, N=250, AnchorDev 직접 측정)
7. Filler task + Pre_Aversion + Anchor price 명시
8. 심사 비판 사전 대응 (12개 비판 + 대응 표)

## 사용자 의사 결정 (2026-05-28)

**Option C 채택**: v6를 메인 spec으로 격상, v2는 companion follow-up 노트로 archive.

## 산출물

| 파일 | 종류 | 변동 |
|---|---|---|
| `quality_reports/specs/research_spec_aiwtp_gap.md` | 메인 spec | **v2 → v6로 전면 교체** |
| `quality_reports/specs/research_spec_companion_v2_archived.md` | Archive | **신규** — v2 보존 |
| `quality_reports/decisions/2026-05-27_two-study-cross-calibration.md` (ADR-005) | 결정 기록 | **SUPERSEDED** 표시 추가 |
| `quality_reports/decisions/2026-05-28_v6-hypothetical-bias-framing.md` (ADR-010) | 결정 기록 | **신규** — pivot 결정 기록 |
| `quality_reports/session_logs/2026-05-28_v6-promotion.md` | 세션 로그 | 본 파일 |

## 유지된 ADR

- ADR-001 (between-subject) — v6에서도 동일
- ADR-002 (SPA single mechanism) — v6에서 Random nth-price로 미세 조정 (Shogren 2001 기반)
- ADR-003 (static AI text) — v6에서도 동일

## v6에 통합된 본 세션 v2 기여

본 세션의 v2 작업이 *완전 폐기*가 아닌 v6 spec에 통합:

1. ✅ **Fox 1998 CVM-X "21세기 AI 재해석" framing** — §Context 및 §6 기여 (기여 6) 추가
2. ✅ **K-R 진영 demoted 단락** (Kőszegi-Rabin 2006, Heffetz-List 2014, Campos-Mercade 2026 RES) — §2-1 및 §Proposal 구조 §2
3. ✅ **Choi 2018 ±15% effect size base rate** — §3-6 표본 규모 근거
4. ⏳ Jacquemet oath 사후 instrument 추가 검토 (Open Q8 — 옵션)
5. ⏳ Lee 2020 RSPM 단축형 추가 측정 검토 (Open Q7 — 옵션)

본 세션의 lit review 작업 (12+편 정독, CoVe 라운드 2회) 도 v6 인용 정당화의 기반으로 보존.

## V2 → V6 비교 한 줄

> *"v6는 *AI × Hypothetical Bias* 라는 명료한 중심 puzzle을, v2는 *Cross-Calibration* 이라는 정교하지만 추정 복잡한 방법론을 추구했다. v6가 publishability·디자인 sophistication·문헌 통합도 모두에서 우월하므로 메인 격상."*

## 학습 / 정정

- `[LEARN:design]` Fox 1998 CVM-X는 *근거 인용*이 아닌 *디자인 직접 후속*으로 활용 가능. 이게 v6의 핵심 sophistication.
- `[LEARN:design]` Algorithm Aversion (Dietvorst 2015) 은 AI 정보 실험 디자인의 *비명시적 confound*. v2 Study 1 (induced × AI 처치) 는 이 위험을 노출시켰음 → v6 Phase 1 중립화가 그 회피.
- `[LEARN:lit]` AI 행동경제 채널 (Logg 2019, Dietvorst 2015, Bergman 2010) 은 본 연구의 *직접 인용 필수* 3편. 본 세션의 lit review가 이를 *놓침* → 차후 lit review 시 AI-경제 행동학 키워드 의도적 검색 필요.
- `[LEARN:workflow]` 사용자의 *사전 작업* (v6) 이 *세션 중 작업* (v2) 보다 우월한 경우, 사전 작업을 채택하고 세션 작업의 *작은 기여*만 통합하는 게 정직한 평가.

## 검증

- v6 spec 모든 섹션 v6 원문 충실 보존 (구조·수식·표·인용 동일)
- 본 세션 추가 통합 (Fox AI 재해석, K-R demoted, Choi effect size) 은 *명시적으로* spec에 표시
- ADR-005 supersede 및 ADR-010 새 결정 기록 cross-reference 정합
- v2 archive 파일은 *원본 그대로* 보존 (Bash cp 사용)

## 열린 결정 / 블로커

- [ ] **Logg 2019 / Dietvorst 2015 / Bergman 2010 CoVe 검증** — 다음 세션 우선 (v6 Open Q9)
- [ ] AI 메시지 prototype 작성 — pilot 전 (Open Q1)
- [ ] T3/T4 AnchorDev 디테일 — ±20% 변이 디자인 (Open Q2)
- [ ] Filler task 콘텐츠 결정 (Open Q3)
- [ ] Pre-registration 시점 (Open Q4)
- [ ] IRB 신청 시점 (Open Q5)
- [ ] 저자명·소속 (Open Q6)
- [ ] Lee 2020 RSPM 추가 측정 여부 (Open Q7)
- [ ] Jacquemet oath 사후 instrument 여부 (Open Q8)
- [ ] **본 세션 산출물 (v6 spec + v2 archive + ADR-010 + 본 로그) git commit 여부** — 사용자 결정 필요

## 다음 세션 권장 (v6 메인 기준)

1. **신규 인용 3편 CoVe 검증** (Logg, Dietvorst, Bergman) → Bibliography_base.bib 통합
2. **AI 메시지 prototype 작성** — 5 arms 각각 (LLM 호출 + 정적 텍스트 고정)
3. **AnchorDev 변이 디자인 디테일** — T3/T4 ±20% 시장가 변이 설계
4. **Filler task 5분 콘텐츠 결정** — 인지 부하 없는 task 옵션
5. **프로포절 골격 (Beamer)** — v6 §1~§7을 슬라이드 구조로 매핑
6. **사전등록 초안** — OSF / AsPredicted 양식 (다중비교 위계 명시)
