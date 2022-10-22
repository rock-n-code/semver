//
//  BuildMetadata+IncrementTests.swift
//  SemVerTests
//
//  Created by Javier Cicchelli on 22/10/2022.
//  Copyright © 2022 Röck+Cöde. All rights reserved.
//

import XCTest

@testable import SemVer

final class BuildMetadataIncrementTests: XCTestCase {

    // MARK: Properties
    
    var enumeration: BuildMetadata!
    var result: BuildMetadata!

    // MARK: Increment tests
    
    func test_withBuildNumber() async throws {
        // GIVEN
        enumeration = .buildNumber(version: 0)
        
        // WHEN
        result = try await enumeration.increment()
        
        // THEN
        XCTAssertEqual(result, .buildNumber(version: 1))
    }
    
    func test_withCustom() async throws {
        // GIVEN
        enumeration = .custom(string: "Something goes here...")
        
        // WHEN & THEN
        do {
            _ = try await enumeration.increment()
        } catch IncrementError.buildMetadataCannotIncrement {
            XCTAssertTrue(true)
        } catch {
            XCTAssertTrue(false)
        }
    }

}
