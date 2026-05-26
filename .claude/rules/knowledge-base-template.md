---
paths:
  - "Slides/**/*.tex"
---

# Project Knowledge Base: 03_AIWTPGap

> AI-assisted information provision and the WTP–WTA disparity.
> Dual lab-experiment design over induced-value and homegrown-value auctions.

Starter content — expand as the proposal develops. Claude reads this before creating or modifying any deck content, so notation drift gets caught early.

## Notation Registry

| Rule | Convention | Example | Anti-Pattern |
|------|-----------|---------|-------------|
| Random variables | Capital italic | $V_i$, $X_i$ | $v_i$ for a random valuation |
| Realised values | Lowercase italic | $v_i$, $x_i$ | $V_i$ when the realisation is meant |
| Bids | $b_i$ (buyer), $a_i$ (seller / WTA bid) | $b_i = \arg\max_b U_i(b)$ | $p_i$ — reserved for price |
| Random draw / market price (BDM) | $\tilde p$ | $\tilde p \sim U[0, \overline{p}]$ | $p^*$ |
| Treatment | $T \in \{0,1\}$ (control / AI-info) | $\mathbb{E}[Y \mid T=1] - \mathbb{E}[Y \mid T=0]$ | $D$ — reserved for design (induced vs homegrown) |
| Design indicator | $D \in \{\text{IV}, \text{HG}\}$ | sub-sample stratification | mixing $D$ and $T$ in one symbol |
| WTP / WTA | Outcomes are scalars in KRW; report units explicitly | $\mathrm{WTP}_i \in [0, \overline{p}]$ | unitless |

## Symbol Reference

| Symbol | Meaning | Introduced |
|--------|---------|------------|
| $V_i$ | Subject $i$'s value for the object (induced or homegrown) | (proposal §Notation) |
| $b_i$ / $a_i$ | BDM bid as buyer (WTP) / seller (WTA) | (BDM mechanism slide) |
| $\tilde p$ | Random price draw in BDM | (BDM mechanism slide) |
| $\mathrm{WTP}_i$, $\mathrm{WTA}_i$ | Elicited willingness-to-pay / accept | (outcome definition slide) |
| $\Delta_i = \mathrm{WTA}_i - \mathrm{WTP}_i$ | Subject-level WTP–WTA gap | (outcome definition slide) |
| $T_i \in \{0,1\}$ | AI-information treatment indicator | (design slide) |
| $D_i \in \{\text{IV}, \text{HG}\}$ | Induced-value vs homegrown-value design | (design slide) |
| $\tau$ | Treatment effect on $\Delta$ (ATE on the gap) | (estimand slide) |
| $\tau_{\text{IV}}$, $\tau_{\text{HG}}$ | Design-stratified treatment effects | (estimand slide) |

## Section Progression (planned — fill as proposal develops)

| # | Section | Core Question | Key Notation | Key Reference |
|---|---------|---------------|--------------|---------------|
| 1 | Motivation & RQ | Why does the WTP–WTA gap matter, and what role can AI-provided information play? | $\Delta$, $T$ | Kahneman–Knetsch–Thaler (1990); Horowitz & McConnell (2002) |
| 2 | Literature & gap | What we know about the gap; what AI-info has been tried | — | Tunçel & Hammitt (2014); Plott & Zeiler (2005, 2007) |
| 3 | Theoretical framework | Reference-dependent vs misconception accounts → testable predictions | $V_i$, $\Delta_i$ | Köszegi & Rabin (2006); Plott & Zeiler (2005) |
| 4 | Experimental design | Dual design: IV vs HG; BDM in IV, SPA in HG; AI-info treatment arm | $T$, $D$ | (own design) |
| 5 | Hypotheses & identification | Pre-registered $H_1, H_2, H_3$; how randomisation identifies $\tau$ | $\tau$, $\tau_D$ | (Pre-registration) |
| 6 | Power & implementation | Power calc, sample size, recruitment, lab logistics, ethics | $N$, MDE | (own calc) |
| 7 | Timeline & budget | Phased schedule, IRB, deliverables | — | — |

## Experimental Apparatus

| Mechanism | Where used | Why this mechanism |
|---|---|---|
| BDM (Becker–DeGroot–Marschak) | Induced-value arm | Theoretical incentive compatibility for any single subject; isolates measurement distortion |
| Second-Price Auction (SPA / Vickrey) | Homegrown-value arm | Easier-to-explain incentive compatibility for goods subjects own / could keep; mitigates BDM-specific confusion in the HG context |
| Induced-value chips | Reference instrument with known value | Removes preference construction; any gap is mechanism-driven |
| Homegrown good (e.g., mug, voucher) | Reference instrument with subject-specific value | Allows the endowment effect / preference construction to operate |

## Design Principles

| Principle | Rationale | Slides Applied |
|-----------|-----------|----------------|
| **Dual design separates two confounded mechanisms.** Induced-value arm isolates "measurement-side" distortions (BDM confusion, anchoring); homegrown-value arm exposes "preference-construction" effects (endowment, status-quo). The two arms together identify which channel AI information operates on. | Plott & Zeiler vs Kahneman–Knetsch–Thaler debate | Design + Hypothesis sections |
| **Within-subject AI-info treatment is avoided.** Information cannot be unread. Use between-subject random assignment to $T$. | Order effects, contamination | Design section |
| **LLM script + content is pre-registered.** Treatment fidelity requires the exact prompt + the canonical AI response logged before launch. | Avoids ex-post tuning | Pre-registration |

## Anti-Patterns (avoid)

| Anti-pattern | What goes wrong | Correction |
|---|---|---|
| Conflating $V$ (random) with $v$ (realisation) | Reader cannot tell whether claims are over the distribution or a draw | Capital = RV, lowercase = realised; declare in Notation slide |
| Treating WTP–WTA gap as a single mechanism | Cannot adjudicate between misconception (Plott–Zeiler) and endowment (KKT) | The dual IV / HG design is the answer; do not collapse them in figures |
| Pooling induced and homegrown estimates without an interaction | Loses the identification of mechanism-channel | Always report $\tau_{\text{IV}}$, $\tau_{\text{HG}}$, and the difference |
| Quoting "the WTA/WTP ratio is ~2" without context | Hides distribution and measurement; the ratio is sensitive to good type | Report mean, median, and distribution; cite Horowitz–McConnell meta-analysis (2002) bounds |

## Open Questions / Decisions Pending

- [ ] Exact AI prompt and the canonical informational content delivered to $T=1$ subjects.
- [ ] Homegrown good: mug, voucher, or coffee — which best balances familiarity and cost?
- [ ] Sample size: power calc once effect-size prior is set (target SMD on $\Delta$).
- [ ] Korean lab venue and recruitment population (undergrads / community sample).
- [ ] Pre-registration registry: OSF vs AsPredicted vs AEA RCT (likely OSF given non-policy lab study).
