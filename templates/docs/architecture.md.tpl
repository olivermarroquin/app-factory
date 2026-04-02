# Architecture — {{APP_NAME}}

## Stack

| Layer | Choice | Why |
|-------|--------|-----|
| Frontend | {{FRONTEND}} | {{REASON}} |
| Backend | {{BACKEND}} | {{REASON}} |
| Database | {{DATABASE}} | {{REASON}} |
| Auth | {{AUTH}} | {{REASON}} |
| Hosting | {{HOSTING}} | {{REASON}} |
| CI/CD | {{CICD}} | {{REASON}} |

## Folder structure

```
{{APP_NAME}}/
├── {{FOLDER_1}}/     # {{PURPOSE_1}}
├── {{FOLDER_2}}/     # {{PURPOSE_2}}
├── {{FOLDER_3}}/     # {{PURPOSE_3}}
└── ...
```

## Data model (high level)

<!-- Key entities and their relationships. Keep it conceptual, not schema-level. -->

- **{{ENTITY_1}}**: {{DESCRIPTION}}
- **{{ENTITY_2}}**: {{DESCRIPTION}}
- **{{ENTITY_3}}**: {{DESCRIPTION}}

## Key decisions

<!-- Decisions made and why. Useful for future-you when reconsidering. -->

### {{DECISION_TOPIC_1}}
**Decision:** {{DECISION}}
**Why:** {{REASONING}}
**Tradeoff:** {{TRADEOFF}}

### {{DECISION_TOPIC_2}}
**Decision:** {{DECISION}}
**Why:** {{REASONING}}
**Tradeoff:** {{TRADEOFF}}

## External services

| Service | Purpose | Notes |
|---------|---------|-------|
| {{SERVICE_1}} | {{PURPOSE}} | {{NOTES}} |

## Environments

| Env | URL | Notes |
|-----|-----|-------|
| Local | localhost:{{PORT}} | |
| Staging | {{STAGING_URL}} | |
| Production | {{PROD_URL}} | |
