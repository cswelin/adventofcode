import Foundation
import Advent
import Algorithms

let solveable: [Solveable] = [
    DayOne(),
    DayTwo(),
    DayThree(),
    DayFour(),
]

solveable.forEach { $0.solve() }
