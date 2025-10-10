package com.flemis.gaminexa.core.config.database

import android.content.Context
import androidx.room.Room
import androidx.sqlite.driver.bundled.BundledSQLiteDriver
import kotlinx.coroutines.Dispatchers

actual class DatabaseManager {
    private val context: Context

    constructor(context: Context) {
        this.context = context
    }

    actual fun getDatabase(): RoomDB {
        val ctx = context.applicationContext
        val dbFile = ctx.getDatabasePath("gaminexa.db")
        return Room.databaseBuilder<RoomDB>(context = ctx, name = dbFile.absolutePath)
            .fallbackToDestructiveMigration(false)
            .setDriver(BundledSQLiteDriver())
            .setQueryCoroutineContext(Dispatchers.IO)
            .build()
    }

    actual fun deleteDatabase(): Boolean {
        val ctx = context.applicationContext
        return ctx.deleteDatabase("gaminexa.db")
    }
}