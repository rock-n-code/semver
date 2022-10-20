//
//  BuildMetadataStringParser.swift
//  SemVer
//
//  Created by Javier Cicchelli on 17/10/2022.
//  Copyright © 2022 Röck+Cöde. All rights reserved.
//

protocol BuildMetadataStringParser {
    
    // MARK: Functions
    
    func callAsFunction(_ string: String) -> BuildMetadata?
    
}
