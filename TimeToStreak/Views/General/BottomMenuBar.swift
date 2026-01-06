//
//  BottomMenuBar.swift
//  TimeToStreak
//
//  Created by Will Habos on 1/4/26.
//

import SwiftUI

struct BottomMenuBar: View {

    @Environment(MainPresentedViews.self) private var mainPresentedViews
    @Namespace private var ns

    private let items: [(view: MainPresentedViews.PageView, icon: String)] = [
        (.homeView, "house.fill"),
        (.streaksView, "list.bullet"),
        (.createStreaksView, "plus.circle.fill"),
        (.goalsView, "chart.bar.fill"),
        (.settingsView, "gear")
    ]

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)

            HStack(spacing: 0) {
                ForEach(items, id: \.view) { item in
                    Button {
                        withAnimation(.spring(response: 0.35, dampingFraction: 0.85)) {
                            mainPresentedViews.currentView = item.view
                        }
                    } label: {
                        ZStack {
                            if mainPresentedViews.currentView == item.view {
                                RoundedRectangle(cornerRadius: 14)
                                    .fill(Color.gray.opacity(0.18))
                                    .matchedGeometryEffect(id: "pill", in: ns)
                                    .frame(width: 50, height: 36)
                            }

                            Image(systemName: item.icon)
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundStyle(
                                    mainPresentedViews.currentView == item.view
                                    ? .primary
                                    : .secondary
                                )
                                .frame(width: 70, height: 50)
                        }
                    }
                    .buttonStyle(.plain)
                }
            }

            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray.opacity(0.25), lineWidth: 1)
        }
        .frame(width: 350, height: 50) // 4 buttons x ~70–80 looks better than 200
//        .padding(.horizontal, 16)
    }
}

#Preview {
    BottomMenuBar()
        .environment(MainPresentedViews())
}
