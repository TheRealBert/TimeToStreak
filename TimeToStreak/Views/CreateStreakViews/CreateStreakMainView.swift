//
//  CreateHabitMainView.swift
//  TimeToStreak
//
//  Created by Will Habos on 1/3/26.
//

import SwiftUI

struct CreateStreakMainView: View {

    @Environment(UserInputPresentedViews.self) private var userInputPresentedViews
    @Environment(StreakViewModel.self) private var streakVM

    @State private var habitName: String = ""
    @State private var streakOption: String = ""
    @State private var optionColor: Color = .clear

    private var sheetHeight: CGFloat {
        userInputPresentedViews.currentView == .reviewLaunchView ? 150 : 400
    }

    private var previewTitle: String {
        habitName.isEmpty ? "Streak Goal" : habitName
    }

    private var previewOptions: [StreakOption] {
        let sorted = streakVM.allStreakOptions.sorted { $0.sortOrder < $1.sortOrder }
        if !sorted.isEmpty { return sorted }

        // Empty state placeholders so the preview never looks blank
        return [
            StreakOption(topicId: UUID(), name: "Add streak option", colorHex: "#C7C7CC", sortOrder: 0, active: true),
            StreakOption(topicId: UUID(), name: "Add streak option", colorHex: "#C7C7CC", sortOrder: 1, active: true),
            StreakOption(topicId: UUID(), name: "Add streak option", colorHex: "#C7C7CC", sortOrder: 2, active: true)
        ]
    }

    var body: some View {
        VStack(spacing: 16) {

            HStack {
                Text("PREVIEW")
                    .font(.caption2.weight(.semibold))
                    .foregroundStyle(.secondary)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(
                        Capsule()
                            .fill(Color.primary.opacity(0.08))
                    )

                Spacer()
            }
            
            // Preview card
            VStack(spacing: 12) {
                Text(previewTitle)
                    .font(.title3)
                    .bold()
                    .multilineTextAlignment(.center)

                HStack(spacing: 8) {
                    Image(systemName: "calendar")
                        .imageScale(.medium)

                    Text(Date(), style: .date)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }

                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(previewOptions) { streak in
                            HabitChoiceButton(
                                habitText: streak.name,
                                habitColor: Color(hex: streak.colorHex),
                                opacity: 0.25
                            )
                        }
                    }
                    .padding(.top, 4)
                    .padding(.bottom, sheetHeight + 16) // replaces spacer hack
                }
            }
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 30)
                    .fill(.background)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.primary.opacity(0.12), lineWidth: 1)
            )
            .shadow(color: .black.opacity(0.06), radius: 10, y: 6)

        }
        .padding(.horizontal)
        .safeAreaInset(edge: .bottom) {
            builderSheet
        }
    }

    private var builderSheet: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .fill(.ultraThinMaterial)

            RoundedRectangle(cornerRadius: 30)
                .stroke(Color.primary.opacity(0.12), lineWidth: 1)

            switch userInputPresentedViews.currentView {
            case .goalView:
                EnterStreakGoalView(streakTopic: $habitName)
                    .padding()
            case .streakOptionView:
                AddStreakOptionView(streakOption: $streakOption, optionColor: $optionColor)
                    .padding()
            case .reviewLaunchView:
                ReviewAndLaunchView()
                    .padding()
            }
        }
        .frame(height: sheetHeight)
        .padding(.horizontal)
        .padding(.bottom, 8)
    }
}

#Preview {
    CreateStreakMainView()
        .environment(UserInputPresentedViews())
        .environment(StreakViewModel())
}
