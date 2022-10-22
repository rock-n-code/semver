//
//  PreRelease+IncrementTests.swift
//  SemVerTests
//
//  Created by Javier Cicchelli on 22/10/2022.
//  Copyright © 2022 Röck+Cöde. All rights reserved.
//

import XCTest

@testable import SemVer

final class PreReleaseIncrementTests: XCTestCase {

    // MARK: Properties
    
    var enumeration: PreRelease!
    var result: PreRelease!
    
    // MARK: Increment tests

    func test_withAlpha_hasNoVersion() async throws {
        // GIVEN
        enumeration = .alpha()
        
        // WHEN
        result = try await enumeration.increment()
        
        // THEN
        XCTAssertEqual(result, .alpha(version: 2))
    }
    
    func test_withAlpha_hasVersion() async throws {
        // GIVEN
        enumeration = .alpha(version: 1)
        
        // WHEN
        result = try await enumeration.increment()
        
        // THEN
        XCTAssertEqual(result, .alpha(version: 2))
    }
    
    func test_withBeta_hasNoVersion() async throws {
        // GIVEN
        enumeration = .beta()
        
        // WHEN
        result = try await enumeration.increment()
        
        // THEN
        XCTAssertEqual(result, .beta(version: 2))
    }
    
    func test_withBeta_hasVersion() async throws {
        // GIVEN
        enumeration = .beta(version: 1)
        
        // WHEN
        result = try await enumeration.increment()
        
        // THEN
        XCTAssertEqual(result, .beta(version: 2))
    }
    
    func test_withCandidate_hasNoVersion() async throws {
        // GIVEN
        enumeration = .candidate()
        
        // WHEN
        result = try await enumeration.increment()
        
        // THEN
        XCTAssertEqual(result, .candidate(version: 2))
    }
    
    func test_withCandidate_hasVersion() async throws {
        // GIVEN
        enumeration = .candidate(version: 1)
        
        // WHEN
        result = try await enumeration.increment()
        
        // THEN
        XCTAssertEqual(result, .candidate(version: 2))
    }
    
    func test_withCustom() async throws {
        // GIVEN
        enumeration = .custom(string: "Something goes here...")
        
        // WHEN & THEN
        do {
            _ = try await enumeration.increment()
        } catch IncrementError.preReleaseCannotIncrement {
            XCTAssertTrue(true)
        } catch {
            XCTAssertTrue(false)
        }
    }
    
}
