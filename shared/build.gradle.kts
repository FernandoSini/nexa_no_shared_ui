import org.jetbrains.kotlin.gradle.ExperimentalKotlinGradlePluginApi
import org.jetbrains.kotlin.gradle.dsl.JvmTarget
import org.jetbrains.kotlin.gradle.plugin.KotlinSourceSetTree

plugins {
    alias(libs.plugins.kotlinMultiplatform)
    alias(libs.plugins.androidLibrary)
    alias(libs.plugins.room)
    alias(libs.plugins.kotlinx.serialization)
    id("com.google.devtools.ksp")
    id("co.touchlab.skie") version "0.10.4"
}
room {
    schemaDirectory("$projectDir/schemas")
}


kotlin {
    targets.configureEach {
        compilations.configureEach {
            compileTaskProvider.get().compilerOptions {
                freeCompilerArgs.add("-Xexpect-actual-classes")
            }
        }
    }
    androidTarget {
        compilerOptions {
            jvmTarget.set(JvmTarget.JVM_17)
        }
        @OptIn(ExperimentalKotlinGradlePluginApi::class) instrumentedTestVariant.sourceSetTree.set(
            KotlinSourceSetTree.test
        )
        @OptIn(ExperimentalKotlinGradlePluginApi::class) instrumentedTestVariant {
            dependencies {
                implementation(libs.androidx.core.ktx)
                implementation(libs.androidx.ui.test.junit4)
                implementation(libs.androidx.test.junit)
                debugImplementation(libs.androidx.test.manifest)
            }
        }
    }
    tasks.withType<Test> {
        if (name == "compileDebugAndroidTestKotlinAndroid") {
            enabled = false

        }
        useJUnitPlatform()
        enabled = true

        testLogging {
            events("passed", "skipped", "failed")
        }
    }


    listOf(
        iosX64(),
        iosArm64(),
        iosSimulatorArm64()
    ).forEach { iosTarget ->
        iosTarget.binaries.framework {
            binaryOption("bundleId", "br.com.flemis.gaminexa.iphone.Shared")
            binaryOption("bundleVersion", "1")
            binaryOption("bundleShortVersionString", "1.0.0")
            linkerOpts.add("-lsqlite3")
            baseName = "Shared"
            isStatic = true
        }
    }

    sourceSets {

        commonMain.dependencies {
            implementation(libs.koin.core)
            implementation(libs.koin.compose)
            implementation(libs.koin.compose.viewmodel)
            implementation(project.dependencies.platform(libs.koin.bom))
            implementation(libs.ktor.client.core)
            implementation(libs.ktor.client.websockets)
            implementation(libs.ktor.client.content.negotiation)
            implementation(libs.ktor.serialization.kotlinx.json)
            implementation(libs.ktor.client.logging)
            implementation(libs.kotlinx.coroutines.core)
            implementation(libs.kotlinx.datetime)
            implementation(libs.room.runtime)
            implementation(libs.sqlite.bundled)
            // put your Multiplatform dependencies here
        }
        iosMain.dependencies {
            implementation(libs.ktor.client.darwin)
        }
        commonTest.dependencies {
            implementation(libs.kotlin.test)
        }
    }
}

android {
    namespace = "com.flemis.gaminexa.shared"
    compileSdk = libs.versions.android.compileSdk.get().toInt()
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
    defaultConfig {
        minSdk = libs.versions.android.minSdk.get().toInt()
    }
}

dependencies {
    implementation("io.ktor:ktor-client-logging:3.2.3")
    testImplementation(libs.koin.test)
// Koin for JUnit 4
    testImplementation(libs.koin.test.junit4)
// Koin for JUnit 5
    testImplementation(libs.koin.test.junit5)
    debugImplementation(libs.androidx.test.manifest)
    debugImplementation(libs.androidx.ui.test.junit4)
    androidTestImplementation(libs.androidx.espresso.core)
    androidTestImplementation(libs.androidx.uiautomator)
    androidTestImplementation(libs.androidx.espresso.intents)
    androidTestImplementation(libs.androidx.rules)


    listOf(
        "kspAndroid", "kspIosSimulatorArm64", "kspIosX64", "kspIosArm64",// "kspJvm",
    ).forEach {
        add(it, libs.room.compiler)

    }
}