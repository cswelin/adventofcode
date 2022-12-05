import Foundation
import AOCCore
import RegexBuilder

public struct Day5: Day {
    
    public func run() async throws -> (String, String) {
        let regex = Regex {
            "move "
            Capture {
                OneOrMore(.digit)
            }
            " from "
            Capture {
                OneOrMore(.digit)
            }
            " to "
            Capture {
                OneOrMore(.digit)
            }
        }

        var partOneStacks: [[String]] = [
            ["T", "P", "Z", "C", "S", "L", "Q", "N"],
            ["L", "P", "T", "V", "H", "C", "G"],
            ["D", "C", "Z", "F"],
            ["G", "W", "T", "D", "L", "M", "V", "C"],
            ["P", "W", "C"],
            ["P", "F", "J", "D", "C", "T", "S", "Z"],
            ["V", "W", "G", "B", "D"],
            ["N", "J", "S", "Q", "H", "W"],
            ["R", "C", "Q", "F", "S", "L", "V"]
        ]

        var partTwoStacks = partOneStacks

        for line in input().lines {
            
            let output = try regex.wholeMatch(in: line)!.output
            guard let removeIndex = Int(output.2) else { continue }
            guard let toIndex = Int(output.3) else { continue }
            let toMove = Int(output.1)!
        
            var removed = partOneStacks[removeIndex-1].suffix(toMove)
            partOneStacks[toIndex-1].append(contentsOf: Array(removed).reversed())
            partOneStacks[removeIndex-1].removeLast(toMove)
            
            removed = partTwoStacks[removeIndex-1].suffix(toMove)
            partTwoStacks[toIndex-1].append(contentsOf: removed)
            partTwoStacks[removeIndex-1].removeLast(toMove)
        }
        
        return (
            partOneStacks.compactMap { $0.last }.reduce("", +),
            partTwoStacks.compactMap { $0.last }.reduce("", +)
        )
              
    }
}
