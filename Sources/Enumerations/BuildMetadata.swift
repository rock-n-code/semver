//
//  BuildMetadata.swift
//  SemVer
//
//  Created by Javier Cicchelli on 17/10/2022.
//  Copyright © 2022 Röck+Cöde. All rights reserved.
//

import Foundation

public enum BuildMetadata {
    case buildNumber(Int)
    case custom(String)
}

// MARK: - RawRepresentable

extension BuildMetadata: RawRepresentable {
    
    // MARK: Properties
    
    public var rawValue: String {
        let converter = BuildMetadataConverter()
        
        return converter(self)
    }

    // MARK: Life cycle
    
    public init?(rawValue: String) {
        let parser = BuildMetadataParser()
        
        if let buildMetadata = parser(rawValue) {
            self = buildMetadata
        } else {
            return nil
        }
    }
    
}

// MARK: - Equatable

#if DEBUG
extension BuildMetadata: Equatable {
    
    // MARK: Functions
    
    public static func == (
        lhs: BuildMetadata,
        rhs: BuildMetadata
    ) -> Bool {
        switch (lhs, rhs) {
        case (.buildNumber(let lnumber), .buildNumber(let rnumber)):
            return lnumber == rnumber
        case (.custom(let lstring), .custom(let rstring)):
            return lstring == rstring
        default:
            return false
        }
    }
    
}
#endif
