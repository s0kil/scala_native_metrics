//> using scala 3.4.2
//> using dep "ch.epfl.lamp::gears::0.2.0"
//> using nativeVersion "0.5.3"

// https://github.com/lampepfl/gears
import gears.async.*
import gears.async.default.given
import scala.annotation.tailrec

def factorial(n: BigInt): BigInt = {
    @tailrec
    def loop(x: BigInt, accumulator: BigInt): BigInt = {
        if (x <= 1) accumulator
        else loop(x - 1, accumulator * x)
    }

    loop(n, 1)
}

@main def main() =
    Async.blocking:
        val workers = Seq.fill(10_000) {
            Future:
                factorial(1000)
        }

        val result = workers.awaitAll
        assert(result.length == 10_000)
