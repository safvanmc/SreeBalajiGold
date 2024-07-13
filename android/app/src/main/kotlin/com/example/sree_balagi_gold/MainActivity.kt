package com.sree_balagi_gold.ltd

import android.content.Context
import android.database.ContentObserver
import android.net.Uri
import android.os.Bundle
import android.os.Handler
import android.provider.MediaStore
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private lateinit var screenshotDetector: ScreenshotDetector
    private val channel = "screenshot_channel"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        
        // Initialize the method channel if binaryMessenger is not null
        flutterEngine?.dartExecutor?.binaryMessenger?.let { messenger ->
            val methodChannel = MethodChannel(messenger, channel)
            methodChannel.setMethodCallHandler { call, result ->
                if (call.method == "startListening") {
                    screenshotDetector.startListening()
                    result.success(null)
                } else {
                    result.notImplemented()
                }
            }

            screenshotDetector = ScreenshotDetector(this, methodChannel)
        }
    }

    override fun onDestroy() {
        super.onDestroy()
        screenshotDetector.stopListening()
    }
}

class ScreenshotDetector(private val context: Context, private val channel: MethodChannel) {

    private val contentObserver: ContentObserver = object : ContentObserver(Handler()) {
        override fun onChange(selfChange: Boolean, uri: Uri?) {
            super.onChange(selfChange, uri)
            if (uri != null && uri.toString().contains(MediaStore.Images.Media.EXTERNAL_CONTENT_URI.toString())) {
                channel.invokeMethod("screenshotDetected", null)
            }
        }
    }

    fun startListening() {
        context.contentResolver.registerContentObserver(
            MediaStore.Images.Media.EXTERNAL_CONTENT_URI,
            true,
            contentObserver
        )
    }

    fun stopListening() {
        context.contentResolver.unregisterContentObserver(contentObserver)
    }
}
