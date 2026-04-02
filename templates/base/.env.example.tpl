# .env.example — {{APP_NAME}}
# Copy to .env and fill in values. Never commit .env.

# ─── App ─────────────────────────────────────────────────────────────────────
NEXT_PUBLIC_APP_URL=http://localhost:3000
NODE_ENV=development

# ─── Database (Supabase) ──────────────────────────────────────────────────────
NEXT_PUBLIC_SUPABASE_URL=https://your-project.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key
SUPABASE_SERVICE_ROLE_KEY=your-service-role-key   # server-side only, never expose

# ─── Auth ─────────────────────────────────────────────────────────────────────
# If using NextAuth:
# NEXTAUTH_URL=http://localhost:3000
# NEXTAUTH_SECRET=generate-with: openssl rand -base64 32

# OAuth providers — add only what you use
# GOOGLE_CLIENT_ID=
# GOOGLE_CLIENT_SECRET=
# GITHUB_CLIENT_ID=
# GITHUB_CLIENT_SECRET=

# ─── Email ────────────────────────────────────────────────────────────────────
# Resend (recommended) or any SMTP provider
# RESEND_API_KEY=re_...
# EMAIL_FROM=noreply@{{APP_DOMAIN}}

# ─── Payments ─────────────────────────────────────────────────────────────────
# STRIPE_SECRET_KEY=sk_test_...
# STRIPE_WEBHOOK_SECRET=whsec_...
# NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY=pk_test_...

# ─── Other services ───────────────────────────────────────────────────────────
# Add third-party API keys below as you introduce them
# SERVICE_NAME_API_KEY=
