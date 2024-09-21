//
//  Ext_Color.swift
//  MedXpress
//
//  Created by Mekhriddin Jumaev on 21/09/24.
//

import SwiftUI

extension Color {
    init(hex: String) {
        if #available(iOS 15.0, *) {
            self.init(uiColor: UIColor(hex: hex))
        } else {
            self.init(UIColor(hex: hex))
        }
    }
    
    /// #F8F8F8
    static let backgoundColor = Color(hex: "#F8F8F8")
    /// #051914
    static let textColor = Color(hex: "#051914")
    /// #4241DD
    static let mainOne = Color(hex: "#076AE2")
    /// #FF516E
    static let redOne = Color(hex: "#FF516E")
    /// #80858E
    static let greyDark: Color = .init(hex: "#80858E")
    /// #01023A
    static let deepPurple: Color = .init(hex: "#01023A")
    /// #F5F5F5
    static let cultured: Color = .init(hex: "#F5F5F5")
    /// #E6E7E8
    static let greyMedium: Color = .init(hex: "#E6E7E8")
    /// ##F9F9F9
    static let greyLight: Color = .init(hex: "#F9F9F9")
    /// #FF516E
    static let errorColor: Color = .init(hex: "#FF516E")
    /// #1A1736
    static let blackOne: Color = Color(hex: "#1A1736")
    
    /// #EBF2FA
    static let blueLight: Color = .init(hex: "#EBF2FA")
    
    /// #F2F4F6
    static let chatCorner: Color = .init(hex: "#F2F4F6")
    
    /// #EBF2FA
    static let chatSubheadline: Color  = .init(hex: "#B3B6BB")
    
    /// #D1D5DB
    static let greyOne: Color  = .init(hex: "#D1D5DB")
    
}

extension Color {
    
    var suitableTextColor: Color {
        isLight() ? .blackOne : .white
    }
    
    func isLight() -> Bool {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        UIColor(self).getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        let luminance = 0.299 * red + 0.587 * green + 0.114 * blue
        return luminance > 0.5
    }
}
