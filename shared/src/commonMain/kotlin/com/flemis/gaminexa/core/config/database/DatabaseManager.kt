package com.flemis.gaminexa.core.config.database


expect class DatabaseManager {

    fun getDatabase(): RoomDB
    fun deleteDatabase(): Boolean
}
