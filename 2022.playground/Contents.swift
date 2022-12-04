import Foundation

let solveable: [Solveable] = [
    DayOne(),
    DayTwo(),
    DayThree(),
    DayFour(),
]

solveable.forEach { $0.solve() }
