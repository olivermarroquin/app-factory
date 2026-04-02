# MVP Scope — {{APP_NAME}}

## MVP in one sentence

> {{MVP_SENTENCE}}

## Auth decision

<!-- Make this explicit. Auth scope creep kills MVPs. -->

- [ ] Auth is required — users must log in to use the core feature
- [ ] Auth is NOT required for MVP — core flow works without accounts

**Auth approach (if required):** {{AUTH_APPROACH}}
<!-- e.g. "Supabase Auth, magic link only" or "Google OAuth only, no password" -->

## Primary user flow (MVP)

<!-- The exact steps a user takes through the MVP. One path only.
     This becomes your build checklist — each step is a feature to ship. -->

1. {{FLOW_STEP_1}}
2. {{FLOW_STEP_2}}
3. {{FLOW_STEP_3}}
4. {{FLOW_STEP_4}}
5. {{FLOW_STEP_5}}

## In scope

| Feature | Why it's required |
|---------|-------------------|
| {{FEATURE_1}} | {{REASON_1}} |
| {{FEATURE_2}} | {{REASON_2}} |
| {{FEATURE_3}} | {{REASON_3}} |

## Out of scope

<!-- These are valid ideas that will not be built until MVP is validated. -->

| Feature | When it gets reconsidered |
|---------|--------------------------|
| {{CUT_FEATURE_1}} | After MVP ships |
| {{CUT_FEATURE_2}} | After {{TRIGGER_2}} |
| {{CUT_FEATURE_3}} | Maybe never |

## Done criteria

The MVP is complete when a real user can:

- [ ] {{OBSERVABLE_OUTCOME_1}}
- [ ] {{OBSERVABLE_OUTCOME_2}}
- [ ] {{OBSERVABLE_OUTCOME_3}}
- [ ] Complete the primary user flow without help from the developer

## What this MVP will validate

<!-- The one or two assumptions you most need to test. -->

- {{ASSUMPTION_1}}
- {{ASSUMPTION_2}}

## Target date

**Ship MVP by:** {{MVP_DATE}}
