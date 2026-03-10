# fidbek_flutter

[![pub package](https://img.shields.io/pub/v/fidbek_flutter.svg)](https://pub.dev/packages/fidbek_flutter)

Flutter wrapper plugin for Fidbek mobile SDK.

- pub.dev: `https://pub.dev/packages/fidbek_flutter`
- Repository: `https://github.com/Saltware-Tech/fidbek-flutter`

## Platform Support

- Flutter: `>=3.22.0`
- Dart: `>=3.3.0 <4.0.0`
- Android: `minSdk 24`
- iOS: `13.0+`

## Install

```yaml
dependencies:
  fidbek_flutter: ^0.3.0
```

Then:

```bash
flutter pub get
```

## Usage

```dart
import 'package:fidbek_flutter/fidbek_flutter.dart';

await FidbekFlutter.configure(
  token: 'YOUR_FIDBEK_TOKEN',
  shakeToOpenEnabled: true,
);

await FidbekFlutter.identify(
  email: 'talha@example.com',
);

await FidbekFlutter.open();
```

Optional cleanup:

```dart
await FidbekFlutter.clearIdentity();
await FidbekFlutter.shutdown();
```

## API

- `FidbekFlutter.configure({required String token, bool shakeToOpenEnabled = true})`
- `FidbekFlutter.open()`
- `FidbekFlutter.identify({String? userId, String? name, String? email})`
- `FidbekFlutter.clearIdentity()`
- `FidbekFlutter.shutdown()`

At least one of `userId`, `name`, or `email` is required for `identify`.

## Surface Policy

- Wrapper surface is intentionally limited to the core 5 methods above.
- Native attachment staging helpers are not exposed in Flutter.

## Binary Distribution

This package includes prebuilt native binaries:

- Android: `android/libs/fidbek-android.aar`
- iOS: `ios/FidbekSDK.xcframework`
- iOS resources: `ios/FidbekSDK_FidbekSDK.bundle` (`en`, `tr`, `es`, `fr`, `de`, `pt`, `ar`, `hi`, `ja`, `zh-Hans`)

Native SDK source code is intentionally not included.
