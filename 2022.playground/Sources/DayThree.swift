import Foundation

public struct DayThree: Solveable {
    
    public init() { }
    
    public func solve() {
        
        let path = Bundle.main.path(forResource: "Day3", ofType: "input")
        let rucksacks = try! String(contentsOfFile: path!).components(separatedBy: "\n")

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
        for rucksack in rucksacks {

            let first = Array(rucksack)
            let firstHalf = first[0...(first.count / 2) - 1]
            
            let secondHalf = first[(first.count / 2)...first.count-1]
            let common = Set(firstHalf).intersection(Set(secondHalf)).first
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
    }
}
