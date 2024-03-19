//
//  View+FontStyle.swift
//  ElectroluxTestAssignment
//
//  Created by Olof Hammar on 2024-03-19.
//

import SwiftUI

/// Extension providing a convenience method for applying an italic heavy title font to a view.
extension View {
    
    /// Applies an italic heavy title font to the view.
    /// - Returns: A view with the specified font style.
    func titleItalicHeavy() -> some View {
        self.font(.system(.title, design: .serif).weight(.heavy).italic())
    }
    
    /// Applies an heavy title2 font to the view.
    /// - Returns: A view with the specified font style.
    func title2Heavy() -> some View {
        self.font(.system(.title2, design: .serif).weight(.heavy))
    }
}
