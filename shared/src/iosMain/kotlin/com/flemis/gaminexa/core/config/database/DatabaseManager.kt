package com.flemis.gaminexa.core.config.database

import androidx.room.Room
import androidx.sqlite.driver.bundled.BundledSQLiteDriver
import kotlinx.cinterop.ExperimentalForeignApi
import kotlinx.coroutines.IO
import platform.Foundation.NSDocumentDirectory
import platform.Foundation.NSFileManager
import platform.Foundation.NSUserDomainMask

@OptIn(ExperimentalForeignApi::class)
private fun documentDirectory(): String {
    val documentDirectory = NSFileManager.defaultManager.URLForDirectory(
        directory = NSDocumentDirectory,
        inDomain = NSUserDomainMask,
        appropriateForURL = null,
        create = false,
        error = null,
    )
    return requireNotNull(documentDirectory?.path)
}

actual class DatabaseManager {
    constructor()

    actual fun getDatabase(): RoomDB {
        val dbFilePath = documentDirectory() + "/gaminexa.db"
        return Room.databaseBuilder<RoomDB>(
            name = dbFilePath,
            //     factory =  { RoomDB::class.instantiateImpl() }

        ).setDriver(BundledSQLiteDriver())
            .setQueryCoroutineContext(kotlinx.coroutines.Dispatchers.IO)
            .build()
    }

    @OptIn(ExperimentalForeignApi::class)
    actual fun deleteDatabase(): Boolean {
        val appContext = documentDirectory()
        val dbFilePath = documentDirectory() + "/gaminexa.db"
        val fileManager = NSFileManager.defaultManager
        return fileManager.removeItemAtPath(dbFilePath, error = null)
    }
}