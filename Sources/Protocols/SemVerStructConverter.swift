//
//  SemVerStructConverter.swift
//  SemVer
//
//  Created by Javier Cicchelli on 23/10/2022.
//  Copyright © 2022 Röck+Cöde. All rights reserved.
//

protocol SemVerStructConverter {
    
    // MARK: Functions
    
    func callAsFunction(_ semVer: SemVer) -> String
    
}
