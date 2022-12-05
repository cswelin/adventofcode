import Foundation
import Advent

public struct DayOne: Solveable {
    
    public init() {}
    
    public func solve() {
        let path = Bundle.main.path(forResource: "Day1", ofType: "txt")
        
        let sorted = try! String(contentsOfFile: path!)
            .components(separatedBy: "\n\n")
            .map { $0.components(separatedBy: "\n").compactMap(Int.init).reduce(0, +) }
            .sorted(by: >)

        print("Day One:")
        print("Highest elf: ", sorted.first!)
        print("Top Three total: ",sorted.prefix(3).reduce(0, +), "\n")
        
        
    }
}
