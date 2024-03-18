//
//  CountryError.swift
//  ElectroluxTestAssignment
//
//  Created by Olof Hammar on 2024-03-18.
//

import Foundation

enum CountryError: Error {
    case invalidURL
    case failedToDecodeCountries
    case unknownError
    case other(Error)
}
