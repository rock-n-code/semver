//
//  SemVer+IncrementTests.swift
//  SemVerTests
//
//  Created by Javier Cicchelli on 22/10/2022.
//  Copyright © 2022 Röck+Cöde. All rights reserved.
//

import XCTest

@testable import SemVer

final class SemVerIncrementTests: XCTestCase {
    
    // MARK: Properties
    
    private var semVer: SemVer!
    private var result: SemVer!

    // MARK: Increment tests
    
    func test_withMayorOption() async throws {
        // GIVEN
        semVer = .init()
        
        // WHEN
        result = try await semVer.increment(.mayor)
        
        // THEN
        XCTAssertNotNil(result)
        XCTAssertEqual(result.mayor, semVer.mayor + 1)
        XCTAssertEqual(result.minor, 0)
        XCTAssertEqual(result.patch, 0)
        XCTAssertNil(result.preRelease)
        XCTAssertNil(result.buildMetadata)
    }
    
    func test_withMinorOption() async throws {
        // GIVEN
        semVer = .init()
        
        // WHEN
        result = try await semVer.increment(.minor)
        
        // THEN
        XCTAssertNotNil(result)
        XCTAssertEqual(result.mayor, semVer.mayor)
        XCTAssertEqual(result.minor, semVer.minor + 1)
        XCTAssertEqual(result.patch, 0)
        XCTAssertNil(result.preRelease)
        XCTAssertNil(result.buildMetadata)
    }
    
    func test_withPatchOption() async throws {
        // GIVEN
        semVer = .init()
        
        // WHEN
        result = try await semVer.increment(.patch)
        
        // THEN
        XCTAssertNotNil(result)
        XCTAssertEqual(result.mayor, semVer.mayor)
        XCTAssertEqual(result.minor, semVer.minor)
        XCTAssertEqual(result.patch, semVer.patch + 1)
        XCTAssertNil(result.preRelease)
        XCTAssertNil(result.buildMetadata)
    }
    
    func test_withPreReleaseOption_whenNoPreReleaseDefined() async throws {
        // GIVEN
        semVer = .init()
        
        // WHEN & THEN
        do {
            _ = try await semVer.increment(.preRelease)
        } catch IncrementError.preReleaseNotDefined {
            XCTAssertTrue(true)
        } catch {
            XCTAssertTrue(false)
        }
    }
    
    func test_withPreReleaseOption_whenAlphaDefined() async throws {
        // GIVEN
        semVer = .init(preRelease: .alpha())
        
        // WHEN
        result = try await semVer.increment(.preRelease)
        
        // THEN
        XCTAssertNotNil(result)
        XCTAssertEqual(result.mayor, semVer.mayor)
        XCTAssertEqual(result.minor, semVer.minor)
        XCTAssertEqual(result.patch, semVer.patch)
        XCTAssertEqual(result.preRelease, .alpha(version: 2))
        XCTAssertNil(result.buildMetadata)
    }
    
    func test_withPreReleaseOption_whenAlphaVersionDefined() async throws {
        // GIVEN
        semVer = .init(preRelease: .alpha(version: 1))
        
        // WHEN
        result = try await semVer.increment(.preRelease)
        
        // THEN
        XCTAssertNotNil(result)
        XCTAssertEqual(result.mayor, semVer.mayor)
        XCTAssertEqual(result.minor, semVer.minor)
        XCTAssertEqual(result.patch, semVer.patch)
        XCTAssertEqual(result.preRelease, .alpha(version: 2))
        XCTAssertNil(result.buildMetadata)
    }
    
    func test_withPreReleaseOption_whenBetaDefined() async throws {
        // GIVEN
        semVer = .init(preRelease: .beta())
        
        // WHEN
        result = try await semVer.increment(.preRelease)
        
        // THEN
        XCTAssertNotNil(result)
        XCTAssertEqual(result.mayor, semVer.mayor)
        XCTAssertEqual(result.minor, semVer.minor)
        XCTAssertEqual(result.patch, semVer.patch)
        XCTAssertEqual(result.preRelease, .beta(version: 2))
        XCTAssertNil(result.buildMetadata)
    }
    
    func test_withPreReleaseOption_whenBetaVersionDefined() async throws {
        // GIVEN
        semVer = .init(preRelease: .beta(version: 1))
        
        // WHEN
        result = try await semVer.increment(.preRelease)
        
        // THEN
        XCTAssertNotNil(result)
        XCTAssertEqual(result.mayor, semVer.mayor)
        XCTAssertEqual(result.minor, semVer.minor)
        XCTAssertEqual(result.patch, semVer.patch)
        XCTAssertEqual(result.preRelease, .beta(version: 2))
        XCTAssertNil(result.buildMetadata)
    }
    
    func test_withPreReleaseOption_whenCandidateDefined() async throws {
        // GIVEN
        semVer = .init(preRelease: .candidate())
        
        // WHEN
        result = try await semVer.increment(.preRelease)
        
        // THEN
        XCTAssertNotNil(result)
        XCTAssertEqual(result.mayor, semVer.mayor)
        XCTAssertEqual(result.minor, semVer.minor)
        XCTAssertEqual(result.patch, semVer.patch)
        XCTAssertEqual(result.preRelease, .candidate(version: 2))
        XCTAssertNil(result.buildMetadata)
    }
    
    func test_withPreReleaseOption_whenCandidateVersionDefined() async throws {
        // GIVEN
        semVer = .init(preRelease: .candidate(version: 1))
        
        // WHEN
        result = try await semVer.increment(.preRelease)
        
        // THEN
        XCTAssertNotNil(result)
        XCTAssertEqual(result.mayor, semVer.mayor)
        XCTAssertEqual(result.minor, semVer.minor)
        XCTAssertEqual(result.patch, semVer.patch)
        XCTAssertEqual(result.preRelease, .candidate(version: 2))
        XCTAssertNil(result.buildMetadata)
    }
    
    func test_withPreReleaseOption_whenCustomPreReleaseDefined() async throws {
        // GIVEN
        semVer = .init(preRelease: .custom(string: "Something goes here..."))
        
        // WHEN & THEN
        do {
            _ = try await semVer.increment(.preRelease)
        } catch IncrementError.preReleaseCannotIncrement {
            XCTAssertTrue(true)
        } catch {
            XCTAssertTrue(false)
        }
    }
    
    func test_withBuildMetadataOption_whenNoBuildMetadataDefined() async throws {
        // GIVEN
        semVer = .init()
        
        // WHEN & THEN
        do {
            _ = try await semVer.increment(.buildMetadata)
        } catch IncrementError.buildMetadataNotDefined {
            XCTAssertTrue(true)
        } catch {
            XCTAssertTrue(false)
        }
    }
    
    func test_withBuildMetadataOption_whenBuildNumberDefined() async throws {
        // GIVEN
        semVer = .init(buildMetadata: .buildNumber(version: 1))
        
        // WHEN
        result = try await semVer.increment(.buildMetadata)
        
        // THEN
        XCTAssertNotNil(result)
        XCTAssertEqual(result.mayor, semVer.mayor)
        XCTAssertEqual(result.minor, semVer.minor)
        XCTAssertEqual(result.patch, semVer.patch)
        XCTAssertNil(result.preRelease)
        XCTAssertEqual(result.buildMetadata, .buildNumber(version: 2))
    }
    
    func test_withBuildMetadataOption_whenPreRelease_andBuildNumberDefined() async throws {
        // GIVEN
        semVer = .init(
            preRelease: .alpha(),
            buildMetadata: .buildNumber(version: 1)
        )
        
        // WHEN
        result = try await semVer.increment(.buildMetadata)
        
        // THEN
        XCTAssertNotNil(result)
        XCTAssertEqual(result.mayor, semVer.mayor)
        XCTAssertEqual(result.minor, semVer.minor)
        XCTAssertEqual(result.patch, semVer.patch)
        XCTAssertEqual(result.preRelease, semVer.preRelease)
        XCTAssertEqual(result.buildMetadata, .buildNumber(version: 2))
    }
    
    func test_withBuildMetadataOption_whenCustomBuildMetadataDefined() async throws {
        // GIVEN
        semVer = .init(buildMetadata: .custom(string: "Something goes here..."))
        
        // WHEN & THEN
        do {
            _ = try await semVer.increment(.buildMetadata)
        } catch IncrementError.buildMetadataCannotIncrement {
            XCTAssertTrue(true)
        } catch {
            XCTAssertTrue(false)
        }
    }

}
