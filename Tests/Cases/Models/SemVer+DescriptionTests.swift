//
//  SemVer+DescriptionTests.swift
//  SemVerTests
//
//  Created by Javier Cicchelli on 23/10/2022.
//  Copyright © 2022 Röck+Cöde. All rights reserved.
//

import XCTest

@testable import SemVer

final class SemVerDescriptionTests: XCTestCase {

    // MARK: Properties
    
    private var semVer: SemVer!
    private var result: String!
    
    // MARK: Description tests
    
    func test_withVersionNumber() async throws {
        // GIVEN
        semVer = .init()
        
        // WHEN
        result = semVer.description
        
        // THEN
        XCTAssertEqual(result, "0.0.0")
    }
    
    func test_withVersionNumber_andAlphaPreRelease() async throws {
        // GIVEN
        semVer = .init(preRelease: .alpha())
        
        // WHEN
        result = semVer.description
        
        // THEN
        XCTAssertEqual(result, "0.0.0-alpha")
    }
    
    func test_withVersionNumber_andVersionedAlphaPreRelease() async throws {
        // GIVEN
        semVer = .init(preRelease: .alpha(version: 1))
        
        // WHEN
        result = semVer.description
        
        // THEN
        XCTAssertEqual(result, "0.0.0-alpha.1")
    }
    
    func test_withVersionNumber_andBetaPreRelease() async throws {
        // GIVEN
        semVer = .init(preRelease: .beta())
        
        // WHEN
        result = semVer.description
        
        // THEN
        XCTAssertEqual(result, "0.0.0-beta")
    }
    
    func test_withVersionNumber_andVersionedBetaPreRelease() async throws {
        // GIVEN
        semVer = .init(preRelease: .beta(version: 1))
        
        // WHEN
        result = semVer.description
        
        // THEN
        XCTAssertEqual(result, "0.0.0-beta.1")
    }
    
    func test_withVersionNumber_andCandidatePreRelease() async throws {
        // GIVEN
        semVer = .init(preRelease: .candidate())
        
        // WHEN
        result = semVer.description
        
        // THEN
        XCTAssertEqual(result, "0.0.0-rc")
    }
    
    func test_withVersionNumber_andVersionedCandidatePreRelease() async throws {
        // GIVEN
        semVer = .init(preRelease: .candidate(version: 1))
        
        // WHEN
        result = semVer.description
        
        // THEN
        XCTAssertEqual(result, "0.0.0-rc.1")
    }
    
    func test_withVersionNumber_andCustomPreRelease() async throws {
        // GIVEN
        let string = "Something-123.0.1.2=87654321"
        
        semVer = .init(preRelease: .custom(string: string))
        
        // WHEN
        result = semVer.description
        
        // THEN
        XCTAssertEqual(result, "0.0.0-\(string)")
    }
    
    func test_withVersionNumber_andBuildNumberMetadata() async throws {
        // GIVEN
        semVer = .init(buildMetadata: .buildNumber(version: 0))
        
        // WHEN
        result = semVer.description
        
        // THEN
        XCTAssertEqual(result, "0.0.0+000")
    }
    
    func test_withVersionNumber_andCustomBuildMetadata() async throws {
        // GIVEN
        let string = "Something-123.0.1.2=87654321"
        
        semVer = .init(buildMetadata: .custom(string: string))
        
        // WHEN
        result = semVer.description
        
        // THEN
        XCTAssertEqual(result, "0.0.0+\(string)")
    }
    
    func test_withVerionNumber_withAnyPreRelease_andAnyBuildMetadata() async throws {
        // GIVEN
        semVer = .init(
            preRelease: .alpha(),
            buildMetadata: .buildNumber(version: 0)
        )
        
        // WHEN
        result = semVer.description
        
        // THEN
        XCTAssertEqual(result, "0.0.0-alpha+000")
    }

}
