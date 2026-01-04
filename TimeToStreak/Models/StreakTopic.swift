//
//  HabitTopic.swift
//  TimeToStreak
//
//  Created by Will Habos on 1/2/26.
//

import Foundation

struct StreakTopic: Identifiable, Codable {
    var id = UUID()
    var name: String
    var startDate: Date?
    var endDate: Date?
}
