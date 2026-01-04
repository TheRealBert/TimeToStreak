//
//  CreateHabitMainView.swift
//  TimeToStreak
//
//  Created by Will Habos on 1/3/26.
//

import SwiftUI

struct CreateStreakMainView: View {
    
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
                    HabitChoiceButton(habitText: streakOption == "" ? "Add Streak Option" : streakOption, habitColor: optionColor, opacity: 0.25)
                    
                    HabitChoiceButton(habitText: "1 - 2 Drinks", habitColor: .blue, opacity: 0.25)

                    HabitChoiceButton(habitText: "3 - 4 Drinks", habitColor: .green, opacity: 0.25)
                    
                    HabitChoiceButton(habitText: "5 - 6 Drinks", habitColor: .yellow, opacity: 0.25)

                    HabitChoiceButton(habitText: "7+ Drinks", habitColor: .purple, opacity: 0.25)
                    
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
                        
//                    EnterStreakGoalView(habitName: $habitName)
                    AddStreakOptionView(streakOption: $streakOption, optionColor: $optionColor)
//                    PreviewAndLaunchView()
                    .padding()
                    
                }
                .frame(height: 400) // 400 or 150
                
            }
            
        }
        .padding(.horizontal)
        .padding(.vertical, 50)

    }
}

#Preview {
    CreateStreakMainView()
}
