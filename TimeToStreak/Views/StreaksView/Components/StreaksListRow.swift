//
//  StreaksListRow.swift
//  TimeToStreak
//
//  Created by Will Habos on 1/4/26.
//

import SwiftUI

struct StreaksListRow: View {
    
    var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(.white)
            
            RoundedRectangle(cornerRadius: 20)
                .stroke(style: StrokeStyle(lineWidth: 1))
            
            VStack {
                
                HStack(alignment: .center) {
                    
                    VStack {
                        Text("How many drinks today?")
                            .font(.footnote)
                            .bold()
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                        Text("Active: Since Jan 31, 2026")
                            .font(.caption2)
                            .italic()
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .frame(width: 200, alignment: .leading)
                    
                    
                    ZStack {
                        Circle()
                            .foregroundStyle(.gray)
                        
                        Text("365")
                            .font(.caption2)
                    }
                    
                    ZStack {
                        Circle()
                            .foregroundStyle(.gray)
                        
                        Text("365")
                            .font(.caption2)
                    }
                    
                    ZStack {
                        Circle()
                            .foregroundStyle(.gray)
                        
                        Text("365")
                            .font(.caption2)
                    }
                    
                    ZStack {
                        Circle()
                            .foregroundStyle(.gray)
                        
                        Text("365")
                            .font(.caption2)
                    }
                    
                    ZStack {
                        Circle()
                            .foregroundStyle(.gray)
                        
                        Text("365")
                            .font(.caption2)
                    }
                    
                }
                
                RoundedRectangle(cornerRadius: 10)
                    .frame(height: 3)
                
            }
            .padding(.horizontal, 10)
            
        }
        .frame(height: 75)
    }
}

#Preview {
    StreaksListRow()
}
