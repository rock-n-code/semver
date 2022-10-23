//
//  SemVerConverter.swift
//  SemVer
//
//  Created by Javier Cicchelli on 23/10/2022.
//  Copyright © 2022 Röck+Cöde. All rights reserved.
//

struct SemVerConverter {}

// MARK: - SemVerStructConverter

extension SemVerConverter: SemVerStructConverter {
    
    // MARK: Functions
    
    func callAsFunction(_ semVer: SemVer) -> String {
        var string = String(
            format: .Formats.semanticVersion,
            semVer.mayor,
            semVer.minor,
            semVer.patch
        )
        
        if let preRelease = semVer.preRelease {
            string += "-\(preRelease.rawValue)"
        }
        
        if let buildMetadata = semVer.buildMetadata {
            string += "+\(buildMetadata.rawValue)"
        }
        
        return string
    }
    
}

// MARK: - String+Formats

private extension String {
    
    enum Formats {
        static let semanticVersion = "%d.%d.%d"
    }
    
}
