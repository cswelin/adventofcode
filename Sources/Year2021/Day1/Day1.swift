import Foundation
import AOCCore

public struct Day1: Day {
    
    public func run() async throws -> (Int, Int) {
        let numbers = input().integers

        var count = 0
        var countP2 = 0
        for (index, number) in numbers.enumerated() {
            guard index > 0 else { continue }
            
            let previous = numbers[index-1]
            
            if number > previous {
                count += 1
            }
            
            if index+3 < numbers.count {
                let windowOne = numbers[index...index+2].compactMap({$0}).reduce(0, +)
                let windowTwo = numbers[index+1...index+3].compactMap({$0}).reduce(0, +)

                if windowTwo > windowOne {
                    countP2 += 1
                }
            }
        }

        return (count, countP2)

    }
}

