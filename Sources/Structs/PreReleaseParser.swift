//
//  PreReleaseParser.swift
//  SemVer
//
//  Created by Javier Cicchelli on 17/10/2022.
//  Copyright © 2022 Röck+Cöde. All rights reserved.
//

import RegexBuilder

struct PreReleaseParser {}

// MARK: - PreReleaseStringParser

extension PreReleaseParser: PreReleaseStringParser {
    
    // MARK: Functions
    
    func callAsFunction(_ string: String) -> PreRelease? {
        let preRelease = { (label: String, version: Int?) -> PreRelease? in
            switch label {
            case .PreReleases.alpha:
                return .alpha(version: version)
            case .PreReleases.beta:
                return .beta(version: version)
            case .PreReleases.candidate:
                return .candidate(version: version)
            default:
                return nil
            }
        }
        
        if let (_, label, version) = string.wholeMatch(of: RegularExpressions.labelWithVersion)?.output {
            return preRelease(label, version)
        } else if let (_, label) = string.wholeMatch(of: RegularExpressions.label)?.output {
            return preRelease(label, nil)
        } else if let (_, string) = string.wholeMatch(of: RegularExpressions.custom)?.output {
            return .custom(string: string)
        } else {
            return nil
        }
    }

}

// MARK: - Regular Expressions

private extension PreReleaseParser {
    
    enum RegularExpressions {
        static let label = Regex {
            Capture {
                ChoiceOf {
                    String.PreReleases.alpha
                    String.PreReleases.beta
                    String.PreReleases.candidate
                }
            } transform: {
                String($0)
            }
        }
        
        static let labelWithVersion = Regex {
            Capture {
                ChoiceOf {
                    String.PreReleases.alpha
                    String.PreReleases.beta
                    String.PreReleases.candidate
                }
            } transform: {
                String($0)
            }
            One(".")
            Capture {
                OneOrMore(.digit)
            } transform: {
                Int($0)
            }
        }
        
        static let custom = Regex {
            Capture {
                OneOrMore(.word)
                ZeroOrMore(ChoiceOf {
                    ZeroOrMore(.word)
                    ZeroOrMore(.digit)
                    ZeroOrMore(".")
                    ZeroOrMore("-")
                    ZeroOrMore("=")
                })
            } transform: {
                String($0)
            }
        }
    }
    
}
