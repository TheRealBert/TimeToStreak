//
//  MiniStreakCalendar.swift
//  TimeToStreak
//
//  Created by Will Habos on 1/5/26.
//

import SwiftUI

struct MiniStreakCalendar: View {
    
    private var columns: [GridItem] = Array(repeating: GridItem(.flexible(minimum: 25), spacing: 4), count: 7)
    
    private var daysOfWeek: [String] = ["S", "M", "T", "W", "T", "F", "S"]
    
    var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(.white)
                
            VStack {
                
                Text("June 2026")
                    .padding(.vertical, 5)
                    .font(.caption)
                    .bold()
                
                HStack(spacing: 0) {
                    ForEach(daysOfWeek, id: \.self) { day in
                        Text(day)
                            .frame(width: 28.5)
                            .bold()
                            .font(.caption)
                    }
                }
                .frame(width: 200)
                
                LazyVGrid(columns: columns, spacing: 4) {
                    
                    ForEach(1...6, id: \.self) { day in
                        
                        ZStack {
                            Circle()
                                .frame(height: 15)
                                .foregroundStyle(.white)
                        }
                            
                    }
                    
                    ForEach(7...38, id: \.self) { index in
                        
                        Circle()
                            .frame(height: 15)
                            .foregroundStyle(.yellow)
                        
                    }
                    
                }
                .frame(width: 200)
//                .padding(.bottom)
                
                Spacer()
                
            }
            
        }
        .frame(width: 200, height: 180)
        
        
        
    }
}

#Preview {
    MiniStreakCalendar()
}
