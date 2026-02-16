# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Amhara Police HRIS — a Flutter mobile app (`police_com`) for HR management (leave, training, placement, clearance, transfer, promotion, incidents, verification). Supports English and Amharic (Ethiopian context).

## Common Commands

```bash
# Install dependencies
flutter clean && flutter pub get

# Code generation (freezed, json_serializable, riverpod_generator)
flutter pub run build_runner build --delete-conflicting-outputs

# Generate localizations
flutter gen-l10n

# Generate app icons
flutter pub run flutter_launcher_icons
```

There are no tests in this project currently.

## Architecture

**Clean Architecture per feature** in `lib/features/`:
```
feature/
├── application/     # Notifiers, providers (Riverpod)
├── data/           # Repository implementations, API calls via DioClient
├── domain/         # Freezed model classes (*.freezed.dart, *.g.dart)
└── presentation/   # Screens and widgets
```

**Core layer** (`lib/core/`): shared config, constants, enums, extensions, l10n, networking, navigation, theme.

### State Management — Riverpod

- `AsyncNotifier<State>` / `StateNotifier<AsyncValue<State>>` for feature state
- Freezed union types for state classes
- Repository interfaces injected via providers
- Providers defined in `application/` directories

### Navigation

No router package. Custom two-stage launch via `AppOrchestrator`:
1. Server config check → `ServerSetupScreen` if needed
2. Auth check → `LoginPage` or `HomePage`

`HomePage` uses drawer navigation with `SubModule` enum → each maps to a body widget via extensions.

### Networking

`DioClient` (`lib/core/network/dio_client.dart`):
- Dynamic base URL from user-configured server IP/port (`https://{ip}:{port}/api`)
- SSL certificate bypass for self-signed certs
- Cookie-based auth with `AuthInterceptor` and `CookieManager`
- All endpoints centralized in `ApiEndpoints` class

### Localization

- ARB files: `lib/core/l10n/app_en.arb` (template), `app_am.arb`
- Generated output: `lib/core/l10n/generated/`
- Config: `l10n.yaml`
- Access pattern: `context.lango.keyName` (via `ContextX` extension)

## Key Conventions

- Freezed for all domain models — run `build_runner` after modifying domain classes
- Generated files (`*.g.dart`, `*.freezed.dart`) are excluded from analysis and should not be manually edited
- Enums are extensive (`lib/core/enums/`) — covering Ethiopian regions, ranks, education levels, etc.
- `LoggerMixin` for consistent logging across classes
- Linting: `flutter_lints` + `riverpod_lint` with enforced single quotes and trailing commas
