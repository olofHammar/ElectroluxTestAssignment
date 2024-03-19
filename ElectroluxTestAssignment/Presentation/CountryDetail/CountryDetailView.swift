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
            FlagCardView(
                country: vm.country,
                namespaceId: vm.namespaceId
            )
        }
        .onAppear(perform: {
            vm.animateOnAppear()
        })
        .padding(.top, 60)
        .overlay(alignment: .topTrailing) { closeButton }
        .padding(.horizontal, .defaultPadding)
        .maxHeight(.infinity, alignment: .top)
        .background(Color.theme.background100)
    }
    
    private var closeButton: some View {
        Button(action: { vm.dismissCountryDetail() }, label: {
            Image(systemName: "xmark")
                .foregroundColor(Color.theme.textPrimary)
                .bodyHeavy()
                .padding(.x2)
                .background(.ultraThinMaterial)
                .cornerRadius(.x1, corners: [.allCorners])
                .cornerRadius(.x2, corners: [.topRight])
        })
        .opacity(vm.isAnimatingOnAppear ? 1 : 0)
        .allowsHitTesting(vm.isAnimatingOnAppear)
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
