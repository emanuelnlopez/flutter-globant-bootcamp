package com.example.android_plugin

import androidx.annotation.NonNull

import android.app.ActivityManager
import android.content.Context
import android.net.ConnectivityManager
import android.net.Network
import android.net.NetworkCapabilities
import android.net.NetworkRequest
import android.os.Build
import android.os.Handler
import android.os.Looper
import android.view.WindowManager
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.EventChannel
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
  private lateinit var eventChannel: EventChannel
  private lateinit var context: Context
  private var activity: android.app.Activity? = null
  private lateinit var connectivityManager: ConnectivityManager
  private var eventSink: EventChannel.EventSink? = null
  private val mainHandler = Handler(Looper.getMainLooper())

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "android_plugin")
    channel.setMethodCallHandler(this)
        
    eventChannel = EventChannel(flutterPluginBinding.binaryMessenger, "network_status")
    eventChannel.setStreamHandler(object : EventChannel.StreamHandler {
        override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
            eventSink = events
            startNetworkMonitoring()
        }

        override fun onCancel(arguments: Any?) {
            eventSink = null
            stopNetworkMonitoring()
        }
    })
    
    context = flutterPluginBinding.applicationContext
    connectivityManager = context.getSystemService(Context.CONNECTIVITY_SERVICE) as ConnectivityManager
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

  private lateinit var networkCallback: ConnectivityManager.NetworkCallback

  private fun startNetworkMonitoring() {
      networkCallback = object : ConnectivityManager.NetworkCallback() {
          override fun onAvailable(network: Network) {
              updateNetworkStatus(true)
          }

          override fun onLost(network: Network) {
              updateNetworkStatus(false)
          }
      }

      val networkRequest = NetworkRequest.Builder()
          .addCapability(NetworkCapabilities.NET_CAPABILITY_INTERNET)
          .build()

      connectivityManager.registerNetworkCallback(networkRequest, networkCallback)

      // Initial network status
      updateNetworkStatus(isNetworkAvailable())
  }

  private fun stopNetworkMonitoring() {
      connectivityManager.unregisterNetworkCallback(networkCallback)
  }

  private fun updateNetworkStatus(isConnected: Boolean) {
        mainHandler.post {
            eventSink?.success(isConnected)
        }
  }

  private fun isNetworkAvailable(): Boolean {
      val network = connectivityManager.activeNetwork
      val capabilities = connectivityManager.getNetworkCapabilities(network)
      return capabilities?.hasCapability(NetworkCapabilities.NET_CAPABILITY_INTERNET) == true
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
