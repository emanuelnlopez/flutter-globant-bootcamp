package com.example.android_plugin

import androidx.annotation.NonNull

import android.os.Build
import android.view.WindowManager
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** AndroidPlugin */
class AndroidPlugin: FlutterPlugin, MethodCallHandler, ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
    private var activity: android.app.Activity? = null

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "android_plugin")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    } else if (call.method == "getDeviceName") {
      result.success("${Build.BRAND} ${Build.MODEL}")
    } else if (call.method == "setScreenshotEnabled") {
      val enabled = call.argument<Boolean>("enabled") ?: true
      setScreenshotEnabled(enabled)
      result.success(null)
    } else {
      result.notImplemented()
    }
  }

  private fun setScreenshotEnabled(enabled: Boolean) {
      activity?.runOnUiThread {
          if (enabled) {
              activity?.window?.clearFlags(WindowManager.LayoutParams.FLAG_SECURE)
          } else {
              activity?.window?.addFlags(WindowManager.LayoutParams.FLAG_SECURE)
          }
      }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
      activity = binding.activity
  }

  override fun onDetachedFromActivityForConfigChanges() {
      activity = null
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
      activity = binding.activity
  }

  override fun onDetachedFromActivity() {
      activity = null
  }
}
