//
//  View+FontStyle.swift
//  ElectroluxTestAssignment
//
//  Created by Olof Hammar on 2024-03-19.
//

import SwiftUI

/// Extension providing convenience methods for applying a specific font style to a view.
extension View {
    
    /// Applies an italic heavy title font with serif design  to the view.
    /// - Returns: A view with the specified font style.
    func titleItalicHeavySerif() -> some View {
        self.font(.system(.title, design: .serif).weight(.heavy).italic())
    }
    
    /// Applies an heavy title2 font with serif design to the view.
    /// - Returns: A view with the specified font style.
    func title2HeavySerif() -> some View {
        self.font(.system(.title2, design: .serif).weight(.heavy)).tracking(0.5)
    }
    
    /// Applies an heavy body font with serif design to the view.
    /// - Returns: A view with the specified font style.
    func bodyHeavySerif() -> some View {
        self.font(.system(.body, design: .serif).weight(.heavy)).tracking(0.5)
    }
    
    /// Applies an heavy caption font with rounded design to the view.
    /// - Returns: A view with the specified font style.
    func captionHeavyRounded() -> some View {
        self.font(.system(.caption, design: .rounded).weight(.semibold))
    }
    
    /// Applies an heavy caption2 font with rounded design to the view.
    /// - Returns: A view with the specified font style.
    func caption2HeavyRounded() -> some View {
        self.font(.system(.caption2, design: .rounded).weight(.semibold))
    }
    
    /// Applies an semibold footnote font with rounded design to the view.
    /// - Returns: A view with the specified font style.
    func footnoteSemiboldItalicRounded() -> some View {
        self.font(.system(.footnote, design: .rounded).weight(.semibold).italic())
    }
}
