package com.flemis.gaminexa.core.feature.app.data.datasource.remote

import com.flemis.gaminexa.core.feature.app.data.datasource.BaseDataSource
import com.flemis.gaminexa.core.feature.app.data.models.UserModel
import com.flemis.gaminexa.core.feature.app.domain.entities.UserEntity
import org.koin.core.component.KoinComponent

class RemoteDataSourceImpl(entityMapper: (UserEntity) -> UserModel, modelMapper: (UserModel) -> UserEntity) :
    BaseDataSource<UserEntity, UserModel>(entityMapper, modelMapper), RemoteDataSource, KoinComponent {
        
}