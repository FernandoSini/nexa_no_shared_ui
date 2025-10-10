package com.flemis.gaminexa.core.feature.app.domain.usecases

import com.flemis.gaminexa.core.feature.app.domain.entities.UserEntity
import com.flemis.gaminexa.core.feature.app.domain.repository.UserRepository
import kotlinx.coroutines.ExperimentalCoroutinesApi
import org.koin.core.Koin
import org.koin.core.component.KoinComponent
import org.koin.core.component.inject

class UserUseCase : KoinComponent {
    // private val repository: UserRepository by inject()
        //essas sao as duas formas de fazer injecao
    // private val repository = getKoin().get<UserRepository>()
    @Throws(Exception::class)
    suspend fun getUser() : UserEntity?{
        return UserEntity("", "fernando", "fernandosini", "flemis.gaminexa@gaminexa.com", "", "10")
    }

}