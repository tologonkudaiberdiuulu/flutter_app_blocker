package com.example.flutter_app_blocker

import android.content.Context
import android.content.SharedPreferences

object BlockedAppsManager {
    private const val PREFS_NAME = "BlockedAppsPrefs"
    private const val BLOCKED_APPS_KEY = "BlockedApps"

    fun updateBlockedApps(context: Context, apps: List<String>) {
        val prefs: SharedPreferences = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        prefs.edit().putStringSet(BLOCKED_APPS_KEY, apps.toSet()).apply()
        println("✅ Blocked Apps Updated: $apps")
    }

    fun getBlockedApps(context: Context): Set<String> {
        val prefs: SharedPreferences = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        val blocked = prefs.getStringSet(BLOCKED_APPS_KEY, emptySet()) ?: emptySet()

        println("📂 Retrieved Blocked Apps: $blocked")  // ✅ Log when retrieving blocked apps
        return blocked
    }
}
