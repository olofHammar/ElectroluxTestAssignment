//
//  View+Shadow.swift
//  ElectroluxTestAssignment
//
//  Created by Olof Hammar on 2024-03-19.
//

import SwiftUI

/// Extension providing a method for applying a default border shadow to a view.
extension View {
    
    /// Applies a default border shadow to the view.
    /// - Returns: A view with the specified border shadow.
    func defaultBorderShadow() -> some View {
        return  self
            .shadow(color: Color.theme.background300, radius: 0.5, x: -0.5, y: -0.5)
            .shadow(color: Color.theme.background200, radius: 0.5, x: 0.5, y: 0.5)
    }
}

