//
//  StreakEntry.swift
//  TimeToStreak
//
//  Created by Will Habos on 1/5/26.
//

import Foundation

struct StreakEntry: Identifiable, Codable {
    var id = UUID()
    var topicId: UUID
    var date: Date              // store startOfDay
    var optionId: UUID?         // nil = not logged / cleared
}
