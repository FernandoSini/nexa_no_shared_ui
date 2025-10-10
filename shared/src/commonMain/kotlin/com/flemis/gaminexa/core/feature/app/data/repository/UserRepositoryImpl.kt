package com.flemis.gaminexa.core.feature.app.data.repository

import com.flemis.gaminexa.core.feature.app.data.datasource.local.LocalDataSource
import com.flemis.gaminexa.core.feature.app.data.datasource.remote.RemoteDataSource
import com.flemis.gaminexa.core.feature.app.domain.repository.UserRepository
import org.koin.core.component.KoinComponent
import org.koin.core.component.inject

class UserRepositoryImpl : UserRepository, KoinComponent {
    // val localDataSouce: LocalDataSource by inject()
    private val localDataSource = getKoin().get<LocalDataSource>()
    //val remoteDataSource : RemoteDataSource by inject()
    private val remoteDataSource = getKoin().get<RemoteDataSource>()

    override suspend fun fetchUserData() {
        TODO("Not yet implemented")
    }
}