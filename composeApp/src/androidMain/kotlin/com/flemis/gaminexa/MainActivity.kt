package com.flemis.gaminexa

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.runtime.Composable
import androidx.compose.ui.tooling.preview.Preview
import com.flemis.gaminexa.core.config.di.androidModule
import com.flemis.gaminexa.core.config.di.initKoin
import org.koin.android.ext.koin.androidContext
import org.koin.core.context.loadKoinModules
import org.koin.core.context.unloadKoinModules

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        enableEdgeToEdge()
        super.onCreate(savedInstanceState)

        loadKoinModules(androidModule(this))
        initKoin {
            androidContext(this@MainActivity)
        }
        setContent {
            App()
        }
    }

    override fun onDestroy() {
        super.onDestroy()
        unloadKoinModules(androidModule(this@MainActivity))
    }

}

@Preview
@Composable
fun AppAndroidPreview() {
    App()
}