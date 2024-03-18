//
//  CountryListViewModelTests.swift
//  ElectroluxTestAssignmentTests
//
//  Created by Olof Hammar on 2024-03-18.
//

import Foundation
import XCTest
@testable import ElectroluxTestAssignment

final class CountryListViewModelTests: XCTestCase {
    var sut: CountryListViewModel!
    var dataSource: CountryDataSource!
    
    override func setUp() {
        super.setUp()
        dataSource = StaticCountryDataSource()
        sut = CountryListViewModel(countryDataSource: dataSource)
    }
    
    override func tearDown() {
        sut = nil
        dataSource = nil
        super.tearDown()
    }
    
    func test_fetchCountries_success() throws {
        let expectation = expectation(description: "Countries fetched successfully")

        sut.fetchCountries()
        
        // Ignore the initial emission (which is an empty array) to wait for the actual country data
        let cancellable = sut.$countryList
            .dropFirst()
            .sink { countries in
                XCTAssertEqual(countries.count, 10)
                XCTAssertEqual(countries[0].name, "Belgium")
                XCTAssertEqual(countries[1].name, "Canada")
                
                expectation.fulfill()
            }
        
        waitForExpectations(timeout: 5, handler: nil)

        cancellable.cancel()
    }
}
