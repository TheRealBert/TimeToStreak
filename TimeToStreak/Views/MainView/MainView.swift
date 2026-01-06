//
//  MainView.swift
//  TimeToStreak
//
//  Created by Will Habos on 1/4/26.
//

import SwiftUI

struct MainView: View {
    
    @Environment(MainPresentedViews.self) private var mainPresentedViews

    var body: some View {
        
        @Bindable var mainPresentedViews = mainPresentedViews

        VStack {
            
            TabView(selection: $mainPresentedViews.currentView) {
                Rectangle()
                    .foregroundStyle(.red)
                    .tag(MainPresentedViews.PageView.homeView)

                StreaksListView()
                    .padding(.horizontal)
                    .tag(MainPresentedViews.PageView.streaksView)

                CreateStreakMainView()
                    .tag(MainPresentedViews.PageView.createStreaksView)
                
                Rectangle()
                    .foregroundStyle(.blue)
                    .tag(MainPresentedViews.PageView.goalsView)

                Rectangle()
                    .foregroundStyle(.yellow)
                    .tag(MainPresentedViews.PageView.settingsView)
            }

            .tabViewStyle(.page(indexDisplayMode: .never))

            BottomMenuBar()
        
        }
    }
}

#Preview {
    MainView()
        .environment(MainPresentedViews())
        .environment(UserInputPresentedViews())
        .environment(StreakViewModel())
}
