//
//  PreRelease.swift
//  SemVer
//
//  Created by Javier Cicchelli on 17/10/2022.
//  Copyright © 2022 Röck+Cöde. All rights reserved.
//

public enum PreRelease {
    case alpha(version: Int? = nil)
    case beta(version: Int? = nil)
    case candidate(version: Int? = nil)
    case custom(string: String)
}

// MARK: - RawRepresentable

extension PreRelease: RawRepresentable {
    
    // MARK: Properties
    
    public var rawValue: String {
        let converter = PreReleaseConverter()
        
        return converter(self)
    }
    
    // MARK: Life cycle
    
    public init?(rawValue: String) {
        let parser = PreReleaseParser()
        
        if let preRelease = parser(rawValue) {
            self = preRelease
        } else {
            return nil
        }
    }
    
}

// MARK: - Equatable

#if DEBUG
extension PreRelease: Equatable {
    
    // MARK: Functions
    
    public static func == (
        lhs: PreRelease,
        rhs: PreRelease
    ) -> Bool {
        switch (lhs, rhs) {
        case (.alpha(let lversion), .alpha(let rversion)):
            return lversion == rversion
        case (.beta(let lversion), .beta(let rversion)):
            return lversion == rversion
        case (.candidate(let lversion), .candidate(let rversion)):
            return lversion == rversion
        case (.custom(let lstring), .custom(let rstring)):
            return lstring == rstring
        default:
            return false
        }
    }

}
#endif
