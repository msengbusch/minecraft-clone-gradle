plugins {
    id("engine-default")
}

repositories {
    maven("https://jitpack.io")
}

dependencies {
    api(libs.tinylog.api)

    implementation(libs.tinylog.impl)
    implementation(libs.tinylog.modern)
}