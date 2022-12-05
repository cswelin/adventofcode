//
//  File.swift
//  
//
//  Created by Colin Swelin on 2022-12-05.
//

import Foundation

public protocol Day {
    associatedtype Part1: CustomStringConvertible = String
    associatedtype Part2: CustomStringConvertible = String

    func part1() async throws -> Part1
    func part2() async throws -> Part2
    func run() async throws -> (Part1, Part2)
}

extension Day {
    public static var rawInput: String? { nil }
    
    public func input(_ file: StaticString = #file) -> Input {
        
        let fileName = file.description.replacingOccurrences(of: "swift", with: "txt")
        
        return Input(path: fileName)
    }
    
    public func part1() async throws -> Part1 {
        fatalError("Implement \(#function)")
    }
    
    public func part2() async throws -> Part2 {
        fatalError("Implement \(#function)")
    }
    
    public func run() async throws -> (Part1, Part2) {
        let p1 = try await part1()
        let p2 = try await part2()
        return (p1, p2)
    }
    
}
