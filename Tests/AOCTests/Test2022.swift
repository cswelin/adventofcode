//
//  Test2022.swift
//  
//
//  Created by Colin Swelin on 2022-12-05.
//

import XCTest
@testable import Year2022

final class Test2022: XCTestCase {

    func testDay1() async throws {
        let (p1, p2) = try await Day1().run()

        XCTAssertEqual(p1, 72718)
        XCTAssertEqual(p2, 213089)
    }
    
    func testDay2() async throws {
        let (p1, p2) = try await Day2().run()

        XCTAssertEqual(p1, 12645)
        XCTAssertEqual(p2, 11756)
    }
    
    func testDay3() async throws {
        let (p1, p2) = try await Day3().run()

        XCTAssertEqual(p1, 7793)
        XCTAssertEqual(p2, 2499)
    }
    
    func testDay4() async throws {
        let (p1, p2) = try await Day4().run()

        XCTAssertEqual(p1, 450)
        XCTAssertEqual(p2, 837)
    }
    
    func testDay5() async throws {
        let (p1, p2) = try await Day5().run()

        XCTAssertEqual(p1, "SVFDLGLWV")
        XCTAssertEqual(p2, "DCVTCVPCL")
    }
    
    func testDay6() async throws {
        let (p1, p2) = try await Day6().run()

        XCTAssertEqual(p1, 1598)
        XCTAssertEqual(p2, 2414)
    }

}
