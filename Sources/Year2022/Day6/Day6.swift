//
//  Day6.swift
//  
//
//  Created by Colin Swelin on 2022-12-06.
//

import Foundation


import Foundation
import AOCCore
import RegexBuilder

public struct Day6: Day {
    
    public func part1() async throws -> Int {
        signalPosition(chunkSize: 4)
        
    }
    
    public func part2() async throws -> Int {
        signalPosition(chunkSize: 14)
    }
    
    func signalPosition(chunkSize: Int) -> Int {
        let line = Array(input().raw)
        var firstMakerIndex: Int = 0
        
        for index in 0...line.count - (chunkSize - 1) {
            let chunk = line[index...index + (chunkSize - 1)]
            if Set(chunk).count == chunkSize {
                firstMakerIndex = index + chunkSize
                break
            }
        }
        
        return firstMakerIndex
    }
    
    
}
