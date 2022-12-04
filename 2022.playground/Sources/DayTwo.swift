import Foundation

public struct DayTwo: Solveable {
    
    public init() {}
    
    public func solve() {
        let path = Bundle.main.path(forResource: "Day2", ofType: "input")
        let rounds = try! String(contentsOfFile: path!).components(separatedBy: "\n")

        let partOneScores = [
            "A X": 4,
            "A Y": 8,
            "A Z": 3,
            
            "B X": 1,
            "B Y": 5,
            "B Z": 9,
            
            "C X": 7,
            "C Y": 2,
            "C Z": 6
        ]

        let partTwoScores = [
            "A X": 3,
            "A Y": 4,
            "A Z": 8,
            
            "B X": 1,
            "B Y": 5,
            "B Z": 9,
            
            "C X": 2,
            "C Y": 6,
            "C Z": 7
        ]

        print("Day Two:")
        print("Part one", rounds.reduce(0, { partialResult, round in
            partialResult + (partOneScores[round] ?? 0)
        }))

        print("Part two", rounds.reduce(0, { partialResult, round in
            partialResult + (partTwoScores[round] ?? 0)
        }))
        print("\n\n")

    }
}
