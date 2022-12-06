//
//  Collection.swift
//  
//
//  Created by Colin Swelin on 2022-12-06.
//

public extension Collection where Element: Hashable {
    
    var allUnique: Bool {
        Set(self).count == self.count
    }
}
