//
//  MainView.swift
//  TimeToStreak
//
//  Created by Will Habos on 1/4/26.
//

import SwiftUI

struct MainView: View {
    
    @Environment(UserInputPresentedViews.self) private var userInputPresentedViews
    @Environment(StreakViewModel.self) private var streakVM
    
    var body: some View {
        
        ZStack {
            
            Rectangle()
                .foregroundStyle(Color("Lavender"))
                .ignoresSafeArea()
            
            VStack {
                CreateStreakMainView()
                Spacer()
                
                BottomMenuBar()
                
            }
            
            
        }
    }
}

#Preview {
    MainView()
        .environment(UserInputPresentedViews())
        .environment(StreakViewModel())
}
