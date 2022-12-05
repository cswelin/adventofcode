import Foundation
import Advent

let solveable: [Solveable] = [
    DayOne(),
    DayTwo(),
    DayThree(),
    DayFour(),
    Day5(),
]

solveable.forEach { $0.solve() }

