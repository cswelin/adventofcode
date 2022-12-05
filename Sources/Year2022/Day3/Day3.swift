import Foundation
import AOCCore

public struct Day3: Day {
    
    public func run() async throws -> (Int, Int) {
        func scoreValue(_ intValue: Int) -> Int {
            if intValue > 96 {
                return (intValue - 96)
            } else {
                return (intValue - 38)
            }
        }
        
        var items = [String]()
        var scorePartTwo = 0
        var score = 0
        for rucksack in input().lines {
            
            let first = Array(rucksack)
            
            
            let middle = first.count / 2
            let firstHalf = Set(first[..<middle])
            let secondHalf = Set(first[middle...])
            let common = firstHalf.intersection(secondHalf).first
            
            score += scoreValue(Int(common?.asciiValue ?? 38))
            
            
            if items.count < 3 {
                items.append(rucksack)
            }
            
            if items.count > 2 {
                let common = Set(items[0]).intersection(Set(items[1])).intersection(Set(items[2])).first
                items.removeAll()
                scorePartTwo += scoreValue(Int(common?.asciiValue ?? 38))
            }
        }
        
        print("Day Three:")
        print("Part One: ", score)
        print("Part Two", scorePartTwo)
        print("\n")
        
        return (score, scorePartTwo)
    }
}
