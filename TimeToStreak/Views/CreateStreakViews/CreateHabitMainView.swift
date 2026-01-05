//
//  CreateHabitMainView.swift
//  TimeToStreak
//
//  Created by Will Habos on 1/3/26.
//

import SwiftUI

struct CreateStreakMainView: View {
    
    @Environment(UserInputPresentedViews.self) private var userInputPresentedViews
    @Environment(StreakViewModel.self) private var streakVM
    
    @State var habitName: String = ""
    @State var streakOption: String = ""
    @State var optionColor: Color = .gray
    @State var streakOptions: [StreakOption] = []
    
    var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 30)
                .stroke(style: StrokeStyle(lineWidth: 1.0))
            
            VStack {
                
                Text(habitName == "" ? "Streak Goal" : "\(habitName)")
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .bold()
                    .padding(.bottom, 5)
                
                HStack(alignment: .center, spacing: 5) {
                    
                    Image(systemName: "calendar")
                        .resizable()
                        .scaledToFit()
                        .padding(2)
                    
                    Text(Date(), style: .date)
                        .font(.subheadline)
                    
                }
                .padding(.bottom)
                .frame(height: 35)
                
                ScrollView {
                    
                    ForEach(streakVM.streaks) { streak in
                        HabitChoiceButton(habitText: streak.name == "" ? "Add Streak Option" : streak.name, habitColor: Color(hex:streak.colorHex), opacity: 0.25)
                    }
                    
                    
                    
//                    HabitChoiceButton(habitText: "1 - 2 Drinks", habitColor: .blue, opacity: 0.25)
//
//                    HabitChoiceButton(habitText: "3 - 4 Drinks", habitColor: .green, opacity: 0.25)
//                    
//                    HabitChoiceButton(habitText: "5 - 6 Drinks", habitColor: .yellow, opacity: 0.25)
//
//                    HabitChoiceButton(habitText: "7+ Drinks", habitColor: .purple, opacity: 0.25)
                    
                    Spacer()
                        .frame(height: 400)
                }
                
                Spacer()
                
            }
            .padding()
            
            VStack {
                
                Spacer()
                
                ZStack {
                    
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundStyle(.gray)
                    
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(style: StrokeStyle(lineWidth: 1))
                        
                    switch userInputPresentedViews.currentView {
                        
                    case .goalView:
                        EnterStreakGoalView(streakTopic: $habitName)
                            .padding()
                    case .streakOptionView:
                        AddStreakOptionView(streakOption: $streakOption, optionColor: $optionColor)
                            .padding()
                    case .reviewLaunchView:
                        ReviewAndLaunchView()
                            .padding()
                        
                    }
                    
                    
                }
                .frame(height: userInputPresentedViews.currentView == .reviewLaunchView ? 150 : 400)
                
            }
            
        }
        .padding(.horizontal)
        .padding(.vertical, 50)

    }
}

#Preview {
    CreateStreakMainView()
        .environment(UserInputPresentedViews())
        .environment(StreakViewModel())
}
