import Foundation
import AOCCore

public struct Day1: Day {
    
    public func run() async throws -> (Int, Int) {
        let sorted = input().raw
            .components(separatedBy: "\n\n")
            .map { $0.components(separatedBy: "\n").compactMap(Int.init).reduce(0, +) }
            .sorted(by: >)

        return (sorted.first!, sorted.prefix(3).reduce(0, +))
    }
}
