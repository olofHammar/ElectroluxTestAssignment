//
//  RootView.swift
//  ElectroluxTestAssignment
//
//  Created by Olof Hammar on 2024-03-19.
//

import SwiftUI

struct RootView: View {
    @StateObject private var vm: RootViewModel
    
    init(
        countryDataSource: CountryDataSource
    ) {
        self._vm = StateObject(wrappedValue: RootViewModel(
            countryDataSource: countryDataSource
        ))
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(vm.countryList) { country in
                Text(country.name)
            }
        }
        .padding(.defaultPadding)
        .maxWidth(.infinity, alignment: .leading)
    }
}

#Preview {
    RootView(countryDataSource: StaticCountryDataSource())
}
