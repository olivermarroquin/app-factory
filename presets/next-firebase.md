# Stack Preset: Next.js + Firebase

## Summary

Full-stack web app with Next.js frontend and Firebase backend (Firestore, Auth, Storage). Good when you want a NoSQL data model or already use Firebase services.

## Stack

| Layer | Choice |
|-------|--------|
| Frontend | Next.js (App Router) |
| Backend | Next.js API routes + Firebase Admin SDK |
| Database | Firestore (NoSQL) |
| Auth | Firebase Auth |
| Storage | Firebase Storage |
| Hosting | Vercel (frontend) + Firebase (backend services) |
| Styling | Tailwind CSS |

## Best for

- Apps with flexible, document-oriented data (not relational)
- Teams already in the Firebase/Google ecosystem
- Apps needing push notifications (via FCM)
- Mobile + web apps sharing a Firebase backend

## Tradeoffs

| Pro | Con |
|-----|-----|
| Flexible NoSQL schema | Complex queries are harder than SQL |
| Strong Google ecosystem integration | Firebase costs can spike at scale |
| Offline support built-in (Firestore) | Vendor lock-in is significant |
| Great real-time SDK | No server-side joins |

## First setup

```bash
npx create-next-app@latest {{APP_NAME}} --typescript --tailwind --app
cd {{APP_NAME}}
npm install firebase firebase-admin
```

Create a Firebase project at console.firebase.google.com, then add to `.env.local`:

```
NEXT_PUBLIC_FIREBASE_API_KEY=
NEXT_PUBLIC_FIREBASE_AUTH_DOMAIN=
NEXT_PUBLIC_FIREBASE_PROJECT_ID=
NEXT_PUBLIC_FIREBASE_STORAGE_BUCKET=
NEXT_PUBLIC_FIREBASE_MESSAGING_SENDER_ID=
NEXT_PUBLIC_FIREBASE_APP_ID=
FIREBASE_SERVICE_ACCOUNT_KEY=  # JSON string for Admin SDK
```

## Suggested folder structure

```
app/
├── (auth)/         # Auth routes
├── (app)/          # Protected app routes
components/
├── ui/
└── {{FEATURE}}/
lib/
├── firebase/       # Firebase client + admin setup
└── utils/
```
