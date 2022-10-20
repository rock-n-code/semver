//
//  PreRelease+InitTests.swift
//  SemVerTests
//
//  Created by Javier Cicchelli on 17/10/2022.
//  Copyright © 2022 Röck+Cöde. All rights reserved.
//

import XCTest

@testable import SemVer

final class PreReleaseInitTests: XCTestCase {
    
    // MARK: Properties
    
    var rawValue: String!
    var result: PreRelease!
    
    // MARK: - Init tests
    
    func test_whenAlpha() async throws {
        // GIVEN
        rawValue = .PreReleases.alpha
        
        // WHEN
        result = .init(rawValue: rawValue)
        
        // THEN
        XCTAssertEqual(result, .alpha())
    }
    
    func test_whenAlpha_withVersion() async throws {
        // GIVEN
        rawValue = .PreReleases.alpha + ".0"
        
        // WHEN
        result = .init(rawValue: rawValue)
        
        // THEN
        XCTAssertEqual(result, .alpha(version: 0))
    }
    
    func test_whenBeta() async throws {
        // GIVEN
        rawValue = .PreReleases.beta
        
        // WHEN
        result = .init(rawValue: rawValue)
        
        // THEN
        XCTAssertEqual(result, .beta())
    }
    
    func test_whenBeta_withVersion() async throws {
        // GIVEN
        rawValue = .PreReleases.beta + ".0"
        
        // WHEN
        result = .init(rawValue: rawValue)
        
        // THEN
        XCTAssertEqual(result, .beta(version: 0))
    }
    
    func test_whenCandidate() async throws {
        // GIVEN
        rawValue = .PreReleases.candidate
        
        // WHEN
        result = .init(rawValue: rawValue)
        
        // THEN
        XCTAssertEqual(result, .candidate())
    }
    
    func test_whenCandidate_withVersion() async throws {
        // GIVEN
        rawValue = .PreReleases.candidate + ".0"
        
        // WHEN
        result = .init(rawValue: rawValue)
        
        // THEN
        XCTAssertEqual(result, .candidate(version: 0))
    }
    
    func test_whenCustom() async throws {
        // GIVEN
        let string = "Something-123.0.1.2=87654321"
        
        rawValue = string
        
        // WHEN
        result = .init(rawValue: rawValue)
        
        // THEN
        XCTAssertEqual(result, .custom(string: string))
    }
    
    func test_whenEmpty() async throws {
        // GIVEN
        rawValue = ""
        
        // WHEN
        result = .init(rawValue: rawValue)
        
        // THEN
        XCTAssertEqual(result, nil)
    }
    
    func test_whenWhitespaces() async throws {
        // GIVEN
        rawValue = "     "
        
        // WHEN
        result = .init(rawValue: rawValue)
        
        // THEN
        XCTAssertEqual(result, nil)
    }
    
}
