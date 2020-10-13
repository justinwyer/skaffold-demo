package skaffold.demo.spring.quote

import org.springframework.beans.factory.annotation.*
import org.springframework.jdbc.core.*
import org.springframework.web.bind.annotation.*
import reactor.core.publisher.*
import java.sql.*

@RestController
@RequestMapping("/quotes")
class QuoteController @Autowired constructor(val jdbcTemplate: JdbcTemplate) {
    @GetMapping("/random")
    fun random(): Mono<Quote> {
        return Mono.fromCallable {
            jdbcTemplate.query("SELECT id, message, author FROM quotes") { rs: ResultSet, _: Int ->
                Quote(rs.getInt("id"), rs.getString("message"), rs.getString("author"))
            }.random()
        }
    }
}