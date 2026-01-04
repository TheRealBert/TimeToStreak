//
//  PreviewAndLaunchView.swift
//  TimeToStreak
//
//  Created by Will Habos on 1/3/26.
//

import SwiftUI

struct PreviewAndLaunchView: View {
    
    var body: some View {
        
        VStack {
            
            Text("Review & Streak")
                .font(.headline)
                .bold()
            Text("Happy Streaking :)")
                .font(.footnote)
            
            Spacer()
            
            HStack {
                Button {
                    // TODO: LINK UP

                } label: {
                    HabitChoiceButton(habitText: "Add More Options", habitColor: .black, opacity: 1.00)
                }
                
                Button {
                    // TODO: LINK UP

                } label: {
                    HabitChoiceButton(habitText: "Let's Go Streaking!", habitColor: .black, opacity: 1.00)
                }
            }
            
            
        }
    }
}

#Preview {
    PreviewAndLaunchView()
}
