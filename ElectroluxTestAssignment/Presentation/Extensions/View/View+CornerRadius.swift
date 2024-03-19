//
//  View+CornerRadius.swift
//  ElectroluxTestAssignment
//
//  Created by Olof Hammar on 2024-03-19.
//

import SwiftUI

/// Extension providing a method for applying a corner radius to specific corners of a view.
extension View {
    
    /// Applies a corner radius to specific corners of the view.
    /// - Parameters:
    ///   - radius: The radius of the corners.
    ///   - corners: The corners to which the radius should be applied.
    /// - Returns: A view with the specified corner radius.
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

/// Helper shape for setting corner radius to specific corners.
fileprivate struct RoundedCorner: Shape {
    
    /// The radius of the corners.
    var radius: CGFloat = .infinity
    
    /// The corners to which the radius should be applied.
    var corners: UIRectCorner = .allCorners

    /// Defines the path of the shape.
    /// - Parameter rect: The rectangle in which the shape will be drawn.
    /// - Returns: The path of the shape.
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
