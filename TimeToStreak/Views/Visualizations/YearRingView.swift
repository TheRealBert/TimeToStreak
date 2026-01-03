//
//  YearRingView.swift
//  TimeToStreak
//
//  Created by Will Habos on 1/2/26.
//

import SwiftUI
import Charts

struct DaySlice: Identifiable {
    let id: Int          // dayOfYear: 1...365/366
    let date: Date
    let isFuture: Bool   // after "today"
}

struct YearRingView: View {
    
    let demoSlices: [DaySlice] = [
        DaySlice(id: 1,  date: DateComponents(calendar: .current, year: 2026, month: 1, day: 1).date!,  isFuture: false),
        DaySlice(id: 2,  date: DateComponents(calendar: .current, year: 2026, month: 1, day: 2).date!,  isFuture: false),
        DaySlice(id: 3,  date: DateComponents(calendar: .current, year: 2026, month: 1, day: 3).date!,  isFuture: false),
        DaySlice(id: 4,  date: DateComponents(calendar: .current, year: 2026, month: 1, day: 4).date!,  isFuture: false),
        DaySlice(id: 5,  date: DateComponents(calendar: .current, year: 2026, month: 1, day: 5).date!,  isFuture: false),
        DaySlice(id: 6,  date: DateComponents(calendar: .current, year: 2026, month: 1, day: 6).date!,  isFuture: false),
        DaySlice(id: 7,  date: DateComponents(calendar: .current, year: 2026, month: 1, day: 7).date!,  isFuture: false),
        DaySlice(id: 8,  date: DateComponents(calendar: .current, year: 2026, month: 1, day: 8).date!,  isFuture: false),
        DaySlice(id: 9,  date: DateComponents(calendar: .current, year: 2026, month: 1, day: 9).date!,  isFuture: false),
        DaySlice(id: 10, date: DateComponents(calendar: .current, year: 2026, month: 1, day: 10).date!, isFuture: false),
        DaySlice(id: 11,  date: DateComponents(calendar: .current, year: 2026, month: 1, day: 1).date!,  isFuture: false),
        DaySlice(id: 12,  date: DateComponents(calendar: .current, year: 2026, month: 1, day: 2).date!,  isFuture: false),
        DaySlice(id: 13,  date: DateComponents(calendar: .current, year: 2026, month: 1, day: 3).date!,  isFuture: false),
        DaySlice(id: 14,  date: DateComponents(calendar: .current, year: 2026, month: 1, day: 4).date!,  isFuture: false),
        DaySlice(id: 15,  date: DateComponents(calendar: .current, year: 2026, month: 1, day: 5).date!,  isFuture: false),
        DaySlice(id: 16,  date: DateComponents(calendar: .current, year: 2026, month: 1, day: 6).date!,  isFuture: false),
        DaySlice(id: 17,  date: DateComponents(calendar: .current, year: 2026, month: 1, day: 7).date!,  isFuture: false),
        DaySlice(id: 18,  date: DateComponents(calendar: .current, year: 2026, month: 1, day: 8).date!,  isFuture: false),
        DaySlice(id: 19,  date: DateComponents(calendar: .current, year: 2026, month: 1, day: 9).date!,  isFuture: false),
        DaySlice(id: 20, date: DateComponents(calendar: .current, year: 2026, month: 1, day: 10).date!, isFuture: false),
        DaySlice(id: 21,  date: DateComponents(calendar: .current, year: 2026, month: 1, day: 1).date!,  isFuture: false),
        DaySlice(id: 22,  date: DateComponents(calendar: .current, year: 2026, month: 1, day: 2).date!,  isFuture: false),
        DaySlice(id: 23,  date: DateComponents(calendar: .current, year: 2026, month: 1, day: 3).date!,  isFuture: false),
        DaySlice(id: 24,  date: DateComponents(calendar: .current, year: 2026, month: 1, day: 4).date!,  isFuture: false),
        DaySlice(id: 25,  date: DateComponents(calendar: .current, year: 2026, month: 1, day: 5).date!,  isFuture: false),
        DaySlice(id: 26,  date: DateComponents(calendar: .current, year: 2026, month: 1, day: 6).date!,  isFuture: false),
        DaySlice(id: 27,  date: DateComponents(calendar: .current, year: 2026, month: 1, day: 7).date!,  isFuture: false),
        DaySlice(id: 28,  date: DateComponents(calendar: .current, year: 2026, month: 1, day: 8).date!,  isFuture: true),
        DaySlice(id: 29,  date: DateComponents(calendar: .current, year: 2026, month: 1, day: 9).date!,  isFuture: true),
        DaySlice(id: 30, date: DateComponents(calendar: .current, year: 2026, month: 1, day: 10).date!, isFuture: true),
        DaySlice(id: 29,  date: DateComponents(calendar: .current, year: 2026, month: 1, day: 9).date!,  isFuture: true),
        DaySlice(id: 30, date: DateComponents(calendar: .current, year: 2026, month: 1, day: 10).date!, isFuture: true),
        DaySlice(id: 31,  date: DateComponents(calendar: .current, year: 2026, month: 1, day: 9).date!,  isFuture: true),
        DaySlice(id: 32, date: DateComponents(calendar: .current, year: 2026, month: 1, day: 10).date!, isFuture: true),
        DaySlice(id: 33,  date: DateComponents(calendar: .current, year: 2026, month: 1, day: 9).date!,  isFuture: true),
        DaySlice(id: 34, date: DateComponents(calendar: .current, year: 2026, month: 1, day: 10).date!, isFuture: true),
        DaySlice(id: 35,  date: DateComponents(calendar: .current, year: 2026, month: 1, day: 9).date!,  isFuture: true),
        DaySlice(id: 36, date: DateComponents(calendar: .current, year: 2026, month: 1, day: 10).date!, isFuture: true),
        DaySlice(id: 37,  date: DateComponents(calendar: .current, year: 2026, month: 1, day: 9).date!,  isFuture: true),
        DaySlice(id: 38, date: DateComponents(calendar: .current, year: 2026, month: 1, day: 10).date!, isFuture: true),
        DaySlice(id: 39,  date: DateComponents(calendar: .current, year: 2026, month: 1, day: 9).date!,  isFuture: true),
        DaySlice(id: 40, date: DateComponents(calendar: .current, year: 2026, month: 1, day: 10).date!, isFuture: true),
        DaySlice(id: 41,  date: DateComponents(calendar: .current, year: 2026, month: 1, day: 9).date!,  isFuture: true),
        DaySlice(id: 42, date: DateComponents(calendar: .current, year: 2026, month: 1, day: 10).date!, isFuture: true),
        DaySlice(id: 43,  date: DateComponents(calendar: .current, year: 2026, month: 1, day: 9).date!,  isFuture: true),
        DaySlice(id: 44, date: DateComponents(calendar: .current, year: 2026, month: 1, day: 10).date!, isFuture: true),
        DaySlice(id: 45,  date: DateComponents(calendar: .current, year: 2026, month: 1, day: 9).date!,  isFuture: true),
        DaySlice(id: 46, date: DateComponents(calendar: .current, year: 2026, month: 1, day: 10).date!, isFuture: true),
        DaySlice(id: 47,  date: DateComponents(calendar: .current, year: 2026, month: 1, day: 9).date!,  isFuture: true),
        DaySlice(id: 48, date: DateComponents(calendar: .current, year: 2026, month: 1, day: 10).date!, isFuture: true),
        DaySlice(id: 49,  date: DateComponents(calendar: .current, year: 2026, month: 1, day: 9).date!,  isFuture: true),
        DaySlice(id: 50, date: DateComponents(calendar: .current, year: 2026, month: 1, day: 10).date!, isFuture: true)
    ]
    
    private let calendar = Calendar.current

        let year: Int
        let today: Date
        /// Map a day (startOfDay) -> Color for that day (based on tracked choice)
        let colorForDay: (Date) -> Color

        private var slices: [DaySlice] {
            let yearStart = calendar.date(from: DateComponents(year: year, month: 1, day: 1))!
            let yearInterval = calendar.dateInterval(of: .year, for: yearStart)!
            let yearEndExclusive = yearInterval.end

            let start = calendar.startOfDay(for: yearStart)
            let end = calendar.startOfDay(for: calendar.date(byAdding: .day, value: -1, to: yearEndExclusive)!)

            let todayDay = calendar.startOfDay(for: today)

            var result: [DaySlice] = []
            var d = start
            while d <= end {
                let dayOfYear = calendar.ordinality(of: .day, in: .year, for: d) ?? 1
                result.append(DaySlice(
                    id: dayOfYear,
                    date: d,
                    isFuture: d > todayDay
                ))
                d = calendar.date(byAdding: .day, value: 1, to: d)!
            }
            return result
        }
    
    var body: some View {
        
        Chart(demoSlices) { s in
                    SectorMark(
                        angle: .value("Day", 1),               // each slice is 1 unit
//                        innerRadius: .ratio(0.62),             // donut thickness
                        angularInset: 0.6                      // small gap between slices
                    )
                    .foregroundStyle(s.isFuture ? Color.gray.opacity(0.15) : colorForDay(s.date))
                }
                // Charts start angle is at 3 o'clock by default; rotate so Jan 1 is at 12 o'clock.
                .rotationEffect(.degrees(0))

                // Optional: keep it square
                .frame(width: 300, height: 300)

                // Optional: animate as time moves forward (or as data loads)
                .animation(.snappy, value: slices.map(\.isFuture))
        
        
    }
}

#Preview {
    YearRingView(
        year: Calendar.current.component(.year, from: .now),
        today: .now,
        colorForDay: { date in
            // Replace with your choice lookup.
            // Example: weekends light blue, weekdays orange.
            let weekday = Calendar.current.component(.weekday, from: date)
            return (weekday == 1 || weekday == 7) ? .blue.opacity(0.8) : .orange.opacity(0.8)
        }
    )
}
