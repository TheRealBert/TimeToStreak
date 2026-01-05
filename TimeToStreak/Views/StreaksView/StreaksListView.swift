//
//  StreaksListView.swift
//  TimeToStreak
//
//  Created by Will Habos on 1/4/26.
//

import SwiftUI

struct StreaksListView: View {
    
    var body: some View {
        
        VStack(spacing: 15) {
            
            HStack {
                Text("My Streaks")
                    .font(.title3)
                    .bold()
                
                Spacer()
            }
            
            ScrollView {
                
                ForEach(1...20, id: \.self) { index in
                    StreaksListRow()
                }
                
            }

            Spacer()
        }
        
        
    }
}

#Preview {
    StreaksListView()
}
