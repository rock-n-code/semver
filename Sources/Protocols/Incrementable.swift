//
//  Incrementable.swift
//  SemVer
//
//  Created by Javier Cicchelli on 22/10/2022.
//  Copyright © 2022 Röck+Cöde. All rights reserved.
//

protocol Incrementable {
    
    // MARK: Functions
    
    func increment() async throws -> Self
    
}
