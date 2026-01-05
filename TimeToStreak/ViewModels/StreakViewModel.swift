//
//  StreakViewModel.swift
//  TimeToStreak
//
//  Created by Will Habos on 1/3/26.
//

import Observation
import Foundation
import SwiftUI
import UIKit

@MainActor
@Observable
final class StreakViewModel {
    
    var streaks: [StreakOption] = []
    var streakOption: StreakOption?
    var streakTopic: StreakTopic?
    
    private func addStreakOptionToStreaks(streakOption: StreakOption) {
        streaks.append(streakOption)
    }
    
    func createStreakTopic(topic: String) {
        streakTopic = StreakTopic(name: topic)
    }
    
    func createStreakOption(topic: String, color: Color) {
        
        if let hex = color.toHex() {
            streakOption = StreakOption(topicId: streakTopic?.id ?? UUID(), name: topic, colorHex: hex, sortOrder: 1, active: true)
        }
        
        if streakOption != nil {
            addStreakOptionToStreaks(streakOption: streakOption!)
        } else {
            print("Error appending StreakOption. StreakOption nil")
        }
        
    }
    
}

extension Color {

    /// Converts Color to "#RRGGBB"
    func toHex() -> String? {
        let uiColor = UIColor(self)

        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0

        guard uiColor.getRed(&r, green: &g, blue: &b, alpha: &a) else {
            return nil
        }

        return String(
            format: "#%02X%02X%02X",
            Int(r * 255),
            Int(g * 255),
            Int(b * 255)
        )
    }
}

extension Color {

    init(hex: String) {
        var s = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        if s.hasPrefix("#") { s.removeFirst() }

        // Default alpha = 255
        var a: UInt64 = 255
        var r: UInt64 = 0
        var g: UInt64 = 0
        var b: UInt64 = 0

        if s.count == 8 {
            Scanner(string: s).scanHexInt64(&a)
            r = (a >> 16) & 0xFF
            g = (a >> 8) & 0xFF
            b = a & 0xFF
            a = (a >> 24) & 0xFF
        } else if s.count == 6 {
            Scanner(string: s).scanHexInt64(&r)
            g = (r >> 8) & 0xFF
            b = r & 0xFF
            r = (r >> 16) & 0xFF
        }

        self = Color(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
