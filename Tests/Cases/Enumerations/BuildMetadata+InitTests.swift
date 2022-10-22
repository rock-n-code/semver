//
//  BuildMetadata+InitTests.swift
//  SemVerTests
//
//  Created by Javier Cicchelli on 19/10/2022.
//  Copyright © 2022 Röck+Cöde. All rights reserved.
//

import XCTest

@testable import SemVer

final class BuildMetadataInitTests: XCTestCase {

    // MARK: Properties
    
    var rawValue: String!
    var result: BuildMetadata!
    
    // MARK: - Initialisers tests
    
    func test_withOneZero() async throws {
        // GIVEN
        rawValue = .Seeds.Metadatas.oneZero
        
        // WHEN
        result = .init(rawValue: rawValue)
        
        // THEN
        XCTAssertEqual(result, .custom(rawValue))
    }
    
    func test_withTwoZeros() async throws {
        // GIVEN
        rawValue = .Seeds.Metadatas.twoZeros
        
        // WHEN
        result = .init(rawValue: rawValue)
        
        // THEN
        XCTAssertEqual(result, .custom(rawValue))
    }
    
    func test_withThreeZeros() async throws {
        // GIVEN
        rawValue = .Seeds.Metadatas.threeZeros
        
        // WHEN
        result = .init(rawValue: rawValue)
        
        // THEN
        XCTAssertEqual(result, .buildNumber(0))
    }
    
    func test_withTwoDigits() async throws {
        // GIVEN
        rawValue = .Seeds.Metadatas.twoDigits
        
        // WHEN
        result = .init(rawValue: rawValue)
        
        // THEN
        XCTAssertEqual(result, .buildNumber(12))
    }
    
    func test_withMultipleDigits() async throws {
        // GIVEN
        rawValue = .Seeds.Metadatas.multipleDigits
        
        // WHEN
        result = .init(rawValue: rawValue)
        
        // THEN
        XCTAssertEqual(result, .buildNumber(123456))
    }
    
    func test_withSomeText() async throws {
        // GIVEN
        rawValue = .Seeds.Metadatas.defaultText
        
        // WHEN
        result = .init(rawValue: rawValue)
        
        // THEN
        XCTAssertEqual(result, .custom(rawValue))
    }
    
    func test_withEmpty() async throws {
        // GIVEN
        rawValue = .Seeds.Metadatas.empty
        
        // WHEN
        result = .init(rawValue: rawValue)
        
        // THEN
        XCTAssertEqual(result, nil)
    }
    
    func test_withWhitespaces() async throws {
        // GIVEN
        rawValue = .Seeds.Metadatas.multipleWhitespaces
        
        // WHEN
        result = .init(rawValue: rawValue)
        
        // THEN
        XCTAssertEqual(result, nil)
    }

}
