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

  static Future<void> identify({
    String? userId,
    String? name,
    String? email,
  }) {
    final normalizedUserId = userId?.trim();
    final normalizedName = name?.trim();
    final normalizedEmail = email?.trim();
    if ((normalizedUserId == null || normalizedUserId.isEmpty) &&
        (normalizedName == null || normalizedName.isEmpty) &&
        (normalizedEmail == null || normalizedEmail.isEmpty)) {
      throw ArgumentError('At least one of userId, name, or email is required');
    }

    return _channel.invokeMethod<void>('identify', <String, dynamic>{
      'userId': (normalizedUserId == null || normalizedUserId.isEmpty) ? null : normalizedUserId,
      'name': (normalizedName == null || normalizedName.isEmpty) ? null : normalizedName,
      'email': (normalizedEmail == null || normalizedEmail.isEmpty) ? null : normalizedEmail,
    });
  }

  static Future<void> clearIdentity() {
    return _channel.invokeMethod<void>('clearIdentity');
  }

  static Future<void> shutdown() {
    return _channel.invokeMethod<void>('shutdown');
  }
}
