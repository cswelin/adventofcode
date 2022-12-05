import Foundation
import Advent
import RegexBuilder

public struct Day5: Solveable {
    
    public init() { }
    
    public func solve() {
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

        var stacks: [[String]] = [
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

        var stack2 = stacks

        do {
            let input = try Bundle.main.path(forResource: "Day5", ofType: "txt")!.input()
            for line in input.lines {
                guard !line.isEmpty else { continue }
                
                let output = try regex.wholeMatch(in: line)!.output
                guard let removeIndex = Int(output.2) else { continue }
                guard let toIndex = Int(output.3) else { continue }
                let toMove = Int(output.1)!
                
                var partTwoArray = [String]()
                
                for _ in 1...toMove {
                    guard let last = stacks[removeIndex-1].popLast() else { continue }
                    
                    stacks[toIndex-1].append(last)
                    
                    guard let last = stack2[removeIndex-1].popLast() else { continue }
                    partTwoArray.append(last)
                }
                
                stack2[toIndex-1].append(contentsOf: partTwoArray.reversed())
                partTwoArray.removeAll()
            }
            
            var output: String = ""
            stacks.forEach {
                output += $0.last ?? ""
            }
            
            print("Day 5")
            print("Part 1: ",output)
            
            var output2: String = ""
            stack2.forEach {
                output2 += $0.last ?? ""
            }
            
            print("Part 2: ", output2)
        } catch {
            
        }
    }
}
