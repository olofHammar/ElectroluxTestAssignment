//
//  CountryDetailView.swift
//  ElectroluxTestAssignment
//
//  Created by Olof Hammar on 2024-03-19.
//

import SwiftUI

struct CountryDetailView: View {
    @StateObject private var vm: CountryDetailViewModel
    
    init(
        country: CountryItem,
        namespaceId: Namespace.ID,
        onTapClose: (() -> Void)? = nil
    ) {
        self._vm = StateObject(wrappedValue: CountryDetailViewModel(
            country: country,
            namespaceId: namespaceId,
            onTapClose: onTapClose
        ))
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Button("CLOSE", action: vm.dismissCountryDetail)
            
            FlagCardView(
                country: vm.country,
                namespaceId: vm.namespaceId
            )
        }
        .padding(.top, 60)
        .padding(.horizontal, .defaultPadding)
        .maxHeight(.infinity, alignment: .top)
        .background(Color.theme.background100)
    }
}

struct CountryDetailView_Previews: PreviewProvider {
    @Namespace static var animation
    
    static var previews: some View {
        CountryDetailView(
            country: .demoCountry,
            namespaceId: animation
        )
    }
}
