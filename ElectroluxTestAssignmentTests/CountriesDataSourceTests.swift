//
//  CountriesDataSourceTests.swift
//  ElectroluxTestAssignmentTests
//
//  Created by Olof Hammar on 2024-03-18.
//

import Foundation
import XCTest
@testable import ElectroluxTestAssignment

final class CountriesDataSourceTests: XCTestCase {
    
    private var sut: CountryDataSource!
    
    override func setUp() {
        super.setUp()
        sut = StaticCountryDataSource()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_fetch_countries_returns_correct_number_of_countries() throws {
        let expectedCountriesCount = 10
        let expectation = expectation(description: "Fetch countries")
        
        let cancellable = sut.fetchCountries()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                    
                case .failure(let error):
                    XCTFail("Unexpected failure: \(error)")
                }
            }, receiveValue: { countries in
                XCTAssertEqual(countries.count, expectedCountriesCount)
                
                expectation.fulfill()
            })

        waitForExpectations(timeout: 5, handler: nil)

        cancellable.cancel()
    }
    
    func test_fetch_countries_returns_correct_country_data() throws {
        let expectation = expectation(description: "Fetch countries")

        let cancellable = sut.fetchCountries()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                    
                case .failure(let error):
                    XCTFail("Unexpected failure: \(error)")
                }
            }, receiveValue: { countries in
                for country in countries {
                    XCTAssertNotNil(country.id)
                    XCTAssertNotNil(country.name)
                    XCTAssertNotNil(country.languages)
                    XCTAssertNotNil(country.currency)
                    XCTAssertNotNil(country.flagImageString)
                }
                
                expectation.fulfill()
            })

        waitForExpectations(timeout: 5, handler: nil)

        cancellable.cancel()
    }
    
    func test_fetch_countries_returns_correct_country_name() throws {
        let belgiumCountryId = "belgium_id"
        let expectedCountryName = "Belgium"
        let expectation = expectation(description: "Fetch countries")

        let cancellable = sut.fetchCountries()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                    
                case .failure(let error):
                    XCTFail("Unexpected failure: \(error)")
                }
            }, receiveValue: { countries in
                guard let belgiumCountry = countries.first(where: { $0.id == belgiumCountryId }) else {
                    XCTFail("No country with matching id.")
                    return
                }
                
                XCTAssertEqual(belgiumCountry.name, expectedCountryName)
                
                expectation.fulfill()
            })

        waitForExpectations(timeout: 5, handler: nil)

        cancellable.cancel()
    }
}
