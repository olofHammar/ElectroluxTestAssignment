//
//  CountryDetailViewModel.swift
//  ElectroluxTestAssignment
//
//  Created by Olof Hammar on 2024-03-19.
//

import Foundation
import SwiftUI

final class CountryDetailViewModel: ObservableObject {
    @Published private(set) var isAnimatingCloseButton: Bool = false
    @Published private(set) var animationValues: [Bool] = [false, false]
    
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
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.32) {
            for (index, _) in self.animationValues.enumerated() {
                DispatchQueue.main.asyncAfter(deadline: .now() + (Double(index) * 0.16)) {
                    withAnimation(.spring) {
                        self.animationValues[index] = true
                    }
                }
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            withAnimation(.easeInOut(duration: 0.4)) {
                self.isAnimatingCloseButton = true 
            }
        }
    }
    
    func dismissCountryDetail() {
        self.onTapClose?()
    }
}
