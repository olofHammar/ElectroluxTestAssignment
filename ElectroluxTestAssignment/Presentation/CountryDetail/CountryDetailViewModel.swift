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
    
    func dismissCountryDetail() {
        onTapClose?()
    }
}
