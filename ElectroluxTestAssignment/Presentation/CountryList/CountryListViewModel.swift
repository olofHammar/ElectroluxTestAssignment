//
//  CountryListViewModel.swift
//  ElectroluxTestAssignment
//
//  Created by Olof Hammar on 2024-03-18.
//

import Combine
import Foundation

final class CountryListViewModel: ObservableObject {
    
    @Published private(set) var countryList: [CountryItem] = []
    
    private let dataSource: CountryDataSource
    
    private var countrySubscription: AnyCancellable?
    
    init(
        countryDataSource: CountryDataSource
    ) {
        self.dataSource = countryDataSource
    }
    
    func fetchCountries() {
        countrySubscription = dataSource.fetchCountries()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                if case let .failure(error) = completion {
                    print("Error fetching countries: \(error)")
                }
            }, receiveValue: { [weak self] countries in
                self?.countryList = countries
            })
    }
}
