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
}
