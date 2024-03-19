//
//  RootViewModel.swift
//  ElectroluxTestAssignment
//
//  Created by Olof Hammar on 2024-03-18.
//

import Combine
import Foundation
import SwiftUI

final class RootViewModel: ObservableObject {
    @Published private(set) var countryList: [CountryItem] = []
    @Published private(set) var selectedCountry: CountryItem?
    @Published private(set) var didDismissHeaderView: Bool = false
    @Published private(set) var isPresentingCountryDetail: Bool = false
            
    private let dataSource: CountryDataSource
    private var countrySubscription: AnyCancellable?
    
    init(
        countryDataSource: CountryDataSource
    ) {
        self.dataSource = countryDataSource
        
        fetchCountries()
    }
    
    deinit {
        countrySubscription?.cancel()
        countrySubscription = nil
    }
    
    func presentSelectedCountryDetail(for country: CountryItem) {
        didDismissHeaderView = true
        
        withAnimation(.easeOut(duration: 0)) {
            isPresentingCountryDetail = true
        }
        
        withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
            selectedCountry = country
        }
    }
    
    func dismissSelectedCountryDetail() {
        didDismissHeaderView = false
        
        withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
            isPresentingCountryDetail = false
            selectedCountry = nil
        }
    }
    
    func opacityForFlagCard(_ country: CountryItem) -> Double {
        isPresentingCountryDetail ? (isSelectedCountry(country) ? 1 : 0) : 1
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
    
    private func isSelectedCountry(_ country: CountryItem) -> Bool {
        country == selectedCountry
    }
}
