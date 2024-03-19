//
//  Color+Theme.swift
//  ElectroluxTestAssignment
//
//  Created by Olof Hammar on 2024-03-19.
//

import Foundation
import SwiftUI

extension Color {
    
    /// A static property representing the application's color theme.
    static let theme = ColorTheme()
}

/// A utility structure defining a color theme with specific color values.
struct ColorTheme {
    
    /// The color for background with darkest shade.
    let background100: Color
    
    /// The color for background with medium shade.
    let background200: Color
    
    /// The color for background with lightest shade.
    let background300: Color
    
    /// The primary text color.
    let textPrimary: Color
    
    /// The secondary text color.
    let textSecondary: Color
    
    /// The accent text color.
    let textAccent: Color
    
    /// Initializes a new `ColorTheme` with specified color values.
    init() {
        self.background100 = Color("Colors/Background/B100")
        self.background200 = Color("Colors/Background/B200")
        self.background300 = Color("Colors/Background/B300")
        self.textPrimary = Color("Colors/Text/Primary")
        self.textSecondary = Color("Colors/Text/Secondary")
        self.textAccent = Color("Colors/Text/Accent")
    }
}
