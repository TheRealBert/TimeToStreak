//
//  HabitChoiceButton.swift
//  TimeToStreak
//
//  Created by Will Habos on 1/3/26.
//

import SwiftUI

struct HabitChoiceButton: View {
    
    var habitText: String
    var habitColor: Color
    var opacity: Double
    
    var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(Color(habitColor))
                .opacity(opacity)
            
            Text(habitText)
                .bold()
                .foregroundStyle(.white)
            
        }
        .frame(height: 60)
    }
}

#Preview {
    HabitChoiceButton(habitText: "0 Drinks", habitColor: .red, opacity: 0.50)
}
