import Foundation

public struct DayFour: Solveable {
    
    public init() {}
    
    public func solve() {
        let path = Bundle.main.path(forResource: "Day4", ofType: "txt")
        let rows = try! String(contentsOfFile: path!).components(separatedBy: "\n")

        var score = 0
        var score2 = 0
        for row in rows {
            let sections = row.components(separatedBy: ",")
            
            let listOne = sections[0].components(separatedBy: "-").map(Int.init)
            let rangeOne = Set(Array(listOne[0]!...listOne[1]!))
            
            let listTwo = sections[1].components(separatedBy: "-").map(Int.init)
            let rangeTwo = Set(Array(listTwo[0]!...listTwo[1]!))
            
            if rangeOne.isSuperset(of: rangeTwo) || rangeOne.isSubset(of: rangeTwo) {
                score += 1
            }
            
            if Set(rangeOne).intersection(rangeTwo).count > 0 {
                score2 += 1
            }
        }
        
        print("Day 4")
        print("Part One: ", score)
        print("Part Two: ", score2)
    }
}
