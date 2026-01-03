//
//  DailyHabit.swift
//  TimeToStreak
//
//  Created by Will Habos on 1/2/26.
//

import Foundation

struct DailyHabit: Identifiable, Codable {
    var id = UUID()
    var date: Date
    var topicId: UUID
    var optionId: UUID?         // nil = unset
}
