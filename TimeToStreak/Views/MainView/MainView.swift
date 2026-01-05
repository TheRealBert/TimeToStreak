//
//  MainView.swift
//  TimeToStreak
//
//  Created by Will Habos on 1/4/26.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        
        ZStack {
            
            Rectangle()
                .foregroundStyle(.gray)
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                BottomMenuBar()
                
            }
            
            
        }
    }
}

#Preview {
    MainView()
}
