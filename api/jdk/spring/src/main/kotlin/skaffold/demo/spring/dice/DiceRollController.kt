package skaffold.demo.spring.dice

import org.springframework.web.bind.annotation.*
import shared.*

@RestController
@RequestMapping("/dice/roll")
class DiceRollController {
    @GetMapping("/{die}/d/{sides}")
    fun roll(@PathVariable die: Int, @PathVariable sides: Int) = rollDie(die, sides)
}