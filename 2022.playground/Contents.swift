import Foundation

let solveable: [Solveable] = [
    DayOne(),
    DayTwo(),
    DayThree(),
]

solveable.forEach { $0.solve() }
