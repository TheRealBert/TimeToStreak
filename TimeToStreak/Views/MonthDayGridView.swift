//
//  MonthDayGridView.swift
//  TimeToStreak
//
//  Created by Will Habos on 1/2/26.
//

import SwiftUI

struct MonthDayGridView: View {
    
    var monthIndex: [String] = ["J","F","M","A","M","J","J", "A","S","O","N","D"]
    
    var body: some View {
        
        VStack {
            
            Text("Drink Tracker")
                .font(.title2)
                .bold()
            
            HStack {
                
                Text("Day")
                    .frame(width: 30)
                
                ForEach(monthIndex, id: \.self) { letter in
                    Text(letter)
                        .frame(width: 20, height: 20)
                }
            
            }
            
            ScrollView {
                
                LazyVStack {
                    
                    HStack {
                        
                        VStack {
                            ForEach(1...31, id: \.self) { number in
                                Text("\(number)")
                                    .frame(width: 30, height: 20)
                            }
                        }
                        
                        ForEach(1...12, id: \.self) { index in
                            
                            VStack {
                                
                                ForEach(1...31, id: \.self) { number in
                                    Circle()
                                        .frame(width: 20, height: 20)
                                }
                                
                            }
                        }
                        
                    }
                    
                }
                
            }
        }
        
        
        
        
        
    }
}

#Preview {
    MonthDayGridView()
}
