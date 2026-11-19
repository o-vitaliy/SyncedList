plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services")
    id("com.google.firebase.crashlytics")
}

android {
    namespace = "ua.ovi.shared_shopping_list"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    defaultConfig {
        applicationId = "ua.ovi.shared_shopping_list"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    // The upload keystore isn't in the repo; without it, builds fall back to the debug key.
    val releaseKeystore = file("../keys/key.jks")

    signingConfigs {
        create("release") {
            storeFile = file("../keys/key.jks")
            storePassword = "8acw15zcrjgCSc1a"
            keyAlias = "alias"
            keyPassword = "asdq3WksF8LLirX6"
        }
    }

    buildTypes {
        val signing = signingConfigs.getByName(if (releaseKeystore.exists()) "release" else "debug")
        debug {
            signingConfig = signing
        }
        release {
            signingConfig = signing
        }
    }
}

kotlin {
    compilerOptions {
        jvmTarget = org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17
    }
}

flutter {
    source = "../.."
}
