package com.flemis.gaminexa.core.feature.app.data.datasource.local

import com.flemis.gaminexa.core.feature.app.data.datasource.BaseDataSource
import com.flemis.gaminexa.core.feature.app.data.models.UserModel
import com.flemis.gaminexa.core.feature.app.domain.entities.UserEntity
import org.koin.core.component.KoinComponent

class LocalDataSourceImpl(entityMapper: (UserEntity) -> UserModel, modelMapper: (UserModel) -> UserEntity) :
    BaseDataSource<UserEntity, UserModel>(entityMapper, modelMapper), LocalDataSource, KoinComponent {

    override suspend fun getUser(): UserModel {
        TODO("Not yet implemented")
    }


}