//
//  HomeView.swift
//  TimeToStreak
//
//  Created by Will Habos on 1/5/26.
//

import SwiftUI

let cal = Calendar.current
let today = cal.startOfDay(for: .now)

// ---------- Alcohol example ----------
let alcoholTopic = StreakTopic(
    id: UUID(),
    name: "Alcohol",
    startDate: cal.date(byAdding: .day, value: -28, to: today),
    endDate: nil,
    baselineValue: nil
)

let alcoholOptions: [StreakOption] = [
    .init(topicId: alcoholTopic.id, name: "0",   colorHex: "#34C759", sortOrder: 0, active: true, value: 0),
    .init(topicId: alcoholTopic.id, name: "1-2", colorHex: "#0A84FF", sortOrder: 1, active: true, value: -1),
    .init(topicId: alcoholTopic.id, name: "3-4", colorHex: "#FFD60A", sortOrder: 2, active: true, value: -2),
    .init(topicId: alcoholTopic.id, name: "5-6", colorHex: "#FF453A", sortOrder: 3, active: true, value: -3)
]

let alcoholEntries: [StreakEntry] = (0..<28).compactMap { i in
    let d = cal.date(byAdding: .day, value: -i, to: today)!
    if i % 6 == 0 { return nil } // simulate missing days
    let opt = alcoholOptions[i % alcoholOptions.count]
    return StreakEntry(topicId: alcoholTopic.id, date: d, optionId: opt.id)
}

let alcoholPoints = buildBarPoints(
    topic: alcoholTopic,
    options: alcoholOptions,
    entries: alcoholEntries,
    lastNDays: 28,
    useDeviation: false
)
// ---------- Alcohol example ----------

struct HomeView: View {
    
    var body: some View {
        
        VStack {
            
            HStack {
                MiniStreakCalendar()
                Spacer()
                OptionCountWidget()
            }
            .padding(.horizontal, 10)
            
            HStack {
                StreakWidget(streakName: "Longest Streak")
                StreakWidget(streakName: "Current Streak")
            }
            .padding(.horizontal, 10)
            
            DeviationBarWidget(
                title: "Alcohol",
                subtitle: "Down bars indicate drinks",
                points: alcoholPoints,
                yDomain: (-3)...(1)
            )
            
            VStack(spacing: 2) {
                HStack {
                    Text("Active Streaks")
                        .font(.footnote)
                        .bold()
                    Spacer()
                    Text("Status")
                        .font(.footnote)
                        .bold()
                }
                
                Rectangle()
                    .frame(height: 1)
                
            }
            .padding(.horizontal, 5)
            
            ZStack {
                
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(.white)
                
                HStack {
                    
                    Image(systemName: "wineglass")
                        .resizable()
                        .scaledToFit()
                        .padding(10)
                    
                    VStack(alignment: .leading) {
                        Text("Number of Drinks")
                            .font(.caption)
                            .bold()
                        Text("Goal: No drinks for 30 days")
                            .font(.caption2)
                    }
                    
                    Spacer()
                    Circle()
                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [5.0]))
                        .padding(.vertical, 5)
                    
                }
                .padding(.horizontal, 5)
                
            }
            .frame(height: 50)
            
            Spacer()
            
        }
        .padding()
        
        
        
    }
}

#Preview {
    HomeView()
        .background(Color("Lavender"))
}
