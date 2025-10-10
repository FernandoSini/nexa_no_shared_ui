package com.flemis.gaminexa.core.feature.app.domain.repository

interface UserRepository {

    suspend fun fetchUserData()
}