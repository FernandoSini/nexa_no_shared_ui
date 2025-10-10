package com.flemis.gaminexa.core.config.di

import com.flemis.gaminexa.core.config.database.DatabaseManager
import com.flemis.gaminexa.core.feature.app.data.datasource.local.LocalDataSource
import com.flemis.gaminexa.core.feature.app.data.datasource.local.LocalDataSourceImpl
import com.flemis.gaminexa.core.feature.app.data.repository.UserRepositoryImpl
import com.flemis.gaminexa.core.feature.app.domain.repository.UserRepository
import org.koin.core.module.Module
import org.koin.core.module.dsl.singleOf
import org.koin.dsl.bind
import org.koin.dsl.module


expect val platformModule: Module

val dataSourceModule = module {
    singleOf(::LocalDataSourceImpl).bind(LocalDataSource::class)
}

val repositoryModule = module{
    singleOf(::UserRepositoryImpl).bind(UserRepository::class)
}




//se precisarmos injetar o usecase
/*
* val useCaseModule = module{
*
* singleOf(::UseCaseModule)
* }
* */

//viewmodel
/*
* val viewModelModule = module{
*
* viewModelOf(::viewModel)
* }
* */