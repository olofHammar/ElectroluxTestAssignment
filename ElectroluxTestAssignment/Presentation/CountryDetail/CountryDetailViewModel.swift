//
//  CountryDetailViewModel.swift
//  ElectroluxTestAssignment
//
//  Created by Olof Hammar on 2024-03-19.
//

import Foundation
import SwiftUI

final class CountryDetailViewModel: ObservableObject {
        
    @Published private(set) var isAnimatingOnAppear: Bool = false
    
    let country: CountryItem
    let namespaceId: Namespace.ID

    private let onTapClose: (() -> Void)?
    
    init(
        country: CountryItem,
        namespaceId: Namespace.ID,
        onTapClose: (() -> Void)?
    ) {
        self.country = country
        self.namespaceId = namespaceId
        self.onTapClose = onTapClose
    }
    
    func animateOnAppear() {
        withAnimation(.easeIn(duration: 0.5)) {
            isAnimatingOnAppear = true 
        }
    }
    
    func dismissCountryDetail() {
        self.onTapClose?()
    }
}
