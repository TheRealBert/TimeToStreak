//
//  HabitOption.swift
//  TimeToStreak
//
//  Created by Will Habos on 1/2/26.
//

import Foundation

struct HabitOption: Identifiable, Codable {
    var id = UUID()
    var topicId: UUID
    var name: String
    var colorHex: String
    var sortOrder: Int
    var active: Bool
}
