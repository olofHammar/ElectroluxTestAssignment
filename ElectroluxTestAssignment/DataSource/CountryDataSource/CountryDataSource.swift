//
//  CountryDataSource.swift
//  ElectroluxTestAssignment
//
//  Created by Olof Hammar on 2024-03-18.
//

import Combine
import Foundation

/// `Protocol` defining the interface for a data source responsible for fetching country data.
protocol CountryDataSource {
    
    /// Fetches the list of countries asynchronously.
    /// - Returns: A publisher of the emits an array of `CountryItem` or a `CountryError`
    func fetchCountries() -> AnyPublisher<[CountryItem], CountryError>
}

///  A concrete implementation of the `CountryDataSource` protocol that provides static data from a JSON fixture.
final class StaticCountryDataSource: CountryDataSource {
    
    init() { }
    
    func fetchCountries() -> AnyPublisher<[CountryItem], CountryError> {
        Future<[CountryItem], CountryError>.init { [weak self] promise in
            guard let self else {
                promise(.failure(.unknownError))
                return
            }
            
            do {
                let countries = try self.fetchCountrysJsonFromFixture()
                promise(.success(countries))
            } catch {
                promise(.failure(.failedToDecodeCountries))
            }
        }
        .eraseToAnyPublisher()
    }
    
    /// Fetches country data from a static JSON fixture.
    /// - Throws: A `CountryError` if the JSON-file can't be found or if decoding fails.
    /// - Returns: An array of `CountryItem`.
    private func fetchCountrysJsonFromFixture() throws -> [CountryItem] {
        guard let url = Bundle.main.url(forResource: String.countriesResourceString, withExtension: "json") else {
            throw CountryError.invalidURL
        }
        
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        
        return try decoder.decode([CountryItem].self, from: data)
    }
}

fileprivate extension String {
    static let countriesResourceString: String = "CountriesData"
}
