/*
 * This Kotlin source file was generated by the Gradle 'init' task.
 */
package shared

import kotlin.test.Test
import kotlin.test.assertTrue

class LibraryTest {
    @Test fun testSomeLibraryMethod() {
        val classUnderTest = Shared()
        assertTrue(classUnderTest.someLibraryMethod(), "someLibraryMethod should return 'true'")
    }
}