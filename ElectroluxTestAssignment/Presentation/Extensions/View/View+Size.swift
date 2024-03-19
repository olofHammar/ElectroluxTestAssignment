//
//  View+Size.swift
//  ElectroluxTestAssignment
//
//  Created by Olof Hammar on 2024-03-19.
//

import SwiftUI

/// Extension providing convenient methods for setting view dimensions.
extension View {
    
    /// Sets the height of the view.
    /// - Parameters:
    ///   - value: The height value to set. Pass `nil` to use intrinsic height.
    ///   - alignment: The alignment within the frame.
    /// - Returns: A view with the specified height.
    @inlinable public func height(_ value: CGFloat?, alignment: Alignment = .center) -> some View {
        self.frame(height: value, alignment: alignment)
    }

    /// Sets the width of the view.
    /// - Parameters:
    ///   - value: The width value to set. Pass `nil` to use intrinsic width.
    ///   - alignment: The alignment within the frame.
    /// - Returns: A view with the specified width.
    @inlinable public func width(_ value: CGFloat?, alignment: Alignment = .center) -> some View {
        self.frame(width: value, alignment: alignment)
    }

    /// Sets the maximum height of the view.
    /// - Parameters:
    ///   - value: The maximum height value to set.
    ///   - alignment: The alignment within the frame.
    /// - Returns: A view with the specified maximum height.
    @inlinable public func maxHeight(_ value: CGFloat?, alignment: Alignment = .center) -> some View {
        self.frame(maxHeight: value, alignment: alignment)
    }

    /// Sets the maximum width of the view.
    /// - Parameters:
    ///   - value: The maximum width value to set.
    ///   - alignment: The alignment within the frame.
    /// - Returns: A view with the specified maximum width.
    @inlinable public func maxWidth(_ value: CGFloat?, alignment: Alignment = .center) -> some View {
        self.frame(maxWidth: value, alignment: alignment)
    }
}
