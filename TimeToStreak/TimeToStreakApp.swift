//
//  TimeToStreakApp.swift
//  TimeToStreak
//
//  Created by Will Habos on 1/2/26.
//

import SwiftUI

@main
struct TimeToStreakApp: App {
    
    private let streakVM = StreakViewModel()
    private let userInputPresentedViews = UserInputPresentedViews()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(streakVM)
                .environment(userInputPresentedViews)
        }
    }
}
