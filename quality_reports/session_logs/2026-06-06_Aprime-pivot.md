# 세션 로그: 2026-06-06 — A′ 전환 (의존 척추) + lit-review

**상태:** COMPLETED (a→b→c + lit-review)

## 목표
v2 종합 프로포절 전체 검토 → 정체성 확정(A/B) → 재설계 → 신규 ADR. /lit-review 병렬.

## 흐름
1. **induced value 기초 재정립** — 정의·precept·변형(common value, binary lottery 실패)·한계. Roth-Malouf·Berg et al.은 induced *preference*(실패한 변형)이지 valuation 아님 확인.
2. **선행연구 induced-value 결과만 정리** — 제도/인지·오류/처치왜곡 3유형. 당신 연구 = 유형③(처치→계시), Corrigan·Jacquemet·Cherry 선례.
3. **공통가치 아님 확정** — 사적가치. RQ1은 신호기반 또는 credence에서만.
4. **v1/v2 기본틀 검토** — 신호기반 코어(BDM+BSR), 의존 β(k) 헤드라인.
5. **lit-review 3 에이전트(병렬)** → `lit_review_aiwtp_reliance_2026-06-06.md`:
   - 의존 모순(과소 Weizsäcker vs 과의존 Logg/Klingbeil/Greiner) **진짜 open**, **출처 arm 필수**.
   - WOA = pre/post 2단계 필수(Bailey); BSR center-bias(Danz 2022).
   - 앵커 = 종류의존(Corrigan 관련=강 / Fudenberg 무관=약).
   - gap 좁히면 생존; 인용 정정(Noti·Nguyen·Sunstein venue).
6. **A/B 판단** — Corrigan으로 왜곡 채널 부활 → **A′ 확정**(의존 척추 + 왜곡 공동기여 + 식품 응용).

## 산출물
- `lit_review_aiwtp_reliance_2026-06-06.md`
- `specs/2026-06-06_Aprime_redesign.md`
- `decisions/2026-06-06_Aprime-reliance-spine.md` (ADR-012)

## 학습/정정
- `[LEARN:design]` 앵커링 = *앵커 종류* 의존. 임의·무관 숫자는 IC서 약화(Fudenberg/Maniadis), value-관련 숫자(게시가·AI추정)는 왜곡 견고(Corrigan 2012·Ioannidis 2023). AI 추정값은 후자 → 약효과 강등 오류.
- `[LEARN:method]` WOA=(b1−b0)/(a−b0) → pre/post belief 2단계 필수. between만으론 개인 WOA 미식별.
- `[LEARN:method]` BSR은 이론상 IC지만 행동상 center-bias(Danz-Vesterlund-Wilson 2022 AER) → neutral framing·인센티브 정보 최소화.
- `[LEARN:design]` 출처(AI vs 인간, 내용 고정) arm 없이는 "과소 vs 과의존" 판정이 식별 아닌 주장.
- `[LEARN:lit]` Roth-Malouf(1979)·Berg et al.(1986)은 induced *preference*(binary lottery, 실패한 변형)이지 induced value valuation 실험 아님.

## 다음 (미완)
- [ ] (d) 인용 정정·신규 BibTeX 통합 → `Bibliography_base.bib`
- [ ] `research_spec_aiwtp_gap.md` v8(A′) 개정 or archive
- [ ] v2 프로포절 본문에 5종 수정 반영
- [ ] 모수·검정력 ADR, PAP 초안
