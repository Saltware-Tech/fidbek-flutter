# fidbek_flutter

Flutter wrapper plugin for Fidbek mobile SDK.

This package uses prebuilt native binaries:
- Android: `android/libs/fidbek-android.aar`
- iOS: `ios/FidbekSDK.xcframework`

Native SDK source code is not included in this package.

## Platform support

- Flutter: `>=3.22.0`
- Dart: `>=3.3.0 <4.0.0`
- Android: `minSdk 24`
- iOS: `13.0+`

## Installation

### Option A: from pub.dev

```yaml
dependencies:
  fidbek_flutter: ^0.1.0
```

### Option B: from Git

```yaml
dependencies:
  fidbek_flutter:
    git:
      url: git@github.com:Saltware-Tech/fidbek-flutter.git
      ref: main
```

Then run:

```bash
flutter pub get
```

## Usage

Initialize once (for example in app startup), then open when needed.

```dart
import 'package:fidbek_flutter/fidbek_flutter.dart';

Future<void> initFidbek() async {
  await FidbekFlutter.configure(
    token: 'YOUR_FIDBEK_TOKEN',
    shakeToOpenEnabled: true,
  );
}

Future<void> openFidbek() async {
  await FidbekFlutter.open();
}
```

Optional cleanup:

```dart
await FidbekFlutter.shutdown();
```

## API

- `FidbekFlutter.configure({required String token, bool shakeToOpenEnabled = true})`
- `FidbekFlutter.open()`
- `FidbekFlutter.shutdown()`

## iOS notes

- Deployment target must be at least iOS 13.
- After dependency changes, run:

```bash
cd ios
pod install
```

## Android notes

- `minSdkVersion` must be 24 or higher.
- The plugin already includes required native dependency declarations.

## Binary distribution note

This repository ships compiled native binaries (`.aar` and `.xcframework`) inside the plugin for easier integration and source-code hiding.
