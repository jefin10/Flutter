📋 LoopX Master Checklist (quick‑scan)
Core Flutter Widgets & Patterns
Stack / Positioned

InkWell & GestureDetector

ListView.builder (+ ScrollController)

AppBar & SliverAppBar

TabBar / TabBarView navigation

Drawer & BottomNavigationBar

WillPopScope (Android back handling)

?? null‑coalescing & other Dart null‑safety operators

Image.network / CachedNetworkImage

Navigator 2.0 (go_router, deep links)

SnackBar (ScaffoldMessenger)

State & Dependency
Riverpod: ConsumerStatefulWidget, StateNotifierProvider, StateNotifier

Async/Stream providers, merges with local state

ValueNotifier / AnimatedBuilder

(Optional) Bloc/Cubit demo module

get_it for DI overrides

Networking / Async
HTTP basics (get, post, delete) via dio

FutureBuilder & StreamBuilder

GraphQL (one endpoint)

Supabase & Backend
Auth flows (email, Google, magic link)

RLS policies & row‑level triggers

Realtime subscriptions (posts, likes, DMs)

Storage uploads (signed URLs, edge resize)

RPC / Postgres functions

Edge Functions for notifications / moderation

pgvector similarity search

App Architecture & Tooling
Clean Architecture layers

Feature‑first folder structure

.env config with flutter_dotenv

Modularization / melos

Lints (very_good_analysis)

CI/CD (GitHub Actions or Codemagic)

Unit / widget / integration tests

Git hooks, version bump, changelog

UI/UX Polish
Material 3 theming (light/dark, token‑based)

Shimmer skeletons, Rive/Lottie micro‑animations

Hero transitions, AnimatedSwitcher/Container

Slivers, PageView, RefreshIndicator

AR filter or AI caption “wow” feature

Adaptive layout & platform awareness

Offline & Performance
Hive cache for feed / chat

Connectivity_plus status & optimistic UI

Lazy loading, cacheExtent tuning

DevTools profiling, split APK/IPA, A11y audit

Notifications & Analytics
Firebase/OneSignal push (foreground/background/actions)

Local notifications scheduler

Firebase Analytics + Crashlytics/Sentry

Custom performance traces

Security & Compliance
TLS pinning, secure storage

Biometric lock option

Input sanitization for markdown

Obfuscate secrets

Docs & Delivery
Dartdoc comments

Draw.io architecture diagram

ADRs in /docs/architecture

README with GIF demo + CI badge

Live web build + Play Store internal track