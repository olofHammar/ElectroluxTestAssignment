//
//  Color+Theme.swift
//  ElectroluxTestAssignment
//
//  Created by Olof Hammar on 2024-03-19.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme() 
}

struct ColorTheme {
    let background100 = Color("Colors/Background/B100")
    let background200 = Color("Colors/Background/B200")
    let background300 = Color("Colors/Background/B300")
    let textPrimary = Color("Colors/Text/Primary")
    let textSecondary = Color("Colors/Text/Secondary")
    let textAccent = Color("Colors/Text/Accent")
}
