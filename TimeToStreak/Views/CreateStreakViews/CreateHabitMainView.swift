//
//  CreateHabitMainView.swift
//  TimeToStreak
//
//  Created by Will Habos on 1/3/26.
//

import SwiftUI

struct CreateStreakMainView: View {
    
    @State var habitName: String = ""
    
    var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 30)
                .stroke(style: StrokeStyle(lineWidth: 1.0))
            
            VStack {
                
                Text(habitName == "" ? "Streak Goal" : "\(habitName)")
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .bold()
                    .padding(.bottom, 5)
                
                HStack(alignment: .center, spacing: 5) {
                    
                    Image(systemName: "calendar")
                        .resizable()
                        .scaledToFit()
                        .padding(2)
                    
                    Text(Date(), style: .date)
                        .font(.subheadline)
                    
                }
                .padding(.bottom)
                .frame(height: 35)
                
                ScrollView {
                    HabitChoiceButton(habitText: "0 Drinks", habitColor: .red, opacity: 0.25)
                    
                    HabitChoiceButton(habitText: "1 - 2 Drinks", habitColor: .blue, opacity: 0.25)

                    HabitChoiceButton(habitText: "3 - 4 Drinks", habitColor: .green, opacity: 0.25)
                    
                    HabitChoiceButton(habitText: "5 - 6 Drinks", habitColor: .yellow, opacity: 0.25)

                    HabitChoiceButton(habitText: "7+ Drinks", habitColor: .purple, opacity: 0.25)
                    
                    Spacer()
                        .frame(height: 400)
                }
                
                Spacer()
                
            }
            .padding()
            
            VStack {
                
                Spacer()
                
                ZStack {
                    
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundStyle(.gray)
                        
                    VStack {
                        
                        Text("Enter a Streak Goal")
                            .font(.headline)
                            .bold()
                        Text("(What do you want to streak?)")
                            .font(.footnote)
                        
                        Spacer()
                        
                        Text("Example: How many drinks did I have today?")
                            .font(.footnote)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.center)
                        Text("Example: Did I drink today?")
                            .font(.footnote)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.center)
                        Text("Example: # of Drinks.")
                            .font(.footnote)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.center)
                        
                        Spacer()
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(.white)
                            
                            TextField("What do you want to streak?", text: $habitName)
                                .padding()
                                .frame(maxHeight: .infinity, alignment: .topLeading)
                                
                        }
                        .frame(height: 150)
                        
                        Spacer()
                        
                        Button {
                            // TODO: LINK UP

                        } label: {
                            HabitChoiceButton(habitText: "Confirm & Next", habitColor: .black, opacity: habitName == "" ? 0.25 : 1.00)
                        }
                        
                    }
                    .padding()
                    
                }
                .frame(height: 400)
                
            }
            
        }
        .padding(.horizontal)
        .padding(.vertical, 50)

    }
}

#Preview {
    CreateStreakMainView()
}
