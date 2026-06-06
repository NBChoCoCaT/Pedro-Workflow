# Checkpoint — 2026-06-01: 토큰 전환 + value knowability (Qin 제거)

**상태 스냅샷 (다음 세션/핸드오프용).** 직전 세션로그: `session_logs/2026-05-31_induced-separate-design.md`.

---

## 1. 현재 연구 설계 (spec v7.2)

**제목:** AI Information & WTP Measurement — 2-chapter, between-subject 분리.

| | Chapter 1 | Chapter 2 |
|---|---|---|
| 대상 | **결정론적 산수 토큰** (예: 칩 7×800+3×400=6,800원) | 기능성 건강식품 (credence good) |
| 진짜 가치 | knowable (계산 정답, 결정론) | unknowable (아무도 모름) |
| 처치 | A0 없음 / A1 정확값 / A2 ±20%(방향 무작위) | T0 + 정보원(Gen/AI)×정보량 = 5-arm |
| 주 측정 | Deviation = \|Bid − TrueValue\| | Bias = WTP_CVM − WTP_auction |
| AI가 할 수 있는 것 | 왜곡(채널 B) — *가치 발견 불가* | 정보 제공(A) **또는** 왜곡(B) |
| 직접 선행 | Lee et al. 2020 (AJAE) | Fox et al. 1998 (CVM-X) |

- **통합 축 = value knowability** (가치를 알 수 있느냐). ~~Qin capability–personalization 부호역전은 폐기.~~
- 메커니즘: random nth-price(Shogren), no-feedback(Corrigan), WTP프레임·값≥0(Lee&Fox), 결정론적 토큰이라 Vickrey IC 성립(BDM/non-EU 쟁점 소멸).
- 조절: 인지능력 **RSPM**(Lee 정합; CRT 아님). between, RSPM 층 내 무작위 → 6셀.
- 식별 핵심: A2 ±20% 방향 무작위 = 앵커링 대칭성 통제(토큰이라 위험선호 교란 자체 없음).
- 통합: Ch1이 왜곡 채널을 분리 → Ch2 해석을 *정성적 floor*로 보정(cross-calibration).

## 2. 결정 기록 (ADR-011 + Amendments)
- **ADR-011**: induced/homegrown을 between-subject 2-chapter로 분리.
- **Amendment 2026-06-01 (a)**: lottery → **결정론적 산수 토큰** (referee: 복권은 induced value 아님, EV≠CE).
- **Amendment 2026-06-01 (b) = v7.2**: **Qin 프레임 완전 제거** → value knowability. Logg/Dietvorst 배경 인용 유지.

## 3. 핵심 파일
- `specs/research_spec_aiwtp_gap.md` — 메인 spec v7.2 (full)
- `decisions/2026-05-31_induced-value-separate-experiment.md` — ADR-011 (+amendments)
- `proposal_obsidian_3tier_v7.md` — 옵시디언 3단계 개조식 프로포절
- `lit_notes_18papers_2026-05-31.md` / `lit_review_ai_valuation_2026-05-31.md` / `lit_deepread_qin_spatharioti_2026-05-31.md` — 문헌 정독·리뷰(기록, Qin 포함 보존)
- 선행연구 PDF 20편 + Qin·Spatharioti 전문 `master_supporting_docs/supporting_papers/`

## 4. 잃으면 안 되는 사실 (검증됨)
- **Lee 2020(AJAE):** 완전계시 입찰 고인지 **29.4% vs 저인지 13.4%**, revelation 106.7%/114.8% (※ "분산 3배"는 본문 근거 없음 — 정정함). 도구 RSPM.
- **Spatharioti 2023(arXiv:2307.03744, preprint):** 정상 95% vs 92%, 오류 **47% vs 93%**(과의존); confidence 하이라이트 26%→58%. "정답 있는 결정론적 계산 과제."
- **토큰 설계 인용 앵커:** Smith induced value(1962 JPE / 1976·1982 AER), 경매 적용 Kagel·Harstad·Levin(1987 Econometrica). (BibTeX 미통합)
- **Dietvorst 2015 venue 정정:** JEP:General 144(1):114–126 (JPSP 아님).

## 5. 미해결 (referee, 미반영)
- **#1 출처 대비 arm** — "AI 숫자로 끌림"이 앵커링인지 appreciation인지 식별(AI-라벨 vs 무작위/사람 숫자, 같은 값) + demand effect 통제. *가장 효과 큼.*
- **#4 Ch2 순서효과** — CVM→경매 고정 → β_auction>β_CVM 일부 기계적. counterbalance 또는 T0 netting.
- **#5 채널 A 방향** — "AI→경매 WTP↑→갭↓"의 valence 가정 → 수렴/분산으로 재정의.
- **잠재 불일치(MAJOR-3, 보류):** A1 계산보조(help) ↔ "Ch1=순수 왜곡(채널 B)" — 토큰 전환으로 EV≠CE는 풀었으나 이건 별개.
- 사소: Spatharioti "동형"→"시사적", IPV 앵커 jitter, 검정력 ½–¼–¼ vs 상호작용.

## 6. 다음 작업 계획 (우선순위)
1. **(결정)** 남은 referee #1/#4/#5 반영 여부 — 특히 **#1 출처 대비 arm**(설계 추가) 채택할지.
2. **AI 전달 방식** 확정 (static vs scripted-interactive) → ADR-003 갱신.
3. **토큰 파라미터** 확정 (산술 난이도·항 수·값 범위·라운드 수 → 인지부하 calibrate).
4. **셀당 power 분석** (Canavari 2019 Eq.1 + 3-arm ½–¼–¼; 인지능력·앵커 연속변수).
5. **BibTeX 통합** → `Bibliography_base.bib` (Spatharioti, Bockstedt-Buckman, Smith, Kagel-Harstad-Levin 등).
6. **Beamer 슬라이드** `Slides/Proposal_AIWTPGap.tex`를 v7.2(토큰·value knowability)로 갱신.
7. (선택) MEMORY.md `[LEARN]` 정리 — 복권≠induced value, Qin 폐기, BLP 인지능력 교란.

## 7. 재개 첫 메시지(권장)
"체크포인트 `2026-06-01_token-value-knowability.md` 읽음. 설계 = 2-chapter(Ch1 결정론 토큰 / Ch2 건강식품), 통합 = value knowability, Qin 제거됨. 다음: §6 계획 중 [선택]."
