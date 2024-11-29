package com.shareway.app

import android.app.Activity
import android.content.Intent
import vn.momo.momo_partner.AppMoMoLib

class MoMoPaymentService(private val activity: Activity) {

    fun requestPayment(amount: Int, description: String, orderId: String) {
        // Initialize MoMo SDK
        AppMoMoLib.getInstance().setAction(AppMoMoLib.ACTION.PAYMENT)
        AppMoMoLib.getInstance().setActionType(AppMoMoLib.ACTION_TYPE.GET_TOKEN)
        AppMoMoLib.getInstance().setEnvironment(AppMoMoLib.ENVIRONMENT.DEVELOPMENT)

        // Create payment parameters
        val eventValue: MutableMap<String, Any> = mutableMapOf(
            "merchantname" to "ShareWay Demo",
            "merchantcode" to "MOMO25RT20240415_TEST", // Replace with your merchant code
            "amount" to amount,
            "description" to description,
            "requestId" to orderId,
            "partnerCode" to "MOMO25RT20240415_TEST" // Replace with your partner code
        )


        // Request payment
        // val intent = Intent(Intent.ACTION_VIEW).setPackage("com.mservice.momotransfer")
        // if (intent.resolveActivity(activity.packageManager) != null) {
            // println("MoMo app can handle the intent.")
        AppMoMoLib.getInstance().requestMoMoCallBack(activity, eventValue)
        // } else {
        //     println("MoMo app cannot handle the intent. Redirecting to Play Store.")
        // }


    }

    fun handleResult(requestCode: Int, resultCode: Int, data: Intent?) {
        if (requestCode == AppMoMoLib.getInstance().REQUEST_CODE_MOMO && resultCode == Activity.RESULT_OK) {
            if (data != null) {
                val status = data.getIntExtra("status", -1)
                val token = data.getStringExtra("data")
                if (status == 0 && !token.isNullOrEmpty()) {
                    // Payment successful, handle the token
                    println("Payment token received: $token")
                } else {
                    println("Payment failed: ${data.getStringExtra("message")}")
                }
            }
        }
    }
}
