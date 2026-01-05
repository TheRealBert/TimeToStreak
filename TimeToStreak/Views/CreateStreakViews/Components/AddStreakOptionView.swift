//
//  AddStreakOptionView.swift
//  TimeToStreak
//
//  Created by Will Habos on 1/3/26.
//

import SwiftUI

struct AddStreakOptionView: View {
    
    @Environment(UserInputPresentedViews.self) private var userInputPresentedViews
    @Environment(StreakViewModel.self) private var streakVM
    
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
                    streakVM.createStreakOption(topic: streakOption, color: optionColor)
                    
                    print(streakVM.streakOption?.topicId ?? "NO UUID")
                    
                    streakVM.streakOption = nil
                    streakOption = ""
                    
                    print(streakVM.streakOption?.id ?? "NO UUID")

                } label: {
                    HabitChoiceButton(habitText: "Confirm & Add", habitColor: .black, opacity: streakOption == "" ? 0.25 : 1.00)
                }
                .disabled(streakOption == "")
                
                Button {
                    userInputPresentedViews.currentView = .reviewLaunchView
                    
                    print(streakVM.streaks)

                } label: {
                    HabitChoiceButton(habitText: "Confirm & Preview", habitColor: .black, opacity: streakOption == "" ? 0.25 : 1.00)
                }
                .disabled(streakOption == "" && streakVM.streaks.count == 0)
            }
            
            
        }
    }
}

#Preview {
    AddStreakOptionView(streakOption: .constant(""), optionColor: .constant(.white))
        .environment(StreakViewModel())
        .environment(UserInputPresentedViews())
}
