# Architecture — {{APP_NAME}}

## Stack

| Layer | Choice | Why |
|-------|--------|-----|
| Frontend | {{FRONTEND}} | {{REASON}} |
| Backend | {{BACKEND}} | {{REASON}} |
| Database | {{DATABASE}} | {{REASON}} |
| Auth | {{AUTH}} | {{REASON}} |
| Email | {{EMAIL_SERVICE}} | {{REASON}} |
| Hosting | {{HOSTING}} | {{REASON}} |

## Folder structure

```
{{APP_NAME}}/
├── app/                  # Next.js App Router — routes and layouts
│   ├── (auth)/           # Auth routes (login, signup, callback)
│   ├── (app)/            # Protected app routes
│   └── api/              # API routes (webhooks, etc.)
├── components/
│   ├── ui/               # Reusable primitives (buttons, inputs, etc.)
│   └── {{FEATURE}}/      # Feature-specific components
├── lib/
│   ├── {{DB_CLIENT}}/    # Database client and query helpers
│   └── utils/            # Shared pure utilities
├── docs/                 # Product and technical docs (this folder)
└── ...
```

<!-- Adjust the structure above to match your actual stack. Keep it current. -->

## Client / server boundary

<!-- Explicit rules prevent accidental client bloat. -->

- **Server components by default** — fetch data at the component level, no prop drilling
- **Client components** — only when using: `onClick`, `useState`, `useEffect`, browser APIs
- **Server actions** — form submissions and mutations (no separate API route needed)
- **API routes** — only for webhooks, third-party callbacks, or non-browser consumers

## Auth model

<!-- How auth flows through the system. -->

- **Provider:** {{AUTH_PROVIDER}}
- **Session storage:** {{SESSION_MODEL}} (e.g. Supabase session in cookie)
- **Protected routes:** {{PROTECTED_ROUTE_PATTERN}} (e.g. everything under `app/(app)/`)
- **Redirect on unauth:** {{REDIRECT_TARGET}} (e.g. `/login`)

## Data model

<!-- Key entities only. Conceptual — not a schema. -->

| Entity | Purpose | Key fields |
|--------|---------|------------|
| {{ENTITY_1}} | {{PURPOSE_1}} | {{FIELDS_1}} |
| {{ENTITY_2}} | {{PURPOSE_2}} | {{FIELDS_2}} |
| {{ENTITY_3}} | {{PURPOSE_3}} | {{FIELDS_3}} |

## External services

| Service | Purpose | Docs |
|---------|---------|------|
| {{SERVICE_1}} | {{PURPOSE_1}} | {{DOCS_URL_1}} |
| {{SERVICE_2}} | {{PURPOSE_2}} | {{DOCS_URL_2}} |

## Deployment

| Environment | URL | Deploy trigger |
|-------------|-----|----------------|
| Local | http://localhost:3000 | `{{DEV_CMD}}` |
| Preview | Auto per PR | Push to branch |
| Production | {{PROD_URL}} | Merge to `main` |

**Hosting:** {{HOSTING}}
**CI/CD:** {{CICD_NOTES}}

## Key decisions

<!-- Record decisions here so future-you understands why things are the way they are.
     Template: topic → decision → why → tradeoff. -->

### Example: why Server Actions over API routes
**Decision:** Use Server Actions for all mutations
**Why:** Eliminates boilerplate API routes for internal app operations; co-locates logic with UI
**Tradeoff:** Less portable if the frontend ever separates from the backend

### {{DECISION_TOPIC_1}}
**Decision:** {{DECISION_1}}
**Why:** {{REASONING_1}}
**Tradeoff:** {{TRADEOFF_1}}
