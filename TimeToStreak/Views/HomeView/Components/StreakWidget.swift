//
//  LongestStreakWidget.swift
//  TimeToStreak
//
//  Created by Will Habos on 1/5/26.
//

import SwiftUI

struct StreakWidget: View {
    
    var streakName: String
    
    var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(.white)
            
            HStack {
                
                Image(systemName: "flame.fill")
                    .resizable()
                    .scaledToFit()
                    .padding(.vertical)
                    .foregroundStyle(.red)
                
                VStack(alignment: .center) {
                    Text(streakName)
                        .font(.caption2)
                        .multilineTextAlignment(.center)
                    Text("25 Days")
                        .font(.footnote)
                        .bold()
                }

            }
            .padding(.horizontal, 5)

        }
        .frame(height: 60)
    }
}

#Preview {
    StreakWidget(streakName: "Longest Streak")
}
