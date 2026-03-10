package com.fidbek.flutter

import android.app.Application
import com.fidbek.sdk.Fidbek
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

class FidbekFlutterPlugin : FlutterPlugin, MethodCallHandler {
    private lateinit var channel: MethodChannel
    private lateinit var application: Application

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        application = binding.applicationContext as Application
        channel = MethodChannel(binding.binaryMessenger, "fidbek_flutter")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            "configure" -> {
                val token = call.argument<String>("token")
                if (token.isNullOrBlank()) {
                    result.error("INVALID_ARGUMENT", "token is required", null)
                    return
                }

                val shakeToOpenEnabled = call.argument<Boolean>("shakeToOpenEnabled") ?: true
                Fidbek.initialize(application, token, shakeToOpenEnabled)
                result.success(null)
            }

            "open" -> {
                Fidbek.open()
                result.success(null)
            }

            "identify" -> {
                val userId = call.argument<String>("userId")
                val name = call.argument<String>("name")
                val email = call.argument<String>("email")
                if (userId.isNullOrBlank()) {
                    if (name.isNullOrBlank() && email.isNullOrBlank()) {
                        result.error(
                            "INVALID_ARGUMENT",
                            "At least one of userId, name, or email is required",
                            null
                        )
                        return
                    }
                }

                Fidbek.identify(
                    userId = userId,
                    name = name,
                    email = email
                )
                result.success(null)
            }

            "clearIdentity" -> {
                Fidbek.clearIdentity()
                result.success(null)
            }

            "shutdown" -> {
                Fidbek.shutdown()
                result.success(null)
            }

            else -> result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
