# Korean Language Convention (한국어 작업 언어 정책)

**This project is written in Korean.** This rule defines how Korean text and English technical terms coexist in the manuscript, the workflow artifacts, and the LaTeX source.

## Working Language

| Artifact | Language |
|---|---|
| Plans (`quality_reports/plans/*.md`) | 한국어 |
| Session logs (`quality_reports/session_logs/*.md`) | 한국어 |
| Specs (`quality_reports/specs/*.md`) | 한국어 |
| Proposal body (`Slides/*.tex`) | 한국어 (본문) |
| Pre-registration draft (`quality_reports/preregistrations/*.md`) | 한국어 + 영문 양식 키워드 (registry 형식 따름) |
| Decision records (`quality_reports/decisions/*.md`) | 한국어 |
| MEMORY.md `[LEARN]` entries | 영어 (템플릿 호환성 유지) — 단 `[LEARN:project]`는 한국어 허용 |
| `.claude/rules/*.md` | 영어 (Claude에게 전달되는 시스템 규칙은 영어로) |
| Source code comments | 한국어 또는 영어 (가독성 우선) |

## English Technical Terms (영문 유지 용어)

The following are kept in **English** even within Korean prose. They are the canonical terms in the experimental-economics literature and translating them creates ambiguity.

### Mechanisms

`WTP`, `WTA`, `BDM`, `Becker–DeGroot–Marschak`, `SPA` (또는 `second-price auction`), `Vickrey auction`, `first-price auction`, `English auction`, `Dutch auction`, `revealed-preference test`

### Value-elicitation framework

`induced value`, `homegrown value`, `incentive compatibility`, `dominant-strategy elicitation`

### Behavioural mechanisms

`endowment effect`, `status-quo bias`, `loss aversion`, `reference-dependent preference`, `prospect theory`, `reference point`, `Köszegi–Rabin`

### Statistical / experimental design

`ATE`, `ATT`, `MDE`, `power calculation`, `randomisation`, `between-subject`, `within-subject`, `pre-registration`, `IRB`

### AI / information

`LLM`, `prompt`, `treatment arm`, `information-provision experiment`

### Authors and citations

Author names inside `\cite{}` or parentheses stay in English: "Plott and Zeiler (2005)는 ...", "Kahneman, Knetsch, and Thaler (1990)에 따르면 ...".

## Korean Style Conventions

- **존댓말 vs 평어:** 본문은 평어체("~이다", "~한다"). 직접 인용·구두 발표 슬라이드 헤더는 자유롭게.
- **숫자/단위:** 아라비아 숫자 + 한글 단위 ("참가자 120명", "₩10,000"). 통화는 KRW 표기 또는 ₩ 기호.
- **외래어 표기:** 국립국어원 표기법 따름. 단, 본 규칙 §"English Technical Terms"에 명시된 용어는 영문 유지.
- **한·영 혼용 공백:** xeCJK가 자동 처리하므로 LaTeX 소스에서는 띄어쓰기로 충분 ("BDM 메커니즘은 ..."). 인위적인 `~`/`\,` 추가는 지양.
- **약어 첫 등장:** "지불의사가격(willingness to pay, WTP)"처럼 한 번 풀어 쓰고 이후 약어만 사용.

## Examples

### 본문 예시

```latex
\begin{frame}{WTP-WTA 갭의 두 가지 해석}
  \begin{itemize}
    \item \textbf{선호 구성 가설}: Kahneman, Knetsch, and Thaler (1990)의 endowment effect.
    \item \textbf{측정 오차 가설}: Plott and Zeiler (2005, 2007)의 misconception account.
  \end{itemize}
  두 가설은 induced-value 조건에서 서로 다른 예측을 한다.
\end{frame}
```

### 계획·로그 예시

```markdown
## 다음 단계
- [ ] BDM 매커니즘 설명 슬라이드 1매 작성 — incentive compatibility 증명 포함
- [ ] LLM-info treatment의 정확한 prompt 결정
```

## What NOT to translate

- Mathematical operator names (`\arg\max`, `\mathbb{E}`, etc.) — LaTeX standard.
- Package or command names (`xeCJK`, `\setCJKmainfont`) — code.
- Function or variable names in any code block.

## What to translate

- Slide headers, section titles, body prose, table captions, figure captions.
- All user-facing report text (session logs, plans, decision records).

## Cross-references

- `.claude/rules/content-invariants.md` — INV-1 enforces this convention at review time.
- `Preambles/header.tex` — xeCJK + KoPub Dotum configuration that makes the rendering work.
