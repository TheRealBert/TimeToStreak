//
//  OptionCountWidget.swift
//  TimeToStreak
//
//  Created by Will Habos on 1/5/26.
//

import SwiftUI

struct OptionCountWidget: View {
    
    private var columns: [GridItem] = Array(repeating: GridItem(.flexible(minimum: 20), spacing: 0), count: 2)
    
    var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(.white)
            
            VStack(spacing: 0) {
                
                Text("Totals")
                    .font(.caption)
                    .bold()
                    .padding(.top, 5)
                
                Text("Since Jan 2026")
                    .font(.caption2)
                    .padding(.bottom, 5)
                
                LazyVGrid(columns: columns, spacing: 4) {
                    ForEach(1...4, id: \.self) { option in
                        ZStack {
                            Circle()
                                .frame(height: 40)
                                .foregroundStyle(.yellow)
                            
                            Text("365")
                                .font(.caption)
                                .bold()
                        }
                        
                    }
                }
                .padding(.horizontal, 10)
                
                Spacer()
                
            }
            
        }
        .frame(width: 130, height: 180)
    }
}

#Preview {
    OptionCountWidget()
}
