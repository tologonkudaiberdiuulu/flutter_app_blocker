package com.example.flutter_app_blocker

import android.accessibilityservice.AccessibilityService
import android.content.Intent
import android.view.accessibility.AccessibilityEvent

class AppBlockService : AccessibilityService() {
    override fun onAccessibilityEvent(event: AccessibilityEvent?) {
        val packageName = event?.packageName?.toString() ?: return
        val blockedApps = BlockedAppsManager.getBlockedApps(this)

        println("🔍 Detected App: $packageName")  // ✅ Debugging log
        println("🚫 Blocked Apps: $blockedApps")  // ✅ Verify blocked apps list

        if (blockedApps.contains(packageName)) {
            println("⚠️ Blocking App: $packageName")
            
            val intent = Intent(Intent.ACTION_MAIN)
            intent.addCategory(Intent.CATEGORY_HOME)
            intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
            startActivity(intent)
        }
    }

    override fun onInterrupt() {}
}
