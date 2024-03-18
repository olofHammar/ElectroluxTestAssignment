//
//  CountriesDataSourceTests.swift
//  ElectroluxTestAssignmentTests
//
//  Created by Olof Hammar on 2024-03-18.
//

import Foundation
import XCTest
@testable import ElectroluxTestAssignment

class CountriesDataSourceTests: XCTestCase {
    
    private var dataSource: CountryDataSource!
    
    override func setUp() {
        super.setUp()
        dataSource = StaticCountryDataSource()
    }
    
    override func tearDown() {
        dataSource = nil
        super.tearDown()
    }
    
    func test_fetch_countries_returns_correct_number_of_countries() throws {
        let expectedCountriesCount = 10
        let expectation = expectation(description: "Fetch countries")
        
        let cancellable = dataSource.fetchCountries()
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
}
