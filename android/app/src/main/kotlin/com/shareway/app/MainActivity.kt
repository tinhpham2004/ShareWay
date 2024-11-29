package com.shareway.app

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.shareway.app/momo"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "requestPayment") {
                val amount = call.argument<Int>("amount") ?: 0
                val description = call.argument<String>("description") ?: ""
                val orderId = call.argument<String>("orderId") ?: ""
                val momoService = MoMoPaymentService(this)
                momoService.requestPayment(amount, description, orderId)
                result.success(null)
            }
        }
    }
}
