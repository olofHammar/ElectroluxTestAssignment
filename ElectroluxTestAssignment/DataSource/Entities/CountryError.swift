//
//  CountryError.swift
//  ElectroluxTestAssignment
//
//  Created by Olof Hammar on 2024-03-18.
//

/// `Enum` representing possible errors that can occur during country-related operations.
enum CountryError: Error {
    
    /// Error indicating an invalid URL was provided.
    case invalidURL
    
    /// Error indicating failure to decode countries from data.
    case failedToDecodeCountries
    
    /// Error indicating an unknown or unexpected error occurred.
    case unknownError
    
    /// Error encapsulating another error that occurred during country-related operations.
    case other(Error)
    
}
