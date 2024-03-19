//
//  ElectroluxTestAssignmentApp.swift
//  ElectroluxTestAssignment
//
//  Created by Olof Hammar on 2024-03-18.
//

import SwiftUI

@main
struct ElectroluxTestAssignmentApp: App {
    
    private let countryDataSource: CountryDataSource = StaticCountryDataSource()
    
    var body: some Scene {
        WindowGroup {
            RootView(countryDataSource: countryDataSource)
                .preferredColorScheme(.dark)
        }
    }
}
