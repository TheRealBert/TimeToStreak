//
//  BottomMenuBar.swift
//  TimeToStreak
//
//  Created by Will Habos on 1/4/26.
//

import SwiftUI

struct BottomMenuBar: View {
    
    @State private var selection: String = "home"
    @Namespace private var ns
    
    private let items: [(key: String, icon: String)] = [
            ("home", "house.fill"),
            ("streaks", "list.bullet"),
            ("goals", "chart.bar.fill"),
            ("settings", "gear")
        ]
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)

            HStack(spacing: 0) {
                ForEach(items, id: \.key) { item in
                    Button {
                        withAnimation(.spring(response: 0.35, dampingFraction: 0.85)) {
                            selection = item.key
                        }
                    } label: {
                        ZStack {
                            if selection == item.key {
                                RoundedRectangle(cornerRadius: 14)
                                    .fill(Color.gray.opacity(0.18))
                                    .matchedGeometryEffect(id: "pill", in: ns)
                                    .frame(width: 50, height: 36)
                            }

                            Image(systemName: item.icon)
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundStyle(selection == item.key ? .primary : .secondary)
                                .frame(width: 70, height: 50)
                        }
                    }
                    .buttonStyle(.plain)
                }
            }

            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray.opacity(0.25), lineWidth: 1)
        }
        .frame(width: 200, height: 50) // 4 buttons x ~70–80 looks better than 200
//        .padding(.horizontal, 16)
    }
}

#Preview {
    BottomMenuBar()
}
