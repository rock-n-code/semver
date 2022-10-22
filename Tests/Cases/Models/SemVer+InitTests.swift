//
//  SemVer+InitTests.swift
//  SemVerTests
//
//  Created by Javier Cicchelli on 20/10/2022.
//  Copyright © 2022 Röck+Cöde. All rights reserved.
//

import XCTest

@testable import SemVer

final class SemVerInitTests: XCTestCase {
    
    // MARK: Properties
    
    private var string: String!
    private var result: SemVer!

    // MARK: Init tests
    
    func test_withZeroVersion() async throws {
        // GIVEN
        string = "0.0.0"
        
        // WHEN
        result = .init(string: string)
        
        // THEN
        XCTAssertNotNil(result)
        XCTAssertEqual(result.mayor, 0)
        XCTAssertEqual(result.minor, 0)
        XCTAssertEqual(result.patch, 0)
        XCTAssertNil(result.preRelease)
        XCTAssertNil(result.buildMetadata)
    }
    
    func test_withNonZeroVersion() async throws {
        // GIVEN
        string = "1.2.3"
        
        // WHEN
        result = .init(string: string)
        
        // THEN
        XCTAssertNotNil(result)
        XCTAssertEqual(result.mayor, 1)
        XCTAssertEqual(result.minor, 2)
        XCTAssertEqual(result.patch, 3)
        XCTAssertNil(result.preRelease)
        XCTAssertNil(result.buildMetadata)
    }
    
    func test_withBigVersion() async throws {
        // GIVEN
        string = "11.222.3333"
        
        // WHEN
        result = .init(string: string)
        
        // THEN
        XCTAssertNotNil(result)
        XCTAssertEqual(result.mayor, 11)
        XCTAssertEqual(result.minor, 222)
        XCTAssertEqual(result.patch, 3333)
        XCTAssertNil(result.preRelease)
        XCTAssertNil(result.buildMetadata)
    }
    
    func test_withVersion_andAlphaPreRelease() async throws {
        // GIVEN
        string = "1.2.3-alpha"
        
        // WHEN
        result = .init(string: string)
        
        // THEN
        XCTAssertNotNil(result)
        XCTAssertEqual(result.mayor, 1)
        XCTAssertEqual(result.minor, 2)
        XCTAssertEqual(result.patch, 3)
        XCTAssertEqual(result.preRelease, .alpha())
        XCTAssertNil(result.buildMetadata)
    }
    
    func test_withVersion_andNumberedAlphaPreRelease() async throws {
        // GIVEN
        string = "1.2.3-alpha.1"
        
        // WHEN
        result = .init(string: string)
        
        // THEN
        XCTAssertNotNil(result)
        XCTAssertEqual(result.mayor, 1)
        XCTAssertEqual(result.minor, 2)
        XCTAssertEqual(result.patch, 3)
        XCTAssertEqual(result.preRelease, .alpha(version: 1))
        XCTAssertNil(result.buildMetadata)
    }
    
    func test_withVersion_andBetaPreRelease() async throws {
        // GIVEN
        string = "1.2.3-beta"
        
        // WHEN
        result = .init(string: string)
        
        // THEN
        XCTAssertNotNil(result)
        XCTAssertEqual(result.mayor, 1)
        XCTAssertEqual(result.minor, 2)
        XCTAssertEqual(result.patch, 3)
        XCTAssertEqual(result.preRelease, .beta())
        XCTAssertNil(result.buildMetadata)
    }
    
    func test_withVersion_andNumberedBetaPreRelease() async throws {
        // GIVEN
        string = "1.2.3-beta.1"
        
        // WHEN
        result = .init(string: string)
        
        // THEN
        XCTAssertNotNil(result)
        XCTAssertEqual(result.mayor, 1)
        XCTAssertEqual(result.minor, 2)
        XCTAssertEqual(result.patch, 3)
        XCTAssertEqual(result.preRelease, .beta(version: 1))
        XCTAssertNil(result.buildMetadata)
    }
    
    func test_withVersion_andCandidatePreRelease() async throws {
        // GIVEN
        string = "1.2.3-rc"
        
        // WHEN
        result = .init(string: string)
        
        // THEN
        XCTAssertNotNil(result)
        XCTAssertEqual(result.mayor, 1)
        XCTAssertEqual(result.minor, 2)
        XCTAssertEqual(result.patch, 3)
        XCTAssertEqual(result.preRelease, .candidate())
        XCTAssertNil(result.buildMetadata)
    }
    
    func test_withVersion_andNumberedCandidatePreRelease() async throws {
        // GIVEN
        string = "1.2.3-rc.1"
        
        // WHEN
        result = .init(string: string)
        
        // THEN
        XCTAssertNotNil(result)
        XCTAssertEqual(result.mayor, 1)
        XCTAssertEqual(result.minor, 2)
        XCTAssertEqual(result.patch, 3)
        XCTAssertEqual(result.preRelease, .candidate(version: 1))
        XCTAssertNil(result.buildMetadata)
    }
    
    func test_withVersion_andCustomPreRelease() async throws {
        // GIVEN
        string = "1.2.3-x.x-x"
        
        // WHEN
        result = .init(string: string)
        
        // THEN
        XCTAssertNotNil(result)
        XCTAssertEqual(result.mayor, 1)
        XCTAssertEqual(result.minor, 2)
        XCTAssertEqual(result.patch, 3)
        XCTAssertEqual(result.preRelease, .custom(string: "x.x-x"))
        XCTAssertNil(result.buildMetadata)
    }
    
    func test_withVersion_andBuildNumberMetadata() async throws {
        // GIVEN
        string = "1.2.3+012"
        
        // WHEN
        result = .init(string: string)
        
        // THEN
        XCTAssertNotNil(result)
        XCTAssertEqual(result.mayor, 1)
        XCTAssertEqual(result.minor, 2)
        XCTAssertEqual(result.patch, 3)
        XCTAssertNil(result.preRelease)
        XCTAssertEqual(result.buildMetadata, .buildNumber(version: 12))
    }
    
    func test_withVersion_andCustomMetadata() async throws {
        // GIVEN
        string = "1.2.3+x+x.x"
        
        // WHEN
        result = .init(string: string)
        
        // THEN
        XCTAssertNotNil(result)
        XCTAssertEqual(result.mayor, 1)
        XCTAssertEqual(result.minor, 2)
        XCTAssertEqual(result.patch, 3)
        XCTAssertNil(result.preRelease)
        XCTAssertEqual(result.buildMetadata, .custom(string: "x+x.x"))
    }
    
    func test_withVersion_anyPreRelease_andAnyBuildMetadata() async throws {
        // GIVEN
        string = "1.2.3-alpha.1+0123"
        
        // WHEN
        result = .init(string: string)
        
        // THEN
        XCTAssertNotNil(result)
        XCTAssertEqual(result.mayor, 1)
        XCTAssertEqual(result.minor, 2)
        XCTAssertEqual(result.patch, 3)
        XCTAssertEqual(result.preRelease, .alpha(version: 1))
        XCTAssertEqual(result.buildMetadata, .buildNumber(version: 123))
    }
    
    func test_withEmpty() async throws {
        // GIVEN
        string = ""
        
        // WHEN
        result = .init(string: string)
        
        // THEN
        XCTAssertNil(result)
    }
    
    func test_withIncompleteVersion() async throws {
        // GIVEN
        string = "0.1"
        
        // WHEN
        result = .init(string: string)
        
        // THEN
        XCTAssertNil(result)
    }
    
    func test_withVersion_anyBuildMetadata_andAnyPreRelease() async throws {
        // GIVEN
        string = "1.2.3+x.y+z-x.y-z"
        
        // WHEN
        result = .init(string: string)
        
        // THEN
        XCTAssertNil(result)
    }

}
