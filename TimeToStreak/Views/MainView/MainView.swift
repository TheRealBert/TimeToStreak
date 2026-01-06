//
//  MainView.swift
//  TimeToStreak
//
//  Created by Will Habos on 1/4/26.
//

import SwiftUI

struct MainView: View {
    
    @Environment(MainPresentedViews.self) private var mainPresentedViews
    @Environment(UserInputPresentedViews.self) private var userInputPresentedViews
    @Environment(StreakViewModel.self) private var streakVM
    
    var body: some View {
        
        ZStack {
            
            Rectangle()
                .foregroundStyle(Color("Lavender"))
                .ignoresSafeArea()
            
            VStack {
                
                switch mainPresentedViews.currentView {
                case .homeView:
                    Text("HOME VIEW")
                case .createStreaksView:
                    CreateStreakMainView()
                        .padding(.horizontal)
                case .streaksView:
                    StreaksListView()
                        .padding(.horizontal)
                case .goalsView:
                    Text("GOAL VIEW")
                case .settingsView:
                    Text("SETTINGS")
                }
                Spacer()
                
                BottomMenuBar()
                
            }
            
            
        }
    }
}

#Preview {
    MainView()
        .environment(MainPresentedViews())
        .environment(UserInputPresentedViews())
        .environment(StreakViewModel())
}
