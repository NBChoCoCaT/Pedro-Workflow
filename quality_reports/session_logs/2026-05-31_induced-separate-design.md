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

## 추가 작업 (동일 세션, 2026-05-31 오후)

### 선행연구 18편 전체 정독 + lit-review
- 폴더 18편 4클러스터 병렬 정독 → `lit_notes_18papers_2026-05-31.md`
- `/lit-review`(AI×valuation) + CoVe(claim-verifier) → `lit_review_ai_valuation_2026-05-31.md` (7/7 SUPPORTED)
- Qin 2025 / Spatharioti 2023 **전문 정독** → `lit_deepread_qin_spatharioti_2026-05-31.md`

### 정정 반영 완료
- **ADR-011 §5:** Lee 2020 "분산 3배" → 실제 수치(완전계시 29.4%/13.4%, revelation 106.7%/114.8%, F=2.42) + Qin 2025 capability–personalization 프레임 추가
- **spec §2-4·§4-1·§4-5·인용표:** "분산 3배"/"3×" 정정 + CRT→RSPM 도구불일치 명시
- ADR-011 Open Q "분산 3배" 항목 해결 처리, References에 신규 인용 추가

### 핵심 신규 발견
- `[LEARN:lit]` **Lee 2020 "입찰 분산 3배"는 본문 근거 없음** — 실제는 완전계시 29.4% vs 13.4%. 또 Lee 도구는 RSPM(spec의 CRT와 불일치).
- `[LEARN:lit]` **Qin et al. 2025(Psych Bulletin) capability–personalization:** Q I(역량高·개인화低)만 appreciation(+0.27), 나머지 aversion(−0.38~−0.69). → **Ch1(lottery=Q I)=appreciation vs Ch2(건강=Q II)=aversion 부호역전** 차별예측. 유인적합 연구 0편 = gap.
- `[LEARN:lit]` Spatharioti 2023(preprint): 정확→무해/오류→과의존(47% vs 93%), confidence 하이라이트로 완화(26→58%). A1/A2 + mitigation arm 선례. 단 비유인·비실화폐·인지능력無.
- `[LEARN:method]` Qin 프레임 검정하려면 두 차원(역량·개인화 필요성, 1–6)을 manipulation check로 측정. 교육수준↑→appreciation↓(lab 표본 경고).

## 추가 작업 2 (동일 세션, 2026-06-01 전후)

### spec v7 전체 정합화 + Obsidian 프로포절
- spec §1·§2(+§2-6)·§3·§4·§5·§6·§7 전부 2-chapter로 개정(커밋 6450677)
- **Obsidian 3단계 개조식 프로포절 작성** `proposal_obsidian_3tier_v7.md` (일반인→학부생→대학원생 중첩, Mermaid·표·콜아웃; 논문 구조로 재배치)

### Referee 검토 (methods + domain, 병렬 fork)
- 두 레퍼리 독립 검토 → **치명적 식별 문제 일치 지적**: *복권은 induced value가 아니다*(정답=EV가 아니라 CE, 위험선호 섞임)

### ⭐ 설계 전환 1 — lottery → 결정론적 산수 토큰 (ADR-011 Amendment 2026-06-01)
- 복권 → "칩 7×800 + 3×400 = 6,800원" 식 **결정론적 산수 토큰**
- 한 수로 동시 해결: EV≠CE 치명 / nth-price 유인적합성(Vickrey) / Lee positive control / 인지능력 교란 / 채널 A 완전 부재
- binary lottery procedure 기각(Selten 1999 실패·EU가정·인지능력 교란)
- 선례: **Spatharioti(2023)** "정답 있는 결정론적 계산 과제(cargo÷length ratio)" 본문 재정독
- 3개 파일(ADR·spec·proposal) 일괄 반영

### ⭐ 설계 전환 2 — Qin 프레임 **완전 제거** → value knowability
- Qin capability–personalization(4사분면·d값·부호역전 헤드라인·측정 2문항·인용) 3개 파일에서 삭제
- 통합 축 = **"진짜 가치를 알 수 있느냐"**(Ch1 knowable=왜곡 / Ch2 unknowable=도움 또는 왜곡)
- Logg·Dietvorst는 배경 인용으로만 유지; §6 인용 17→16편
- 검증: 세 파일 `Qin·사분면·부호역전` 0건

## 학습 / 정정 (추가)
- `[LEARN:design]` **복권 ≠ induced value** — 정답이 EV가 아니라 위험선호 의존 CE. 결정론적 산수 토큰이 정답.
- `[LEARN:design]` ~~Qin 부호역전~~ 폐기 — d값 양적 전이 무근거·self-judgment/교육 moderator가 Ch1 appreciation을 반대로 밂(referee). 통합은 *설계가 만드는* value knowability로.
- `[LEARN:method]` binary lottery procedure는 메커니즘 난해함이 *인지능력 조절변수와 교란* → 인지능력 연구엔 부적합.

## 미해결 (referee, 미반영)
- #1 출처 대비 arm(appreciation vs anchoring 식별) / #4 Ch2 순서 counterbalance / #5 채널 A 방향 부호
- A1 계산보조(help) ↔ "Ch1=순수 왜곡" 잠재 불일치(=MAJOR-3, 보류)

## 다음 세션 권장 (갱신)
1. **커밋** — ADR·spec·proposal(미커밋 상태)
2. 남은 referee 항목(#1/#4/#5) 반영 여부 결정
3. AI 전달 방식(static vs scripted-interactive) → ADR-003
4. 토큰 파라미터(산술 난이도·항 수) + 셀당 power(½–¼–¼·Canavari)
5. 신규 인용 BibTeX(Spatharioti·Bockstedt-Buckman·Smith/Kagel 등) → Bibliography_base.bib
