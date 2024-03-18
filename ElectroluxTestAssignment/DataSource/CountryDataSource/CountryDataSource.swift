//
//  CountryDataSource.swift
//  ElectroluxTestAssignment
//
//  Created by Olof Hammar on 2024-03-18.
//

import Combine
import Foundation

protocol CountryDataSource {
    func fetchCountries() -> AnyPublisher<[CountryItem], CountryError>
}

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
