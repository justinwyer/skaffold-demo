package com.example
import io.micronaut.http.annotation.*
import shared.*

@Controller("/dice/roll")
class DiceRollController {

    @Get("/{die}/d/{sides}")
    fun roll(die: Int, sides: Int): List<Int> = rollDie(die, sides)
}