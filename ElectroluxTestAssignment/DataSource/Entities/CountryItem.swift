//
//  CountryItem.swift
//  ElectroluxTestAssignment
//
//  Created by Olof Hammar on 2024-03-18.
//

import Foundation
import SwiftUI

/// An `Entity` representing a country item with essential details.
struct CountryItem: Identifiable, Codable {
    
    /// A unique identifier for the country item.
    var id: String
    
    /// The name of the country.
    let name: String
    
    /// A reference to the flag of the country.
    let flagImageString: String
    
    /// The currency used in the country.
    let currency: String
    
    /// The languages spoken in the country.
    let languages: [String]
    
    /// Initializes a new `CountryItem` with specified details.
    /// - Parameters:
    ///   - name: The name of the country.
    ///   - flagRef: A reference to the flag of the country.
    ///   - currency: The currency used in the country.
    ///   - languages: The languages spoken in the country.
    init(
        id: String,
        name: String,
        flagRef: String,
        currency: String,
        languages: [String]
    ) {
        self.id = id
        self.name = name
        self.flagImageString = flagRef
        self.currency = currency
        self.languages = languages
    }
}

extension CountryItem {
    
    /// Enum defining the coding keys for encoding and decoding `CountryItem`.
    enum CodingKeys: String, CodingKey {
        case id
        case name = "country_name"
        case flagImageString = "country_flag_ref"
        case currency = "country_currency"
        case languages = "country_language"
    }
}

/// Extension providing a static property representing a demo `CountryItem`.
extension CountryItem {
    
    /// A demo `CountryItem` instance representing Canada.
    static let demoCountry: CountryItem = .init(
        id: "canada_id",
        name: "Canada",
        flagRef: "ic_flag_canada",
        currency: "CAD",
        languages: [
            "English",
            "French"
        ]
    )
}
