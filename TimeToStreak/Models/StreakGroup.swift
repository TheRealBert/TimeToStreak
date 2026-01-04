//
//  HabitGroup.swift
//  TimeToStreak
//
//  Created by Will Habos on 1/3/26.
//

import Foundation

struct StreakGroup: Identifiable, Codable {
    var id = UUID()
    var name: String
    var topicIds: [UUID]
}
