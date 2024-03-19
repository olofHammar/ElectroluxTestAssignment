//
//  CountryDetailViewModel.swift
//  ElectroluxTestAssignment
//
//  Created by Olof Hammar on 2024-03-19.
//

import Foundation
import SwiftUI

final class CountryDetailViewModel: ObservableObject {
    
    let country: CountryItem
    let animationId: Namespace.ID

    private let onTapClose: (() -> Void)?
    
    init(
        country: CountryItem,
        animationId: Namespace.ID,
        onTapClose: (() -> Void)?
    ) {
        self.country = country
        self.animationId = animationId
        self.onTapClose = onTapClose
    }
}
