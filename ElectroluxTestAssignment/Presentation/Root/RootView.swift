//
//  RootView.swift
//  ElectroluxTestAssignment
//
//  Created by Olof Hammar on 2024-03-19.
//

import SwiftUI

struct RootView: View {
    @StateObject private var vm: RootViewModel
    @Namespace var animation

    init(
        countryDataSource: CountryDataSource
    ) {
        self._vm = StateObject(wrappedValue: RootViewModel(
            countryDataSource: countryDataSource
        ))
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Text("COUNTRY LIST")
                .foregroundStyle(Color.theme.textPrimary)
                .titleItalicHeavy()
                .maxWidth(.infinity)
                .maxHeight(80, alignment: .bottom)
                .padding(.vertical, 24)
                .background(headerBackground)
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
            .padding(.top, 54)
            .offset(y: 120)
        }
    }
    
    private var headerBackground: some View {
        Color.theme.background100
            .shadow(color: .black.opacity(0.2), radius: 2, x: 0, y: 2)
            .shadow(color: .black, radius: 8, x: 0, y: 5)
    }
}

#Preview {
    RootView(countryDataSource: StaticCountryDataSource())
}
