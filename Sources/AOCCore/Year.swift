//
//  Year.swift
//  
//
//  Created by Colin Swelin on 2022-12-05.
//

import Foundation

public protocol Year {
    
    static var days: [any Day] { get }
    
}

extension Year {

    public static func today() throws -> any Day {
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = TimeZone(identifier: "America/Toronto")!
        
        let dateComponents = calendar.dateComponents([.month, .day], from: Date())
        guard dateComponents.month == 12, let day = dateComponents.day else {
            throw InvalidDay()
        }
        
        return try self.day(day)
    }
    
    public static func day(_ number: Int) throws -> any Day {
        let idx = number - 1
        
        guard days.indices.contains(idx) else {
            throw InvalidDay()
            
        }
        
        return days[idx]
    }
}

struct InvalidDay: Error { }
