# Stack Preset: Next.js + Supabase

## Summary

Full-stack web app with server-side rendering, Postgres database, built-in auth, and real-time subscriptions out of the box.

## Stack

| Layer | Choice |
|-------|--------|
| Frontend | Next.js (App Router) |
| Backend | Next.js API routes / Server Actions |
| Database | Supabase (Postgres) |
| Auth | Supabase Auth |
| Storage | Supabase Storage |
| Hosting | Vercel |
| Styling | Tailwind CSS |

## Best for

- Web apps needing auth + database from day one
- Apps where you want to move fast without managing a separate backend
- Projects where real-time features (live updates, presence) may be needed

## Tradeoffs

| Pro | Con |
|-----|-----|
| Zero backend setup | Supabase vendor lock-in on DB/auth |
| Built-in auth (OAuth, magic link, password) | Row-level security requires learning |
| Generous free tier | Not ideal for complex background jobs |
| Vercel + Supabase deploys in minutes | Cold starts on Vercel serverless |

## First setup

```bash
npx create-next-app@latest {{APP_NAME}} --typescript --tailwind --app
cd {{APP_NAME}}
npm install @supabase/supabase-js @supabase/ssr
```

Create a Supabase project at supabase.com, then add to `.env.local`:

```
NEXT_PUBLIC_SUPABASE_URL=your-project-url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key
SUPABASE_SERVICE_ROLE_KEY=your-service-role-key
```

## Suggested folder structure

```
app/
├── (auth)/         # Auth routes (login, signup, callback)
├── (app)/          # Protected app routes
├── api/            # API routes (if needed beyond Server Actions)
components/
├── ui/             # Reusable UI components
├── {{FEATURE}}/    # Feature-specific components
lib/
├── supabase/       # Supabase client setup
└── utils/          # Shared utilities
```

## Key docs

- Next.js App Router: https://nextjs.org/docs/app
- Supabase + Next.js guide: https://supabase.com/docs/guides/getting-started/quickstarts/nextjs
