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
            .padding(.bottom, .defaultLargeContentPadding)
            
            infoSectionRows
        }
        .onAppear(perform: {
            vm.animateOnAppear()
        })
        .padding(.top, 80)
        .overlay(alignment: .topTrailing) { closeButton }
        .padding(.horizontal, .defaultPadding)
        .maxHeight(.infinity, alignment: .top)
        .background(Color.theme.background100)
    }
    
    private var infoSectionRows: some View {
        VStack(spacing: 4) {
            SectionRow(
                iconString: "dollarsign.circle",
                title: String.currencyTitle.uppercased(),
                subtitles: [vm.country.currency],
                cornerRadius: .x2,
                leadingCorner: [.topLeft],
                trailingCorner: [.topRight]
            )
            .offset(x: vm.animationValues[0] ? 0 : .defaultContentOffset)
            
            SectionRow(
                iconString: "bubble.circle",
                title: String.languagesTitle.uppercased(),
                subtitles: vm.country.languages,
                cornerRadius: .x2,
                leadingCorner: [.bottomLeft],
                trailingCorner: [.bottomRight]
            )
            .offset(x: vm.animationValues[1] ? 0 : .defaultContentOffset)
        }
    }
    
    private var closeButton: some View {
        Button(action: { vm.dismissCountryDetail() }, label: {
            Image(systemName: "xmark")
                .foregroundColor(Color.theme.textPrimary)
                .bodyHeavySerif()
                .padding(.x2)
                .background(.ultraThinMaterial)
                .cornerRadius(.x1, corners: [.allCorners])
                .cornerRadius(.x2, corners: [.topRight])
        })
        .opacity(vm.isAnimatingCloseButton ? 1 : 0)
        .allowsHitTesting(vm.isAnimatingCloseButton)
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
