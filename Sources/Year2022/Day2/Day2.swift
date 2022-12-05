import Foundation
import AOCCore

public struct Day2: Day {
    
    public func part1() async throws -> Int {
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
        
        return input().lines.reduce(0, { partialResult, round in
            partialResult + (partOneScores[round] ?? 0)
        })
    }
    
    public func part2() async throws -> Int {
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

        return input().lines.reduce(0, { partialResult, round in
            partialResult + (partTwoScores[round] ?? 0)
        })
    }
}
