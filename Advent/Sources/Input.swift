//
//  Input.swift
//  
//
//  Created by Colin Swelin on 2022-12-04.
//

import Foundation

public struct Input {

    public let lines: [String]
}


extension Input {
    public var integers: [Int] { lines.map { Int($0)! } }
}

extension Input {

    public init(path: String) throws {

        struct InputError: Error {}

        guard let string = try? String(contentsOfFile: path) else { throw InputError() }

        lines = string
            .trimmingCharacters(in: .newlines)
            .components(separatedBy: .newlines)
    }
}

extension String {
    
    public func input() throws -> Input {
        try Input(path: self)
    }
}


