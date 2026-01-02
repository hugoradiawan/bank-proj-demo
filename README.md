# Mondooli Premium Experience

A Flutter application built to replicate Bank's premium journey using clean architecture and Melos packages.

## Overview

Purpose-built to transform Bank designs into a scalable premium upsell journey. Built end-to-end across `app`, `core`, `shared`, and `features/premium`.

## Tech Stack

- **Flutter** with Melos monorepo (4-package workspace)
- **Clean Architecture** (presentation/domain/data per feature)
- **State Management**: `flutter_bloc` cubits
- **Navigation**: Typed `GoRouter` with `go_router_builder`
- **Networking**: Dio client with repository abstractions
- **Code Generation**: `freezed`, `json_serializable`
- **Linting**: Production-ready strictness via `analysis_options.yaml`

## Project Structure

```
Bank/
├── app/              # Main application shell
├── core/             # Theme, HTTP client, shared services
├── shared/           # Reusable UI components
└── features/
    └── premium/      # Premium upgrade feature module
```

## Design System

- **Primary Blue**: `#1D4ED8`
- **Dark Text**: `#1A233C`
- **Typography**: Figtree (weights 300–900)
- **Icons**: Phosphor icon set
- **Light/Dark Mode**: Runtime toggle via `ThemeCubit`, persisted to `SharedPreferences`
- **Barrel files**: (`core.dart`, `shared.dart`, `network.dart`) for module encapsulation

## Features

- **Premium Bridge**: Gradient hero with animated crown asset and conversion CTA
- **Registration**: Form with password checklist, dynamic country selector via REST API
- **Home Experience**: Greeting header, balance card, promo carousel, quick actions
- **Bottom Navigation**: Five-tab navigation with QRIS center dock

## API Integration

- Country data fetched from `https://restcountries.com/v3.1/all`
- Local caching via `SharedPreferencesService` for offline resilience

## Build Size

- **Raw APK**: ~50 MB
- **Google Play** (AAB + delivery optimization): ~20 MB
- **App Store**: ~40 MB

## Getting Started

### Prerequisites

- [FVM](https://fvm.app/) (Flutter Version Management)
- [Melos](https://melos.invertase.dev/)

### Installation

```bash
# Use the correct Flutter version
fvm use

# Bootstrap the workspace
melos bootstrap
```

### Running the App

```bash
# Run on Android or iOS (portrait only)
melos run app
```

### Building APK

```bash
melos run build:apk
```
