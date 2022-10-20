//
//  PreRelease+RawValueTests.swift
//  SemVerTests
//
//  Created by Javier Cicchelli on 17/10/2022.
//  Copyright © 2022 Röck+Cöde. All rights reserved.
//

import XCTest

@testable import SemVer

final class PreReleaseRawValueTests: XCTestCase {
    
    // MARK: Properties
    
    var preRelease: PreRelease!
    var result: String!
    
    // MARK: Raw value tests
    
    func test_whenAlpha() async throws {
        // GIVEN
        preRelease = .alpha()
        
        // WHEN
        result = preRelease.rawValue
        
        // THEN
        XCTAssertEqual(result, .PreReleases.alpha)
    }
    
    func test_whenAlpha_withVersion() async throws {
        // GIVEN
        preRelease = .alpha(version: 0)
        
        // WHEN
        result = preRelease.rawValue
        
        // THEN
        XCTAssertEqual(result, .PreReleases.alpha + ".0")
    }
    
    func test_whenBeta() async throws {
        // GIVEN
        preRelease = .beta()
        
        // WHEN
        result = preRelease.rawValue
        
        // THEN
        XCTAssertEqual(result, .PreReleases.beta)
    }
    
    func test_whenBeta_withVersion() async throws {
        // GIVEN
        preRelease = .beta(version: 0)
        
        // WHEN
        result = preRelease.rawValue
        
        // THEN
        XCTAssertEqual(result, .PreReleases.beta + ".0")
    }
    
    func test_whenReleaseCandidate() async throws {
        // GIVEN
        preRelease = .candidate()
        
        // WHEN
        result = preRelease.rawValue
        
        // THEN
        XCTAssertEqual(result, .PreReleases.candidate)
    }
    
    func test_whenReleaseCandidate_withVersion() async throws {
        // GIVEN
        preRelease = .candidate(version: 0)
        
        // WHEN
        result = preRelease.rawValue
        
        // THEN
        XCTAssertEqual(result, .PreReleases.candidate + ".0")
    }
    
    func test_whenCustom() async throws {
        // GIVEN
        let string = "Something..."
        
        preRelease = .custom(string: string)
        
        // WHEN
        result = preRelease.rawValue
        
        // THEN
        XCTAssertEqual(result, string)
    }
    
}
