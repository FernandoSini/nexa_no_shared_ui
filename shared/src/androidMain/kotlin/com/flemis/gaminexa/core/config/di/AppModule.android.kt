package com.flemis.gaminexa.core.config.di

import android.content.Context
import com.flemis.gaminexa.core.config.database.DatabaseManager
import org.koin.dsl.module

actual val platformModule = module {
    single<DatabaseManager> { DatabaseManager(get()) }
}

fun androidModule(context: Context) = module {}