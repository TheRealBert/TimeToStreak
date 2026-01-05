//
//  EnterStreakGoalView.swift
//  TimeToStreak
//
//  Created by Will Habos on 1/3/26.
//

import SwiftUI

struct EnterStreakGoalView: View {
    
    @Environment(UserInputPresentedViews.self) private var userInputPresentedViews
    @Environment(StreakViewModel.self) private var streakVM
    
    @Binding var streakTopic: String
    
    var body: some View {
        
        VStack {
            
            Text("Enter a Streak Goal")
                .font(.headline)
                .bold()
            Text("(What do you want to streak?)")
                .font(.footnote)
            
            Spacer()
            
            Text("Example: How many drinks did I have today?")
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.center)
            Text("Example: Did I drink today?")
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.center)
            Text("Example: # of Drinks.")
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.white)
                
                TextField("What do you want to streak?", text: $streakTopic)
                    .padding()
                    .frame(maxHeight: .infinity, alignment: .topLeading)
                    
            }
            .frame(height: 150)
            
            Spacer()
            
            Button {
                streakVM.createStreakTopic(topic: streakTopic)
                userInputPresentedViews.currentView = .streakOptionView
                print(streakVM.streakTopic?.id ?? "Error: No UUID")

            } label: {
                HabitChoiceButton(habitText: "Confirm & Next", habitColor: .black, opacity: streakTopic == "" ? 0.25 : 1.00)
            }
            .disabled(streakTopic == "")
            
        }
    }
}

#Preview {
    EnterStreakGoalView(streakTopic: .constant(""))
        .environment(StreakViewModel())
        .environment(UserInputPresentedViews())
}
