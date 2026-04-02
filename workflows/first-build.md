# Workflow: First Build Session

Use this checklist at the start of the very first real build session on a new app.

Prerequisites: repo is scaffolded, docs are filled in, stack is chosen.

---

## Before you start coding

- [ ] Re-read `docs/mvp.md` — confirm scope is clear and scoped small
- [ ] Re-read `docs/architecture.md` — confirm stack choices and folder structure
- [ ] Open Claude Code and verify `CLAUDE.md` is in the repo root
- [ ] Set up `.env` from `.env.example` — add real values

## Session structure

Each build session should:
- [ ] Start with a 1-sentence goal: "Today I'm building X"
- [ ] Use Claude Code with context from the docs folder
- [ ] End with a working, committed state — no half-done features left open

## First session targets (pick based on app type)

### Web app
- [ ] Set up project with chosen framework (Next.js, Vite, etc.)
- [ ] Configure routing skeleton
- [ ] Connect to database/backend
- [ ] Deploy a "hello world" to staging

### Mobile app
- [ ] Initialize with Expo or React Native CLI
- [ ] Configure navigation skeleton
- [ ] Connect to backend/API
- [ ] Run on simulator and physical device

### API / backend
- [ ] Set up framework (Express, Fastify, Hono, etc.)
- [ ] Create health check endpoint
- [ ] Connect to database
- [ ] Deploy to staging environment

## End of session checklist

- [ ] All changes committed
- [ ] `.env.example` updated if new vars were added
- [ ] `docs/` updated if any decisions changed
- [ ] Next session goal written in a comment or note
