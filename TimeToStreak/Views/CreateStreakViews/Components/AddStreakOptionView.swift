//
//  AddStreakOptionView.swift
//  TimeToStreak
//
//  Created by Will Habos on 1/3/26.
//

import SwiftUI

struct AddStreakOptionView: View {
    
    @Binding var streakOption: String
    @Binding var optionColor: Color
    
    var body: some View {
        
        VStack {
            
            Text("Add a Streak Option")
                .font(.headline)
                .bold()
            Text("(Create an option for you to choose each day.)")
                .font(.footnote)
            
            Spacer()
            
            HStack {
                VStack {
                    Text("Example: 0 Drinks")
                        .font(.footnote)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.center)
                    Text("Example: 3 - 5 Drinks")
                        .font(.footnote)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.center)
                    Text("Example: I drank today.")
                        .font(.footnote)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.center)
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(.white)
                    
                    ColorPicker("Choose Option Color", selection: $optionColor)
                        .font(.footnote)
                        .multilineTextAlignment(.trailing)
                        .padding()
                }
                .frame(width: 150)
                    
            }
            .frame(height: 75)
            
            
            Spacer()
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.white)
                
                TextField("Add a streak option.", text: $streakOption)
                    .padding()
                    .frame(maxHeight: .infinity, alignment: .topLeading)
                    
            }
            .frame(height: 150)
            
            Spacer()
            
            HStack {
                Button {
                    // TODO: LINK UP

                } label: {
                    HabitChoiceButton(habitText: "Confirm & Add", habitColor: .black, opacity: streakOption == "" ? 0.25 : 1.00)
                }
                
                Button {
                    // TODO: LINK UP

                } label: {
                    HabitChoiceButton(habitText: "Confirm & Preview", habitColor: .black, opacity: streakOption == "" ? 0.25 : 1.00)
                }
            }
            
            
        }
    }
}

#Preview {
    AddStreakOptionView(streakOption: .constant("1 - Drinks"), optionColor: .constant(.white))
}
