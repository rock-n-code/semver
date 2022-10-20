//
//  BuildMetadataConverter.swift
//  SemVer
//
//  Created by Javier Cicchelli on 17/10/2022.
//  Copyright © 2022 Röck+Cöde. All rights reserved.
//

struct BuildMetadataConverter {}

// MARK: - BuildMetadataEnumConverter

extension BuildMetadataConverter: BuildMetadataEnumConverter {
    
    // MARK: Functions
    
    func callAsFunction(_ buildMetadata: BuildMetadata) -> String {
        switch buildMetadata {
        case .buildNumber(let buildNumber):
            return .init(format: .Formats.threeDigits, buildNumber)
        case .custom(let string):
            return string
        }
    }
    
}

// MARK: - String+Formats

private extension String {

    enum Formats {
        static let threeDigits = "%03d"
    }

}
