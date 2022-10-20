//
//  PreReleaseConverter.swift
//  SemVer
//
//  Created by Javier Cicchelli on 17/10/2022.
//  Copyright © 2022 Röck+Cöde. All rights reserved.
//

struct PreReleaseConverter {}

// MARK: - PreReleaseEnumConverter

extension PreReleaseConverter: PreReleaseEnumConverter {
    
    // MARK: Functions
    
    func callAsFunction(_ preRelease: PreRelease) -> String {
        let (label, version): (String, Int?) = {
            switch preRelease {
            case .alpha(let version):
                return (.PreReleases.alpha, version)
            case .beta(let version):
                return (.PreReleases.beta, version)
            case .candidate(let version):
                return (.PreReleases.candidate, version)
            case .custom(let string):
                return (string, nil)
            }
        }()
        
        if let version {
            return .init(format: .Formats.dottedLabel, label, version)
        } else {
            return label
        }
    }
    
}

// MARK: - String+Formats

private extension String {
    
    enum Formats {
        static let dottedLabel = "%@.%d"
    }
    
}
