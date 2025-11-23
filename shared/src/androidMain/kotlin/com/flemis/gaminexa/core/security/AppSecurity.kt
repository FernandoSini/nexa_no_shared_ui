package com.flemis.gaminexa.core.security

import android.security.keystore.KeyGenParameterSpec
import android.security.keystore.KeyProperties
import android.util.Base64
import java.security.KeyStore
import javax.crypto.Cipher
import javax.crypto.KeyGenerator
import javax.crypto.SecretKey
import javax.crypto.spec.IvParameterSpec

class AppSecurity {

    val keyStore = KeyStore.getInstance("AndroidKeyStore").apply {
        load(null)
    }
    private var ivParameter: ByteArray? = null

    private fun generateKey(): SecretKey {
        val keyGenerator: KeyGenerator = KeyGenerator
            .getInstance(
                KeyProperties.KEY_ALGORITHM_AES,
                "AndroidKeyStore"
            )
        val keyGeneratorParameterSpec =
            KeyGenParameterSpec.Builder(
                "ALIAS",
                KeyProperties.PURPOSE_ENCRYPT or KeyProperties.PURPOSE_DECRYPT
            ).run {
                setBlockModes(KeyProperties.BLOCK_MODE_CBC)
                setEncryptionPaddings(KeyProperties.ENCRYPTION_PADDING_PKCS7)
                setUserAuthenticationRequired(false)
                setRandomizedEncryptionRequired(true)
                build()
            }

        keyGenerator.init(keyGeneratorParameterSpec)
        return keyGenerator.generateKey()
    }

    private fun getKey(): SecretKey {
        val existingKey: SecretKey = keyStore.getEntry("ALIAS", null) as? SecretKey ?: generateKey()
        return existingKey
    }

    private fun encrypt(data: String): String {
        val byteArray: ByteArray = Base64.decode(data, Base64.DEFAULT)
        val cipher = Cipher.getInstance("AES/CBC/PKCS7Padding").apply {
            init(Cipher.ENCRYPT_MODE, getKey())
        }
        ivParameter = cipher.iv
        val cipherData = cipher.doFinal(byteArray)
        return Base64.encodeToString(cipherData, Base64.DEFAULT)
    }

    private fun decrypt(data: String): String {
        val byteArray: ByteArray = Base64.decode(data, Base64.DEFAULT)
        val cipher = Cipher.getInstance("AES/CBC/PKCS7Padding").apply {
            init(Cipher.DECRYPT_MODE, getKey(), IvParameterSpec(ivParameter))
        }
        val encryptedData = cipher.doFinal(byteArray)
        return Base64.encodeToString(encryptedData, Base64.DEFAULT)
    }
}