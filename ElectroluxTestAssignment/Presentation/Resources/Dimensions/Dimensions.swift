//
//  Dimensions.swift
//  ElectroluxTestAssignment
//
//  Created by Olof Hammar on 2024-03-19.
//

import Foundation

/// Extension providing default CGFloat values commonly used in layouts.
extension CGFloat {
    
    /// The default padding value used in layouts.
    static var defaultPadding: CGFloat { .x2 }

    /// The default small padding value used in layouts.
    static var defaultSmallContentPadding: CGFloat { .x1 + 4 }
    
    /// The default large padding value used in layouts.
    static var defaultLargeContentPadding: CGFloat { .x4 }
    
    /// The default scrollview top padding value used in layouts.
    static var defaultScrollTopPadding: CGFloat { .x4 * 2 }
    
    /// The default scrollview bottom padding value used in layouts.
    static var defaultScrollBottomPadding: CGFloat { 100 }
    
    /// The default corner radius value used in layouts.
    static var defaultCornerRadius: CGFloat { .x2 }

    /// The default height for header views.
    static let defaultHeaderHeight: CGFloat = 100
    
    /// The default height for flag images.
    static let defaultFlagImageHeight: CGFloat = 140
    
    /// The default height for icon images.
    static let defaultIconHeight: CGFloat = 36
    
    /// The base value for multiplication.
    static var x1: CGFloat = 8
    
    /// The result of multiplying `x1` by 2.
    static var x2: CGFloat = x1 * 2
    
    /// The result of multiplying `x1` by 3.
    static var x3: CGFloat = x1 * 3
    
    /// The result of multiplying `x1` by 4.
    static var x4: CGFloat = x1 * 4
}
