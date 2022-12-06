//
//  Input.swift
//  
//
//  Created by Colin Swelin on 2022-12-04.
//

import Foundation

public struct Input {

    public let raw: String
    
}

extension Input {
    public var lines: [String] { raw.trimmingCharacters(in: .newlines).components(separatedBy: .newlines) }
    public var integers: [Int] { lines.map { Int($0)! } }
    public var characters: Array<Character> { Array(raw) }
}

extension Input {

    public init(path: String) {

        struct InputError: Error {}

        guard let string = try? String(contentsOfFile: path) else {
            raw = ""
            return
        }

        raw = string
    }
}
