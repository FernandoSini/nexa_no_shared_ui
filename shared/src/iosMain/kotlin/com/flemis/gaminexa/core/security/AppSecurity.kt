package com.flemis.gaminexa.core.security

import com.flemis.gaminexa.core.feature.app.domain.entities.UserEntity
import io.ktor.client.request.invoke
import kotlinx.cinterop.BetaInteropApi
import kotlinx.cinterop.CPointer
import kotlinx.cinterop.CValuesRef
import kotlinx.cinterop.ExperimentalForeignApi
import kotlinx.cinterop.alloc
import kotlinx.cinterop.invoke
import kotlinx.cinterop.memScoped
import kotlinx.cinterop.nativeHeap
import kotlinx.cinterop.nativeHeap.alloc
import kotlinx.cinterop.objcPtr
import kotlinx.cinterop.ptr
import kotlinx.cinterop.reinterpret
import kotlinx.cinterop.value
import platform.CoreFoundation.CFAllocatorRef
import platform.CoreFoundation.CFAllocatorRefVar
import platform.CoreFoundation.CFDictionaryAddValue
import platform.CoreFoundation.CFDictionaryCreateMutable
import platform.CoreFoundation.CFDictionaryGetValue
import platform.CoreFoundation.CFDictionaryRef
import platform.CoreFoundation.CFStringRef
import platform.CoreFoundation.CFStringRefVar
import platform.CoreFoundation.CFTypeRefVar
import platform.CoreFoundation.kCFAllocatorDefault
import platform.Foundation.CFBridgingRelease
import platform.Foundation.CFBridgingRetain
import platform.Foundation.NSData
import platform.Foundation.NSMutableDictionary
import platform.Foundation.NSString
import platform.Foundation.NSUTF8StringEncoding
import platform.Foundation.base64Encoding
import platform.Foundation.create
import platform.Foundation.data
import platform.Foundation.dataUsingEncoding
import platform.Foundation.dataWithData
import platform.Foundation.setValue
import platform.Security.SecItemAdd
import platform.Security.errSecSuccess
import platform.Security.kSecAttrAccount
import platform.Security.kSecClass
import platform.Security.kSecClassGenericPassword
import platform.Security.kSecClassKey
import platform.Security.kSecValueData
import platform.darwin.nil
import platform.darwin.noErr

class AppSecurity {

    @OptIn(ExperimentalForeignApi::class, BetaInteropApi::class)
    fun teste2(userEntity: UserEntity) {
        memScoped {

            val attributes = CFDictionaryCreateMutable(
                allocator = kCFAllocatorDefault,
                capacity = 5,
                keyCallBacks = null,
                valueCallBacks = null
            )
            val accountStr = NSString.create("username")
            CFDictionaryAddValue(attributes, kSecAttrAccount, CFBridgingRetain(accountStr))
            val valueData = NSString.create(userEntity.name).dataUsingEncoding(NSUTF8StringEncoding)
            if (valueData != null) CFDictionaryAddValue(attributes, kSecValueData, CFBridgingRetain(valueData))

            CFDictionaryAddValue(attributes, kSecClassKey, kSecClassGenericPassword)
            //CFDictionaryAddValue(attributes, kSecAttrAccount, CFBridgingRetain(NSData.create("username")))

            val raw1 = CFDictionaryGetValue(attributes, kSecValueData)
            val bridged = CFBridgingRelease(raw1)

            val ns = (bridged as? NSData)


            val text = ns?.let { it -> NSString.create(it, NSUTF8StringEncoding) }

            print("fefe ${text}")


            //  val status = SecItemAdd(attributes as CFDictionaryRef, null)
            val result = nativeHeap.alloc<CFTypeRefVar>()
            print("fefe ${SecItemAdd(attributes, null)}")
            if (SecItemAdd(attributes, result.ptr) == errSecSuccess) {
                print("cu")
                print(CFDictionaryGetValue(theDict = attributes, key = kSecValueData)?.rawValue)

                val raw = CFDictionaryGetValue(attributes, kSecValueData)
                val resultStr = CFBridgingRelease(raw) as? NSString


            }
        }
    }

    @OptIn(ExperimentalForeignApi::class, BetaInteropApi::class)
    fun teste(userEntity: UserEntity) {
        memScoped {
            val attributes = CFDictionaryCreateMutable(
                allocator = kCFAllocatorDefault,
                capacity = 5,
                keyCallBacks = null,
                valueCallBacks = null
            )
            val accountStr = NSString.create("username")
            val stringCF = nativeHeap.alloc<CFStringRefVar>()
            stringCF.value = kSecAttrAccount?.reinterpret<CFStringRefVar>() as CFStringRef?
            CFDictionaryAddValue(attributes, stringCF.value, CFBridgingRetain(accountStr))
            val valueData = NSString.create(userEntity.name).dataUsingEncoding(NSUTF8StringEncoding)
            CFDictionaryAddValue(attributes, stringCF.value, CFBridgingRetain(valueData))
            CFDictionaryAddValue(attributes, stringCF.value, kSecClassGenericPassword)

            val result = nativeHeap.alloc<CFTypeRefVar>()
            print("fefe ${result.value}")
            print("fefe ${SecItemAdd(attributes, result.ptr)}")
        }

    }


}