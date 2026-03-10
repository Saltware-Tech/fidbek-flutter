## 0.3.5

- Updated bundled iOS XCFramework and resources to native Fidbek SDK `0.3.5`.
- Includes the scripted native packaging pipeline and latest iOS binary rebuild.
- Android bundled native artifact remains on native `0.3.0`.

## 0.3.2

- Rebuilt the bundled iOS XCFramework from native source `0.3.2`.
- Removes stale module metadata from the packaged binary to avoid `missing required module 'CoreMotion'` installs.
- Android bundled native artifact remains on native `0.3.0`.

## 0.3.1

- Removed stale `CoreMotion` linkage from the iOS podspec.
- Fixes iOS wrapper installations that could fail with `missing required module 'CoreMotion'`.
- No native binary change in this patch; bundled Fidbek SDK artifacts remain on native `0.3.0`.

## 0.3.0

- Updated bundled native binaries to Fidbek SDK `0.3.0` (Android AAR + iOS XCFramework).
- Added `identify` and `clearIdentity` to the documented wrapper surface.
- Wrapper API is now explicitly limited to the core 5 methods.

## 0.2.1

- Fixed iOS runtime crash caused by resource bundle name mismatch.
- iOS localization bundle is now packaged as `FidbekSDK_FidbekSDK.bundle`.

## 0.2.0

- Updated bundled native binaries to Fidbek SDK `0.2.0` (Android AAR + iOS XCFramework).
- Added native "How often does this happen?" frequency selector in the report flow.
- Improved reliability with device heartbeat ping queue and more resilient upload handling.
- Moved token validation to send/submit time for a smoother open flow.
- Bundled iOS localization resources (`en`, `tr`) via `FidbekSDKResources.bundle`.

## 0.1.5

- Updated bundled native binaries to Fidbek SDK `0.1.5` (Android AAR + iOS XCFramework).
- Includes latest native feedback UI and media flow updates.

## 0.1.3

- Refreshed bundled native artifacts (Android AAR + iOS XCFramework).
- Added native support for multiple media attachments (gallery image/video pick + preview/edit flow).
- Kept automatic screenshot capture in feedback open flow.

## 0.1.2

- Refreshed bundled native artifacts (Android AAR + iOS XCFramework).
- Restored automatic screenshot capture in native feedback open flow.

## 0.1.1

- Updated package metadata homepage URL.

## 0.1.0

- Initial Flutter wrapper for Fidbek iOS/Android binary SDKs.
- Exposes `configure`, `open`, and `shutdown` via MethodChannel.
