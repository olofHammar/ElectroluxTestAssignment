//
//  RootView.swift
//  ElectroluxTestAssignment
//
//  Created by Olof Hammar on 2024-03-19.
//

import SwiftUI

struct RootView: View {
    @StateObject private var vm: RootViewModel
    @Namespace private var animation

    init(
        countryDataSource: CountryDataSource
    ) {
        self._vm = StateObject(wrappedValue: RootViewModel(
            countryDataSource: countryDataSource
        ))
    }
    
    var body: some View {
        viewsContainer
            .maxWidth(.infinity)
            .background(Color.theme.background100)
    }
    
    private var viewsContainer: some View {
        ZStack(alignment: .topLeading) {
            CountryHeaderView()
                .ignoresSafeArea(edges: .top)
                .opacity(vm.didDismissHeaderView ? 0 : 1)
                .zIndex(1)
            
            listContainer
                .padding(.horizontal, .defaultPadding)
            
            selectedDetailContainer
        }
    }
    
    private var listContainer: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: .x4) {
                ForEach(vm.countryList) { country in
                    FlagCardView(
                        country: country,
                        namespaceId: animation,
                        onTap: { vm.presentSelectedCountryDetail(for: country) }
                    )
                    .opacity(vm.opacityForFlagCard(country))
                    .allowsHitTesting(vm.selectedCountry == nil)
                }
            }
            .padding(.vertical, .defaultScrollTopPadding)
            .padding(.bottom, .defaultScrollBottomPadding)
            .offset(y: .defaultHeaderHeight)
        }
    }
    
    @ViewBuilder
    private var selectedDetailContainer: some View {
        if let selectedCountry = vm.selectedCountry {
            CountryDetailView(
                country: selectedCountry,
                namespaceId: animation,
                onTapClose: { vm.dismissSelectedCountryDetail() }
            )
            .transition(.identity)
        }
    }
}

#Preview {
    RootView(countryDataSource: StaticCountryDataSource())
}
