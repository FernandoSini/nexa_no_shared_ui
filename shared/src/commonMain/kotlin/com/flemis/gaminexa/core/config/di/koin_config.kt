package com.flemis.gaminexa.core.config.di

import org.koin.core.KoinApplication
import org.koin.core.context.startKoin
import org.koin.dsl.KoinAppDeclaration
import org.koin.dsl.includes


fun initKoin(config: KoinAppDeclaration? = null) {
    startKoin {
        includes(config)
        modules(platformModule, repositoryModule, dataSourceModule)
    }
}