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
  fidbek_flutter: ^0.2.0
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

await FidbekFlutter.open();
```

Optional shutdown:

```dart
await FidbekFlutter.shutdown();
```

## API

- `FidbekFlutter.configure({required String token, bool shakeToOpenEnabled = true})`
- `FidbekFlutter.open()`
- `FidbekFlutter.shutdown()`

## Binary Distribution

This package includes prebuilt native binaries:

- Android: `android/libs/fidbek-android.aar`
- iOS: `ios/FidbekSDK.xcframework`
- iOS resources: `ios/FidbekSDKResources.bundle` (`en`, `tr`)

Native SDK source code is intentionally not included.
