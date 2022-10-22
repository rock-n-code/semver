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
    
    var property: BuildMetadata!
    var result: BuildMetadata!

    // MARK: Increment tests
    
    func test_withBuildNumber() async throws {
        // GIVEN
        property = .buildNumber(0)
        
        // WHEN
        result = try await property.increment()
        
        // THEN
        XCTAssertEqual(result, .buildNumber(1))
    }
    
    func test_withCustom() async throws {
        // GIVEN
        property = .custom("Something goes here...")
        
        // WHEN & THEN
        do {
            _ = try await property.increment()
        } catch IncrementError.buildMetadataCannotIncrement {
            XCTAssertTrue(true)
        } catch {
            XCTAssertTrue(false)
        }
    }

}
