//
//  DailyHabitPickerView.swift
//  TimeToStreak
//
//  Created by Will Habos on 1/3/26.
//

import SwiftUI

struct DailyHabitPickerView: View {
    
    @State var selection: String = ""
    @State var habitDate: Date = Date()
    @State var showCalendar: Bool = false
    
    var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 30)
                .stroke(style: StrokeStyle(lineWidth: 1.0))
            
            VStack {
                
                Text("Daily Drinks")
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .bold()
                    .padding(.bottom, 5)
                
                HStack(alignment: .center, spacing: 5) {
                    
                    Image(systemName: "calendar")
                        .resizable()
                        .scaledToFit()
                        .padding(2)
                        .onTapGesture {
                            showCalendar.toggle()
                        }
                    
                    Text(habitDate, style: .date)
                        .font(.subheadline)
                    
                }
                .padding(.bottom)
                .frame(height: 35)
                
                
                
                Button {
                    selection = "0 Drinks"
                } label: {
                    HabitChoiceButton(habitText: "0 Drinks", habitColor: .red, opacity: selection == "0 Drinks" ? 1.00 : 0.25)
                }
                
                Button {
                    selection = "1 - 2 Drinks"
                } label: {
                    HabitChoiceButton(habitText: "1 - 2 Drinks", habitColor: .blue, opacity: selection == "1 - 2 Drinks" ? 1.00 : 0.25)
                }
                
                Button {
                    selection = "3 - 4 Drinks"
                } label: {
                    HabitChoiceButton(habitText: "3 - 4 Drinks", habitColor: .green, opacity: selection == "3 - 4 Drinks" ? 1.00 : 0.25)
                }
                
                Button {
                    selection = "5 - 6 Drinks"
                } label: {
                    HabitChoiceButton(habitText: "5 - 6 Drinks", habitColor: .yellow, opacity: selection == "5 - 6 Drinks" ? 1.00 : 0.25)
                }
                
                Button {
                    selection = "7+ Drinks"
                } label: {
                    HabitChoiceButton(habitText: "7+ Drinks", habitColor: .purple, opacity: selection == "7+ Drinks" ? 1.00 : 0.25)
                }
                
                
                
                Spacer()
                
                Button {
                    // TODO: LINK UP

                } label: {
                    HabitChoiceButton(habitText: "Confirm Selection", habitColor: .black, opacity: selection != "" ? 1.00 : 0.25)
                }
                
                
            }
            .padding()
            
        }
        .padding(.horizontal)
        .padding(.vertical, 50)
        .sheet(isPresented: $showCalendar) {
            VStack(spacing: 16) {
                DatePicker(
                    "Select date",
                    selection: $habitDate,
                    displayedComponents: .date
                )
                .datePickerStyle(.graphical)
                .padding()

                Button("Done") { showCalendar = false }
                    .padding(.bottom, 24)
            }
            .presentationDetents([.medium])
        }
        
    }
}

#Preview {
    DailyHabitPickerView()
}
