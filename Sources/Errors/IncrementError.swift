//
//  IncrementError.swift
//  SemVer
//
//  Created by Javier Cicchelli on 22/10/2022.
//  Copyright © 2022 Röck+Cöde. All rights reserved.
//

enum IncrementError: Error {
    case buildMetadataCannotIncrement
    case preReleaseCannotIncrement
}
