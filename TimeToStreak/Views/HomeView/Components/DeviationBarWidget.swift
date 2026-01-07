//
//  DeviationBarWidget.swift
//  TimeToStreak
//
//  Created by Will Habos on 1/6/26.
//

import SwiftUI
import Charts

struct DeviationBarPoint: Identifiable {
    let id = UUID()
    let date: Date
    let value: Double?     // nil = no entry
    let color: Color
}

struct DeviationBarWidget: View {

    let title: String
    let subtitle: String
    let points: [DeviationBarPoint]
    let yDomain: ClosedRange<Double>?

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {

            VStack(alignment: .leading, spacing: 2) {
                Text(title).font(.headline)
                Text(subtitle)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Chart {
                RuleMark(y: .value("Baseline", 0))
                    .foregroundStyle(.secondary.opacity(0.6))
                    .lineStyle(StrokeStyle(lineWidth: 1))

                ForEach(points) { p in
                    if let v = p.value {
                        BarMark(
                            x: .value("Day", p.date),
                            yStart: .value("Zero", 0),
                            yEnd: .value("Value", v)
                        )
                        .cornerRadius(2)
                        .foregroundStyle(p.color)
                    } else {
                        // Optional: dot on baseline for missing
                        PointMark(
                            x: .value("Day", p.date),
                            y: .value("Zero", 0)
                        )
                        .foregroundStyle(.secondary.opacity(0.25))
                    }
                }
            }
            .chartXAxis(.hidden)
            .chartYAxis {
                AxisMarks(position: .leading, values: .automatic(desiredCount: 5)) { _ in
                    AxisGridLine().foregroundStyle(.secondary.opacity(0.15))
                    AxisValueLabel().font(.caption2).foregroundStyle(.secondary)
                }
            }
            .chartYScale(domain: yDomain ?? autoDomain(from: points))
            .frame(height: 140)
        }
        .padding(14)
        .background(
            RoundedRectangle(cornerRadius: 22).fill(.white)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 22)
                .stroke(Color.primary.opacity(0.10), lineWidth: 1)
        )
    }

    private func autoDomain(from points: [DeviationBarPoint]) -> ClosedRange<Double> {
        let values = points.compactMap(\.value)
        let minV = values.min() ?? -1
        let maxV = values.max() ?? 1
        let pad = max(0.5, (maxV - minV) * 0.15)
        return (minV - pad)...(maxV + pad)
    }
}

#Preview {
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

    // ---------- Sleep example ----------
    let sleepTopic = StreakTopic(
        id: UUID(),
        name: "Sleep",
        startDate: cal.date(byAdding: .day, value: -28, to: today),
        endDate: nil,
        baselineValue: 8
    )

    let sleepOptions: [StreakOption] = [
        .init(topicId: sleepTopic.id, name: "5h",  colorHex: "#FF453A", sortOrder: 0, active: true, value: 5),
        .init(topicId: sleepTopic.id, name: "6h",  colorHex: "#FF9F0A", sortOrder: 1, active: true, value: 6),
        .init(topicId: sleepTopic.id, name: "7h",  colorHex: "#FFD60A", sortOrder: 2, active: true, value: 7),
        .init(topicId: sleepTopic.id, name: "8h",  colorHex: "#34C759", sortOrder: 3, active: true, value: 8),
        .init(topicId: sleepTopic.id, name: "9h",  colorHex: "#64D2FF", sortOrder: 4, active: true, value: 9),
        .init(topicId: sleepTopic.id, name: "10h", colorHex: "#0A84FF", sortOrder: 5, active: true, value: 10)
    ]

    let sleepEntries: [StreakEntry] = (0..<28).compactMap { i in
        let d = cal.date(byAdding: .day, value: -i, to: today)!
        if i % 5 == 0 { return nil }
        let opt = sleepOptions[i % sleepOptions.count]
        return StreakEntry(topicId: sleepTopic.id, date: d, optionId: opt.id)
    }

    let sleepPoints = buildBarPoints(
        topic: sleepTopic,
        options: sleepOptions,
        entries: sleepEntries,
        lastNDays: 28,
        useDeviation: true
    )

    return ScrollView {
        VStack(spacing: 16) {
            DeviationBarWidget(
                title: "Alcohol",
                subtitle: "Down bars indicate drinks",
                points: alcoholPoints,
                yDomain: (-3)...(1)
            )

            DeviationBarWidget(
                title: "Sleep",
                subtitle: "vs 8 hours",
                points: sleepPoints,
                yDomain: (-3)...(3)
            )
        }
        .padding()
    }
    .background(Color(hex: "#F4F2FA"))
}



func buildBarPoints(
    topic: StreakTopic,
    options: [StreakOption],
    entries: [StreakEntry],
    lastNDays: Int,
    endingOn endDate: Date = .now,
    useDeviation: Bool
) -> [DeviationBarPoint] {

    let cal = Calendar.current
    let end = cal.startOfDay(for: endDate)
    let start = cal.date(byAdding: .day, value: -(lastNDays - 1), to: end)!

    let optionById: [UUID: StreakOption] =
        Dictionary(uniqueKeysWithValues: options.map { ($0.id, $0) })

    // topicId+day -> entry (assumes one entry per day per topic)
    let entryByDay: [Date: StreakEntry] = Dictionary(
        uniqueKeysWithValues: entries
            .filter { $0.topicId == topic.id }
            .map { (cal.startOfDay(for: $0.date), $0) }
    )

    var result: [DeviationBarPoint] = []
    var d = start
    while d <= end {
        if let entry = entryByDay[d],
           let optId = entry.optionId,
           let opt = optionById[optId],
           let raw = opt.value {

            let v: Double
            if useDeviation, let baseline = topic.baselineValue {
                v = raw - baseline
            } else {
                v = raw
            }

            result.append(.init(
                date: d,
                value: v,
                color: Color(hex: opt.colorHex).opacity(0.9)
            ))
        } else {
            result.append(.init(
                date: d,
                value: nil,
                color: .gray.opacity(0.2)
            ))
        }

        d = cal.date(byAdding: .day, value: 1, to: d)!
    }

    return result
}

