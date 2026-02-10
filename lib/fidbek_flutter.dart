import 'package:flutter/services.dart';

class FidbekFlutter {
  static const MethodChannel _channel = MethodChannel('fidbek_flutter');

  static Future<void> configure({
    required String token,
    bool shakeToOpenEnabled = true,
  }) {
    return _channel.invokeMethod<void>('configure', <String, dynamic>{
      'token': token,
      'shakeToOpenEnabled': shakeToOpenEnabled,
    });
  }

  static Future<void> open() {
    return _channel.invokeMethod<void>('open');
  }

  static Future<void> shutdown() {
    return _channel.invokeMethod<void>('shutdown');
  }
}
