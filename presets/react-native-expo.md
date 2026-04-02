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
