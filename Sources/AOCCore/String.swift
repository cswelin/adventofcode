//
//  File.swift
//  
//
//  Created by Colin Swelin on 2022-12-07.
//

import Foundation

extension String {
    public func dropPrefix(_ prefix: String) -> String {
        guard self.hasPrefix(prefix) else { return self }
        return String(self.dropFirst(prefix.count))
    }
}
