plugins {
    kotlin("jvm") version "1.3.72" apply false
    kotlin("plugin.spring") version "1.3.72" apply false
    kotlin("plugin.allopen") version "1.3.72" apply false
    id("com.google.cloud.tools.jib") version "2.4.0" apply false
}

subprojects {
    version = "1.0"
}