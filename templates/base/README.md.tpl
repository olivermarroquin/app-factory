# {{APP_NAME}}

{{ONE_LINE_DESCRIPTION}}

**Live:** {{APP_URL}} &nbsp;|&nbsp; **Stage:** {{CURRENT_STAGE}}

---

## What it does

{{SHORT_DESCRIPTION}}

## Stack

| Layer | Choice |
|-------|--------|
| Frontend | {{FRONTEND}} |
| Backend | {{BACKEND}} |
| Database | {{DATABASE}} |
| Auth | {{AUTH}} |
| Hosting | {{HOSTING}} |

## Local setup

```bash
# Install
{{INSTALL_CMD}}

# Environment
cp .env.example .env
# Fill in values — see docs/architecture.md for notes on each var

# Run
{{DEV_CMD}}
```

**Requires:** Node {{NODE_VERSION}}+, {{OTHER_PREREQS}}

## Docs

- [Product brief](docs/product-brief.md) — problem, user, core workflow
- [MVP scope](docs/mvp-scope.md) — what's in and out of v1
- [Architecture](docs/architecture.md) — stack, structure, key decisions
- [Roadmap](docs/roadmap.md) — current phase and what's next
