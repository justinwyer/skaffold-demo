package skaffold.demo.spring

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class SkaffoldDemoApplication

fun main(args: Array<String>) {
	runApplication<SkaffoldDemoApplication>(*args)
}
