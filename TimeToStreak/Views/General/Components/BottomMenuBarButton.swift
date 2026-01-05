//
//  BottomMenuBarButton.swift
//  TimeToStreak
//
//  Created by Will Habos on 1/4/26.
//

import SwiftUI

struct BottomMenuBarButton: View {
    
    var buttonImage: String
    var selected: Bool
    
    var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(selected ? .black : .white)
            
            VStack {
                Image(systemName: buttonImage)
                    .resizable()
                    .scaledToFit()
                    .padding(12)
                    .foregroundStyle(selected ? .white : .black)
            }

        }
    }
}

#Preview {
    BottomMenuBarButton(buttonImage: "list.bullet", selected: true)
}
