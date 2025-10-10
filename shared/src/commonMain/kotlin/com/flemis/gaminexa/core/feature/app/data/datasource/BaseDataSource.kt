package com.flemis.gaminexa.core.feature.app.data.datasource

abstract class BaseDataSource<E, M>(private val entityMapper: (E) -> M, private val modelMapper: (M) -> E) {

    protected suspend fun convertToModel(list: List<E>): List<M> {
        return list.map { entityMapper.invoke(it) }
    }

    protected suspend fun convertToEntity(list: List<M>): List<E> {
        return list.map { modelMapper.invoke(it) }
    }
}