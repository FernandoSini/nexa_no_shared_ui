package com.flemis.gaminexa

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform