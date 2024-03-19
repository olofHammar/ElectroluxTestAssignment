//
//  RootViewModelTests.swift
//  ElectroluxTestAssignmentTests
//
//  Created by Olof Hammar on 2024-03-18.
//

import Foundation
import XCTest
@testable import ElectroluxTestAssignment

final class RootViewModelTests: XCTestCase {
    var sut: RootViewModel!
    var dataSource: CountryDataSource!
    
    override func setUp() {
        super.setUp()
        dataSource = StaticCountryDataSource()
        sut = RootViewModel(countryDataSource: dataSource)
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
    
    func test_present_selected_country_sets_selectedCountry_correctly() {
        let selectedCountry = CountryItem.demoCountry
        
        sut.presentSelectedCountryDetail(for: selectedCountry)
        
        XCTAssertEqual(sut.selectedCountry, selectedCountry)
    }
    
    func test_dismiss_selected_country_resets_selectedCountry_to_nil() {
        let selectedCountry = CountryItem.demoCountry
        
        sut.presentSelectedCountryDetail(for: selectedCountry)
        
        XCTAssertNotNil(sut.selectedCountry)
        
        sut.dismissSelectedCountryDetail()
        
        XCTAssertNil(sut.selectedCountry)
    }
}
