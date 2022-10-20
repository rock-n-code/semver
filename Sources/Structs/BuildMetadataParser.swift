//
//  BuildMetadataParser.swift
//  SemVer
//
//  Created by Javier Cicchelli on 17/10/2022.
//  Copyright © 2022 Röck+Cöde. All rights reserved.
//

import RegexBuilder

struct BuildMetadataParser {}

// MARK: - BuildMetadataStringParser

extension BuildMetadataParser: BuildMetadataStringParser {
    
    // MARK: Functions
    
    func callAsFunction(_ string: String) -> BuildMetadata? {
        if let _ = string.wholeMatch(of: RegularExpressions.empty)?.output {
            return nil
        } else if let (_, buildNumber) = string.wholeMatch(of: RegularExpressions.buildNumber)?.output {
            return .buildNumber(buildNumber)
        } else {
            return .custom(string)
        }
    }
    
}

// MARK: - Regular Expressions

private extension BuildMetadataParser {
    
    enum RegularExpressions {
        static let empty = Regex {
            ZeroOrMore(.whitespace)
        }
        
        static let buildNumber = Regex {
            Capture {
                Repeat(count: 3) {
                    One(.digit)
                }
                ZeroOrMore(.digit)
            } transform: {
                Int($0) ?? 0
            }
        }
    }
    
}
