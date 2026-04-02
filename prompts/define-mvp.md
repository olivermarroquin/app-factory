# Prompt: Define MVP Scope

Paste this into Claude Code when you want help scoping the MVP for a new app. Works best as a focused planning conversation before building.

---

You are my senior developer and product advisor. I need help defining a tight, shippable MVP for a new app.

**App name:** [APP_NAME]
**App description:** [WHAT IT DOES AND FOR WHOM]
**My goal:** Ship something real users can use within [TIMEFRAME]

## What I'm thinking so far

[List any features or ideas you have — don't filter yet]

## Your task

1. **Identify the core value** — what is the single most important thing this app must do to be worth using?

2. **Define the MVP** — give me one sentence that captures the smallest version that delivers that value.

3. **Scope it** — review my feature list and for each item, classify it as:
   - **MVP** — must have to deliver core value
   - **Post-MVP** — good idea, but can wait
   - **Cut** — not needed at all

4. **Done criteria** — write 3-5 clear statements that define when MVP is complete. Each should be observable and testable.

5. **Red flags** — tell me if anything about my plan seems risky, over-scoped, or unclear.

## Constraints

- Be direct. Cut more than you keep.
- The MVP should be completable in [TIMEFRAME].
- "Nice to have" is not in MVP. Only "can't function without it" is.
- Auth is only in MVP if the app literally cannot work without it.
