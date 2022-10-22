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
    
    // MARK: Initialisers
    
    public init?(rawValue: String) {
        let parser = PreReleaseParser()
        
        if let preRelease = parser(rawValue) {
            self = preRelease
        } else {
            return nil
        }
    }
    
}

// MARK: - Incrementable

extension PreRelease: Incrementable {
    
    // MARK: Functions
    
    func increment() async throws -> PreRelease {
        let increment = { (version: Int?) -> Int in
            guard let version else { return 2 }
            
            return version + 1
        }
        
        switch self {
        case .alpha(let version):
            return .alpha(version: increment(version))
        case .beta(let version):
            return .beta(version: increment(version))
        case .candidate(let version):
            return .candidate(version: increment(version))
        case .custom:
            throw IncrementError.preReleaseCannotIncrement
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
