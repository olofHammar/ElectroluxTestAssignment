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
        ZStack(alignment: .topLeading) {
            CountryHeaderView()
                .zIndex(1)
            
            listContainer
                .padding(.horizontal, .defaultPadding)
        }
        .ignoresSafeArea(edges: .top)
        .maxWidth(.infinity)
        .background(Color.theme.background100)
    }
    
    private var listContainer: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: .x4) {
                ForEach(vm.countryList) { country in
                    FlagCardView(country: country, namespaceId: animation)
                }
            }
            .padding(.vertical, .defaultScrollTopPadding)
            .padding(.bottom, .defaultScrollBottomPadding)
            .offset(y: .defaultHeaderHeight + .defaultLargeContentPadding)
        }
    }
}

#Preview {
    RootView(countryDataSource: StaticCountryDataSource())
}
