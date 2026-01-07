//
//  StreaksListView.swift
//  TimeToStreak
//
//  Created by Will Habos on 1/4/26.
//

import SwiftUI

struct StreaksListView: View {
    
    @Environment(StreakViewModel.self) private var streakVM
    
    var body: some View {
        
        VStack(spacing: 15) {
            
            HStack {
                Text("My Streaks")
                    .font(.title3)
                    .bold()
                
                Spacer()
            }
            
            ScrollView {
                
                ForEach(streakVM.allStreakTopics, id: \.id) { topic in
                    StreaksListRow(streakTopic: topic)
                }
                
            }
            
        }
        
    }
}

#Preview {
    StreaksListView()
}
