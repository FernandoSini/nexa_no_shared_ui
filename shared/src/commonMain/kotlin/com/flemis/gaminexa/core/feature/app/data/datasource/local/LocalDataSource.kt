package com.flemis.gaminexa.core.feature.app.data.datasource.local

import com.flemis.gaminexa.core.feature.app.data.models.UserModel

interface LocalDataSource {

    suspend fun getUser(): UserModel
}