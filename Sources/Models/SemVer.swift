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
    
    // MARK: Life Cycle
    
    public init?(string: String) {
        let parser = SemVerParser()
        
        do {
            guard let semver = try parser(string) else {
                return nil
            }
            
            self = semver
        } catch {
            return nil
        }
    }
    
    init(
        mayor: Int,
        minor: Int,
        patch: Int,
        preRelease: PreRelease?,
        buildMetadata: BuildMetadata?
    ) {
        self.mayor = mayor
        self.minor = minor
        self.patch = patch
        self.preRelease = preRelease
        self.buildMetadata = buildMetadata
    }
    
}
