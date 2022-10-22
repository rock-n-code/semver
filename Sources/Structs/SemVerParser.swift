//
//  SemVerParser.swift
//  SemVer
//
//  Created by Javier Cicchelli on 19/10/2022.
//  Copyright © 2022 Röck+Cöde. All rights reserved.
//

import RegexBuilder

struct SemVerParser {}

// MARK: -

extension SemVerParser: SemVerStringParser {
    
    // MARK: Functions
    
    func callAsFunction(_ string: String) throws -> SemVer? {
        guard let matches = try RegularExpressions.semVer.wholeMatch(in: string) else {
            return nil
        }
        
        return .init(
            mayor: matches[References.mayor],
            minor: matches[References.minor],
            patch: matches[References.patch],
            preRelease: .init(rawValue: matches[References.preRelease] ?? ""),
            buildMetadata: .init(rawValue: matches[References.buildMetadata] ?? "")
        )
    }
    
}

// MARK: - Regular Expressions

private extension SemVerParser {
    
    enum References {
        static let mayor = Reference(Int.self)
        static let minor = Reference(Int.self)
        static let patch = Reference(Int.self)
        static let preRelease = Reference(String?.self)
        static let buildMetadata = Reference(String?.self)
    }
    
    enum RegularExpressions {
        static let semVer = Regex {
            TryCapture(as: References.mayor) {
                OneOrMore(.digit)
            } transform: {
                Int($0)
            }
            One(".")
            TryCapture(as: References.minor) {
                OneOrMore(.digit)
            } transform: {
                Int($0)
            }
            One(".")
            TryCapture(as: References.patch) {
                OneOrMore(.digit)
            } transform: {
                Int($0)
            }
            Optionally {
                One("-")
                Capture(as: References.preRelease) {
                    OneOrMore(ChoiceOf {
                        One(.word)
                        One(.digit)
                    })
                    ZeroOrMore(ChoiceOf {
                        One(.word)
                        One(.digit)
                        One(".")
                        One("_")
                        One("-")
                        One("=")
                    })
                } transform: {
                    String($0)
                }
            }
            Optionally {
                One("+")
                Capture(as: References.buildMetadata) {
                    OneOrMore(ChoiceOf {
                        One(.word)
                        One(.digit)
                    })
                    ZeroOrMore(ChoiceOf {
                        One(.word)
                        One(.digit)
                        One(".")
                        One("_")
                        One("+")
                        One("=")
                    })
                } transform: {
                    String($0)
                }
            }
        }
    }
    
}
