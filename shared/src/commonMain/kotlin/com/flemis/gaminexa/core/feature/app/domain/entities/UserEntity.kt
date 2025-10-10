package com.flemis.gaminexa.core.feature.app.domain.entities

import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.serialization.Serializable

@Serializable
@OptIn(ExperimentalCoroutinesApi::class)
class UserEntity(
    val id: String = "",
    val name: String = "",
    val username: String = "",
    val email: String = "",
    val avatarUrl: String = "",
    val age: String = "",
)