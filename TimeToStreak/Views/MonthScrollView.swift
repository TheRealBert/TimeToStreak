//
//  MonthScrollView.swift
//  TimeToStreak
//
//  Created by Will Habos on 1/2/26.
//

import SwiftUI

struct MonthScrollView: View {
    
    private let calendar = Calendar.current
    
    private var startDate: Date = Calendar.current.date(byAdding: DateComponents(year: -1), to: Date()) ?? Date()
    private var endDate: Date {
        let calendar = Calendar.current
        let startOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: Date()))!
        return calendar.date(byAdding: DateComponents(month: 1, second: -1), to: startOfMonth)!
    }
    
    private var columns: [GridItem] = Array(repeating: GridItem(.flexible(minimum: 25), spacing: 4), count: 7)
    
    private var days: [Date] {
            // Generate start-of-day dates to avoid DST/timezone weirdness
            let start = calendar.startOfDay(for: startDate)
            let end = calendar.startOfDay(for: endDate)

            var result: [Date] = []
            var d = start
            while d <= end {
                result.append(d)
                d = calendar.date(byAdding: .day, value: 1, to: d)!  // step by 1 day
            }
            return result
        }
    
    private var leadingBlanks: Int {
            let firstOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: startDate))!
            let weekdayIndex = calendar.component(.weekday, from: firstOfMonth) // 1=Sun...7=Sat
            return weekdayIndex // 0...6
        }
    
    var body: some View {
        
        ScrollView {
            
            Text(startDate, format: .dateTime)
            
                    LazyVGrid(columns: columns, spacing: 4) {

                        // DEBUG: make blanks visible (change back to .clear later)
                        ForEach(0..<leadingBlanks, id: \.self) { _ in
                            Rectangle()
                                .fill(.clear)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .frame(minHeight: 50)
                        }

                        ForEach(days.indices, id: \.self) { index in
                            
                            if Calendar.current.dateComponents([.day], from: days[index]).day! == 1 {
                                
                                ForEach(1...7, id: \.self) {_ in
                                    Rectangle()
                                        .fill(.clear)
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                        .frame(minHeight: 50)
                                }
                            
                            } // TODO: DOUBLE CHECK FOR INSTANCE ISSUE WITH NON UNIQUE ID
                            VStack(alignment: .center, spacing: 0) {
                                
                                Text(days[index], format: .dateTime.month(.abbreviated))
                                    .font(.caption)
                                    .bold()
                                    .foregroundStyle(Calendar.current.dateComponents([.day], from: days[index]).day! == 1 ? .black : .clear)
                                    .multilineTextAlignment(.center)
                                
                                Text("\(Calendar.current.dateComponents([.day], from: days[index]).day!)")
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .frame(minHeight: 50)
                                    .foregroundStyle(.red)
                                    .background(.yellow.opacity(0.2))
                                    .id(index + leadingBlanks) // unique if you really want it
                            }
                                
                        }
                    }
                    .padding()
                }
        
    }
}

func pullOutWeekdayNumber(date: Date) -> Int {
    
    return Calendar.current.component(.weekday, from: date)
    
}


#Preview {
    MonthScrollView()
}
