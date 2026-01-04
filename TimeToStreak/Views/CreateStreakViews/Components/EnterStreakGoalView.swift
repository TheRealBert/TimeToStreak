//
//  EnterStreakGoalView.swift
//  TimeToStreak
//
//  Created by Will Habos on 1/3/26.
//

import SwiftUI

struct EnterStreakGoalView: View {
    
    @Binding var habitName: String
    
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
                
                TextField("What do you want to streak?", text: $habitName)
                    .padding()
                    .frame(maxHeight: .infinity, alignment: .topLeading)
                    
            }
            .frame(height: 150)
            
            Spacer()
            
            Button {
                // TODO: LINK UP

            } label: {
                HabitChoiceButton(habitText: "Confirm & Next", habitColor: .black, opacity: habitName == "" ? 0.25 : 1.00)
            }
            
        }
    }
}

#Preview {
    EnterStreakGoalView(habitName: .constant(""))
}
