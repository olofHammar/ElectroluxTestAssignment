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
        self.font(.system(.title2, design: .serif).weight(.heavy)).tracking(0.5)
    }
    
    /// Applies an heavy body font to the view.
    /// - Returns: A view with the specified font style.
    func bodyHeavy() -> some View {
        self.font(.system(.body, design: .serif).weight(.heavy)).tracking(0.5)
    }
    
    /// Applies an heavy caption2 font to the view.
    /// - Returns: A view with the specified font style.
    func caption2Heavy() -> some View {
        self.font(.system(.caption2, design: .rounded).weight(.semibold))
    }
    
    /// Applies an semibold footnote font to the view.
    /// - Returns: A view with the specified font style.
    func footnoteSemiboldItalic() -> some View {
        self.font(.system(.footnote, design: .rounded).weight(.semibold).italic())
    }
}
