import Foundation
import Advent

public struct DayOne: Solveable {
    
    public init() { }
    
    public func solve() {
       
        let path = Bundle.main.path(forResource: "Day1", ofType: "txt")
        let numbers = try! String(contentsOfFile: path!).components(separatedBy: "\n").map(Int.init)

        var count = 0
        var countP2 = 0
        for (index, number) in numbers.enumerated() {
            if let number, index > 0, let previous = numbers[index-1], number > previous {
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

        print("Day one:")
        print("Part One: ", count)
        print("Part Two: ", countP2, "\n")

    }
}

