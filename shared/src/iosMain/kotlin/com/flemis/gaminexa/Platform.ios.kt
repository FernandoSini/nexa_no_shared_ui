package com.flemis.gaminexa

import platform.UIKit.UIDevice
import platform.posix.exit

class IOSPlatform : Platform {
    override val name: String = UIDevice.currentDevice.systemName() + " " + UIDevice.currentDevice.systemVersion
}

actual fun getPlatform(): Platform = IOSPlatform()


fun isDeviceTempered(): Boolean {
    val paths = arrayOf(
        "/Applications/Cydia.app",
        "/Library/MobileSubstrate/MobileSubstrate.dylib",
        "/private/var/lib/apt",
        "/bin/bash",
        "/usr/sbin/sshd",
        "/etc/apt",
        )
    for (path in paths) {
        val file = platform.Foundation.NSFileManager.defaultManager.fileExistsAtPath(path)
        if (file) {
            return true
        }
    }
    return checkForSuspiciousPermissions()
}

fun checkForSuspiciousPermissions(): Boolean {
    //verifica se a permissao escrita foi concedida a diretorios do sistema
    return try {
        val file = platform.Foundation.NSFileManager.defaultManager

        val isDir = file.fileExistsAtPath("/private/var/mobile/Containers/Data/Application")
        if (isDir) {
            false
        } else {
            true
        }
    } catch (e: Exception) {
        false
    }

}