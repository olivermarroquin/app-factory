---
# Stack replacements — these fill {{PLACEHOLDERS}} in generated templates
STACK_SUMMARY       = React Native + Expo (managed) + EAS
FRONTEND            = React Native (Expo managed workflow)
BACKEND             = Supabase (recommended) or Firebase
DATABASE            = Supabase (Postgres)
AUTH                = Supabase Auth
EMAIL_SERVICE       = n/a (mobile app)
HOSTING             = EAS Build + App Store / Play Store
CICD_NOTES          = EAS Build for iOS and Android; eas build --platform all
DB_CLIENT           = supabase
AUTH_PROVIDER       = Supabase Auth
SESSION_MODEL       = Supabase session in AsyncStorage via Expo SecureStore
PROTECTED_ROUTE_PATTERN = app/(app)/
REDIRECT_TARGET     = /login
NODE_VERSION        = 18
INSTALL_CMD         = npm install
DEV_CMD             = npx expo start
BUILD_CMD           = eas build
TEST_CMD            = npm test
OTHER_PREREQS       = Expo CLI, EAS CLI, Xcode (iOS) or Android Studio (Android)
APP_DOMAIN          = yourdomain.com
---

# Stack Preset: React Native + Expo

## Summary

Cross-platform mobile app (iOS + Android) using Expo's managed workflow. Pairs well with a Supabase or Firebase backend.

## Stack

| Layer | Choice |
|-------|--------|
| Mobile framework | React Native (Expo managed workflow) |
| Navigation | Expo Router (file-based) |
| Backend | Supabase or Firebase (pick one — see those presets) |
| Auth | Supabase Auth or Firebase Auth |
| Styling | NativeWind (Tailwind for RN) |
| Distribution | EAS Build + EAS Submit |

## Best for

- Mobile-first apps targeting iOS and Android
- Teams that know React and want to avoid native tooling
- Apps that share logic with a web version

## Tradeoffs

| Pro | Con |
|-----|-----|
| One codebase for iOS + Android | Expo managed workflow has limits (native modules) |
| Fast iteration with Expo Go | OTA updates can be unpredictable |
| File-based routing with Expo Router | React Native debugging is harder than web |
| EAS handles signing and distribution | App store review adds cycle time |

## First setup

```bash
npx create-expo-app@latest {{APP_NAME}} --template blank-typescript
cd {{APP_NAME}}
npx expo install expo-router react-native-safe-area-context react-native-screens
npm install nativewind tailwindcss
```

Add to `app.json`:
```json
{
  "expo": {
    "scheme": "{{APP_SCHEME}}",
    "web": { "bundler": "metro" }
  }
}
```

## Suggested folder structure

```
app/
├── (auth)/         # Auth screens
├── (tabs)/         # Tab navigation screens
└── _layout.tsx     # Root layout
components/
├── ui/
└── {{FEATURE}}/
lib/
├── supabase.ts     # or firebase.ts
└── utils/
assets/
├── images/
└── fonts/
```

## Key docs

- Expo Router: https://expo.dev/router
- EAS Build: https://docs.expo.dev/build/introduction/
