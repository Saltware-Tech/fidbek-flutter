import FidbekSDK
import Flutter
import UIKit

@objc(FidbekFlutterPlugin)
public class FidbekFlutterPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "fidbek_flutter", binaryMessenger: registrar.messenger())
    let instance = FidbekFlutterPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "configure":
      guard let args = call.arguments as? [String: Any],
            let token = args["token"] as? String,
            !token.isEmpty else {
        result(
          FlutterError(
            code: "INVALID_ARGUMENT",
            message: "token is required",
            details: nil
          )
        )
        return
      }

      let shakeToOpenEnabled = args["shakeToOpenEnabled"] as? Bool ?? true
      Fidbek.shared.configure(token: token, shakeToOpenEnabled: shakeToOpenEnabled)
      result(nil)

    case "open":
      Fidbek.shared.present()
      result(nil)

    case "shutdown":
      Fidbek.shared.stop()
      result(nil)

    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
