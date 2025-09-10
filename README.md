# elimde

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Commands

### Setup

```bash
flutter --version
flutter pub get
```

### Generate localization (l10n)

Note: This usually runs automatically on build. Run manually if needed.

```bash
flutter gen-l10n
```

### Run (debug)

```bash
# Device-agnostic (uses the current device)
flutter run

# Web
flutter run -d chrome

# Android (requires emulator or device)
flutter run -d android

# iOS (requires macOS and Xcode)
flutter run -d ios

# Windows
flutter run -d windows

# macOS (requires macOS)
flutter run -d macos

# Linux
flutter run -d linux
```

### Build (release)

```bash
# Android APK (universal)
flutter build apk --release

# Android AppBundle
flutter build appbundle --release

# iOS (requires macOS and Xcode)
flutter build ios --release

# Web
flutter build web --release

# Windows
flutter build windows --release

# macOS
flutter build macos --release

# Linux
flutter build linux --release
```

### Quality

```bash
# Static analysis
flutter analyze

# Format code
dart format .

# Tests
flutter test

# See outdated dependencies
flutter pub outdated
```

### Maintenance

```bash
# Clean build artifacts
flutter clean

# Regenerate platform files if needed
flutter pub get
flutter gen-l10n
```

### Localization notes

- Add or edit ARB files in `lib/l10n/` (e.g., `app_en.arb`, `app_tr.arb`).
- After changing ARB files, run `flutter gen-l10n` or simply build/run the app.

### Using responsive design

```dart

final padding = Responsive.value(
    context: context,
    mobile: const EdgeInsets.all(16),
    tablet: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
    desktop: const EdgeInsets.symmetric(horizontal: 48, vertical: 32),
);"# marketplace" 
