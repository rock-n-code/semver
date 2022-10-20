//
//  BuildMetadata+RawValueTests.swift
//  SemVerTests
//
//  Created by Javier Cicchelli on 19/10/2022.
//  Copyright © 2022 Röck+Cöde. All rights reserved.
//

import XCTest

@testable import SemVer

final class BuildMetadataRawValueTests: XCTestCase {

    // MARK: Properties
    
    var buildMetadata: BuildMetadata!
    var result: String!
    
    // MARK: Raw value tests
    
    func test_whenBuildNumber_withZero() async throws {
        // GIVEN
        buildMetadata = .buildNumber(0)
        
        // WHEN
        result = buildMetadata.rawValue
        
        // THEN
        XCTAssertEqual(result, .Seeds.Metadatas.threeZeros)
    }
    
    func test_whenBuildNumber_withSmallNumber() async throws {
        // GIVEN
        buildMetadata = .buildNumber(12)
        
        // WHEN
        result = buildMetadata.rawValue
        
        // THEN
        XCTAssertEqual(result, .Seeds.Metadatas.twoDigits)
    }
    
    func test_whenBuildNumber_withBigNumber() async throws {
        // GIVEN
        buildMetadata = .buildNumber(123456)
        
        // WHEN
        result = buildMetadata.rawValue
        
        // THEN
        XCTAssertEqual(result, .Seeds.Metadatas.multipleDigits)
    }
    
    func test_whenCustom_withSomeText() async throws {
        // GIVEN
        buildMetadata = .custom(.Seeds.Metadatas.defaultText)
        
        // WHEN
        result = buildMetadata.rawValue
        
        // THEN
        XCTAssertEqual(result, .Seeds.Metadatas.defaultText)
    }
    
    func test_whenCustom_withEmptyText() async throws {
        // GIVEN
        buildMetadata = .custom(.Seeds.Metadatas.empty)
        
        // WHEN
        result = buildMetadata.rawValue
        
        // THEN
        XCTAssertEqual(result, .Seeds.Metadatas.empty)
    }
    
    func test_whenCustom_withWhitespaceText() async throws {
        // GIVEN
        buildMetadata = .custom(.Seeds.Metadatas.multipleWhitespaces)
        
        // WHEN
        result = buildMetadata.rawValue
        
        // THEN
        XCTAssertEqual(result, .Seeds.Metadatas.multipleWhitespaces)
    }

}
