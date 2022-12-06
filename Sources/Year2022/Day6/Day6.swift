//
//  Day6.swift
//  
//
//  Created by Colin Swelin on 2022-12-06.
//

import Foundation
import Algorithms
import AOCCore

public struct Day6: Day {
    
    public func part1() async throws -> Int {
        signalPosition(windowSize: 4)
    }
    
    public func part2() async throws -> Int {
        signalPosition(windowSize: 14)
    }
    
    // Approach using the Algorithms library
    public func part1_algorithms() async throws -> Int {
        input().characters
                .windows(ofCount: 4)
                .first(where: \.allUnique)!
                .endIndex
    }
    
    public func part2_algorithms() async throws -> Int {
        input().characters
                .windows(ofCount: 14)
                .first(where: \.allUnique)!
                .endIndex
    }
}

extension Day6 {
    
    func signalPosition(windowSize: Int) -> Int {
        let characters = input().characters
        var firstMakerIndex: Int = 0
        
        for index in 0...characters.count - (windowSize - 1) {
            let chunk = characters[index...index + (windowSize - 1)]
            if Set(chunk).count == windowSize {
                firstMakerIndex = index + windowSize
                break
            }
        }
        
        return firstMakerIndex
    }
}
