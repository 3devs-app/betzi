//
//  GridGuide.swift
//  Betzi
//
//  Created by Daniel Fernandez Yopla on 12.06.2022.
//

import UIKit

public enum Spacing {
    /// 2 pts.
    public static let xxxSmall: CGFloat = 2
    /// 4 pts.
    public static let xxSmall: CGFloat = 4
    /// 8 pts.
    public static let xSmall: CGFloat = 8
    /// 12 pts.
    public static let small: CGFloat = 12
    /// 16 pts.
    public static let medium: CGFloat = 16
    /// 20 pts.
    public static let xMedium: CGFloat = 20
    /// 24 pts.
    public static let large: CGFloat = 24
    /// 32 pts.
    public static let xLarge: CGFloat = 32
    /// 44 pts.
    public static let xxLarge: CGFloat = 44
    /// 60 pts.
    public static let xxxLarge: CGFloat = 60

    /// Used so that the content of scroll view can be scrolled above the submit button when full
    static let tabBottomPadding: CGFloat = 50
}

public extension CGFloat {
    /// 2 pts
    static let xxxSmall: CGFloat = Spacing.xxxSmall
    /// 4 pts.
    static let xxSmall: CGFloat = Spacing.xxSmall
    /// 8 pts.
    static let xSmall: CGFloat = Spacing.xSmall
    /// 12 pts.
    static let small: CGFloat = Spacing.small
    /// 16 pts.
    static let medium: CGFloat = Spacing.medium
    /// 20 pts.
    static let xMedium: CGFloat = Spacing.xMedium
    /// 24 pts.
    static let large: CGFloat = Spacing.large
    /// 32 pts.
    static let xLarge: CGFloat = Spacing.xLarge
    /// 44 pts.
    static let xxLarge: CGFloat = Spacing.xxLarge
    /// 60 pts.
    static let xxxLarge: CGFloat = Spacing.xxxLarge
}
