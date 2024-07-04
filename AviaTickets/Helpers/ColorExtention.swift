//
//  ColorExtention.swift
//  AviaTickets
//
//  Created by Anatoliy Petrov on 1.7.24..
//

import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

extension Color {
    static let aviaBlack = Color(hex: "#0C0C0C")
    static let aviaGrey1 = Color(hex: "#1D1E20")
    static let aviaGrey2 = Color(hex: "#242529")
    static let aviaGrey3 = Color(hex: "#2F3035")
    static let aviaGrey4 = Color(hex: "#3E3F43")
    static let aviaGrey5 = Color(hex: "#5E5F61")
    static let aviaGrey6 = Color(hex: "#9F9F9F")
    static let aviaGrey7 = Color(hex: "#DBDBDB")
    static let aviaBlue = Color(hex: "#4C95FE")
    static let aviaDarkBlue = Color(hex: "#00427D")
    static let aviaGreen = Color(hex: "#3A633B")
    static let aviaDarkGreen = Color(hex: "#015905")
    static let aviaRed = Color(hex: "#FF5E5E")
    static let aviaOrange = Color(hex: "#F36E36")
}
