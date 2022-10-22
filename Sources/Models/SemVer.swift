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
