import Foundation
import AOCCore

public struct Day4: Day {
    
    public func run() async throws -> (Int, Int) {
        var score = 0
        var score2 = 0
        
        for row in input().lines {
            let sections = row.components(separatedBy: ",")
            
            let listOne = sections[0].components(separatedBy: "-").map(Int.init)
            let rangeOne = Set(Array(listOne[0]!...listOne[1]!))
            
            let listTwo = sections[1].components(separatedBy: "-").map(Int.init)
            let rangeTwo = Set(Array(listTwo[0]!...listTwo[1]!))
            
            if rangeOne.isSuperset(of: rangeTwo) || rangeOne.isSubset(of: rangeTwo) {
                score += 1
            }
            
            if rangeOne.intersection(rangeTwo).count > 0 {
                score2 += 1
            }
        }
        
        return (score, score2)
    }
}
