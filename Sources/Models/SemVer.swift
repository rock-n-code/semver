//
//  SemVer.swift
//  SemVer
//
//  Created by Javier Cicchelli on 16/10/2022.
//  Copyright © 2022 Röck+Cöde. All rights reserved.
//

public struct SemVer {
    
    // MARK: Properties
    
    public let mayor: Int
    public let minor: Int
    public let patch: Int
    public let preRelease: PreRelease?
    public let buildMetadata: BuildMetadata?
    
    private var incrementOption: IncrementOption?

    // MARK: Initialisers
    
    public init?(string: String) {
        let parser = SemVerParser()
        
        do {
            guard let semVer = try parser(string) else { return nil }
            
            self = semVer
        } catch {
            return nil
        }
    }
    
    // MARK: Functions
    
    mutating func increment(_ option: IncrementOption) async throws -> SemVer {
        incrementOption = option
        
        return try await increment()
    }
    
}

// MARK: - Enumerations

extension SemVer {
    public enum IncrementOption {
        case mayor
        case minor
        case patch
        case preRelease
        case buildMetadata
    }
}

// MARK: - Internals

extension SemVer {
    
    // MARK: Initialisers
    
    init(
        mayor: Int = 0,
        minor: Int = 0,
        patch: Int = 0,
        preRelease: PreRelease? = nil,
        buildMetadata: BuildMetadata? = nil
    ) {
        self.mayor = mayor
        self.minor = minor
        self.patch = patch
        self.preRelease = preRelease
        self.buildMetadata = buildMetadata
    }

}

// MARK: - Incrementable

extension SemVer: Incrementable {
    
    // MARK: Functions
    
    func increment() async throws -> SemVer {
        guard let incrementOption else { throw IncrementError.optionNotSelected }
        
        switch incrementOption {
        case .mayor:
            return .init(mayor: mayor + 1)
        case .minor:
            return .init(
                mayor: mayor,
                minor: minor + 1
            )
        case .patch:
            return .init(
                mayor: mayor,
                minor: minor,
                patch: patch + 1
            )
        case .preRelease:
            guard let preRelease else { throw IncrementError.preReleaseNotDefined }
            
            return .init(
                mayor: mayor,
                minor: minor,
                patch: patch,
                preRelease: try await preRelease.increment()
            )
        case .buildMetadata:
            guard let buildMetadata else { throw IncrementError.buildMetadataNotDefined }
            
            return .init(
                mayor: mayor,
                minor: minor,
                patch: patch,
                preRelease: preRelease,
                buildMetadata: try await buildMetadata.increment()
            )
        }
    }
    
}
