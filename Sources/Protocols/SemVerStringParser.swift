//
//  SemVerStringParser.swift
//  SemVer
//
//  Created by Javier Cicchelli on 19/10/2022.
//  Copyright © 2022 Röck+Cöde. All rights reserved.
//

protocol SemVerStringParser {
    
    // MARK: Functions
    
    func callAsFunction(_ string: String) throws -> SemVer?
    
}
