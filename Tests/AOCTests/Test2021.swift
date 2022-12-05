//
//  Test2021.swift
//  
//
//  Created by Colin Swelin on 2022-12-05.
//

import XCTest

@testable import Year2021

final class Test2021: XCTestCase {

    func testDay1() async throws {
        let (p1, p2) = try await Day1().run()

        XCTAssertEqual(p1, 1696)
        XCTAssertEqual(p2, 1737)
    }


}

