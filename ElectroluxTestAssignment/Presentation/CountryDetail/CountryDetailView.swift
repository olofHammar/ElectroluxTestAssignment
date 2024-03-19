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
        animationId: Namespace.ID,
        onTapClose: (() -> Void)? = nil
    ) {
        self._vm = StateObject(wrappedValue: CountryDetailViewModel(
            country: country,
            animationId: animationId,
            onTapClose: onTapClose
        ))
    }
    
    var body: some View {
        VStack(spacing: 0) {
            FlagCardView(country: vm.country, namespaceId: vm.animationId)
        }
    }
}

struct CountryDetailView_Previews: PreviewProvider {
    @Namespace static var animation
    
    static var previews: some View {
        CountryDetailView(country: .demoCountry, animationId: animation)
    }
}
