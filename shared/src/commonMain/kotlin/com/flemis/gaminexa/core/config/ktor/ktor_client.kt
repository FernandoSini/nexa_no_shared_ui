package com.flemis.gaminexa.core.config.ktor

import com.flemis.gaminexa.getPlatform
import io.ktor.client.*
import io.ktor.client.plugins.*
import io.ktor.client.plugins.contentnegotiation.*
import io.ktor.client.plugins.logging.*
import io.ktor.client.plugins.observer.ResponseObserver
import io.ktor.client.request.header
import io.ktor.client.statement.request
import io.ktor.http.ContentType
import io.ktor.http.contentType
import io.ktor.serialization.kotlinx.json.*
import io.ktor.util.appendIfNameAbsent
import kotlinx.serialization.json.Json


object KtorClient {
    private val serializeJson = Json {
        prettyPrint = true
        isLenient = true
        ignoreUnknownKeys = true
    }


    private val httpClient = HttpClient() {
        install(Logging) {
            logger = Logger.DEFAULT
            level = LogLevel.HEADERS
        }
        install(ContentNegotiation) {
            json(serializeJson)
        }
        install(UserAgent) {
            agent = "Gaminexa /1.0 ${getPlatform().name}"
        }
        install(HttpRequestRetry) {
            retryOnServerErrors(maxRetries = 5)
            exponentialDelay()
            //adicionar parmetros extras no header
            modifyRequest {
                request.headers.append("x-retry-count", retryCount.toString())
            }
        }
        defaultRequest {
            headers.appendIfNameAbsent("x-custom-header", "my custom header value")
            contentType(ContentType.Application.Json)
        }
        HttpResponseValidator {
            validateResponse { response ->
                when (response.status.value) {
                    in 300..399 -> {
                        // Handle redirects if needed
                        throw RedirectResponseException(
                            response,
                            "Redirect error with status code ${response.status.value}"
                        )
                    }

                    in 400..499 -> {
                        // Handle client errors
                        throw ClientRequestException(response, "Client error with status code ${response.status.value}")
                    }

                    in 500..599 -> {
                        // Handle server errors
                        throw ServerResponseException(
                            response,
                            "Server error with status code ${response.status.value}"
                        )
                    }
                }
                if (response.status.value >= 600) {
                    throw ResponseException(response, "HTTP error with status code ${response.status.value}")
                }
            }
            handleResponseException { exception, _ ->
                throw exception
                println("Exception occurred: ${exception.message}")

            }
        }
        ResponseObserver { response ->
            val logMessage =
                "HTTP status: ${response.status.value} for ${response.request.url} " +
                        "on ${getPlatform().name} " +
                        "with time ${response.responseTime.timestamp - response.requestTime.timestamp}ms " +
                        "protocol: ${response.version}"

            print("logging requests:" + logMessage)

            /*    val timeDifference = response.responseTime.timestamp - response.requestTime.timestamp
            val protocolVersion = response.version*/

        }


    }

}