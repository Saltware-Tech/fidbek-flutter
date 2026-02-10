# Publishing to pub.dev

## 1) Account setup (one-time)

1. Sign in at https://pub.dev with your Google account.
2. In terminal, authenticate CLI:

```bash
flutter pub login
```

3. Verify auth token exists:

```bash
flutter pub token list
```

## 2) Pre-publish checks

From package root:

```bash
flutter pub get
flutter analyze
flutter pub publish --dry-run
```

## 3) Publish

1. Bump version in `pubspec.yaml` (for every new release).
2. Add release note in `CHANGELOG.md`.
3. Publish:

```bash
flutter pub publish
```

To skip confirmation prompt:

```bash
flutter pub publish --force
```

## 4) Recommended release flow

```bash
git add .
git commit -m "Release x.y.z"
git tag vx.y.z
git push origin main --tags
```

Then run `flutter pub publish` from the same commit/tag.

## 5) Notes for this package

- This package ships native binaries (`.aar` and `.xcframework`) inside the plugin.
- Native source code is not included.
- Platform requirements:
  - Flutter >= 3.22.0
  - Dart >= 3.3.0 < 4.0.0
  - Android minSdk 24
  - iOS 13+
