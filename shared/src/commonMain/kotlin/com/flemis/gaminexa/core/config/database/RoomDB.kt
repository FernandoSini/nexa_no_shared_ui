package com.flemis.gaminexa.core.config.database

import androidx.room.ConstructedBy
import androidx.room.Database
import androidx.room.RoomDatabase
import androidx.room.RoomDatabaseConstructor
import androidx.room.TypeConverters
import com.flemis.gaminexa.core.feature.app.data.datasource.local.db.UserDao
import com.flemis.gaminexa.core.feature.app.data.models.UserModel
import com.flemis.gaminexa.core.feature.app.domain.entities.UserEntity

@Database(entities = [UserModel::class], version = 1)
@ConstructedBy(AppDatabaseConstructor::class)
@TypeConverters(ConvertersRoom::class)
abstract class RoomDB : RoomDatabase() {
    abstract fun userDao(): UserDao
    // Define your DAOs here
}

@Suppress("KotlinNoActualForExpect")
expect object AppDatabaseConstructor : RoomDatabaseConstructor<RoomDB> {
    override fun initialize(): RoomDB

}