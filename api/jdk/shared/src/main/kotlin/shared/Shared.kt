package shared

import kotlin.random.*

fun rollDie(die: Int, sides: Int) = (1..die).map { Random.nextInt(1..sides) }
