//
//  TimerBootcamp.swift
//  SwiftfulThinkingContinue
//
//  Created by Grzegorz Mzyk on 08/09/2024.
//

import SwiftUI

struct TimerBootcamp: View {
    // publikujemy wartość co jedna sekunde
    let timer = Timer.publish(every: 3.0, on: .main, in: .common).autoconnect()
    
    // Current Time
    /*
    @State var currentDate: Date = Date()
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
//        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter
    }
*/
    
    //Countdown
    /*
    @State var count: Int = 10
    @State var finishedText: String? = nil
*/
    
    // Countdown to date
    /*
    @State var timeRemaining: String = ""
    let futureDate: Date = Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? Date()
    
    func updateTimeRemaining() {
        let remaining = Calendar.current.dateComponents([.minute,.second], from: Date(), to: futureDate)
        let minute = remaining.minute ?? 0
        let second = remaining.second ?? 0
        timeRemaining = "\(minute) minutes and \(second) seconds"
    }
*/
    
    // Animation counter
    @State var count: Int = 1
    var body: some View {
        ZStack {
          RadialGradient(colors: [Color(#colorLiteral(red: 0, green: 0.5690457821, blue: 0.5746168494, alpha: 1)), Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))],
                         center: .center,
                         startRadius: 5,
                         endRadius: 500)
                .ignoresSafeArea()
            
            TabView(selection: $count,
                    content:  {
                Rectangle()
                    .foregroundStyle(Color.red)
                    .tag(1)
                Rectangle()
                    .foregroundStyle(Color.blue)
                    .tag(2)
                Rectangle()
                    .foregroundStyle(Color.green)
                    .tag(3)
                Rectangle()
                    .foregroundStyle(Color.orange)
                    .tag(4)
                Rectangle()
                    .foregroundStyle(Color.yellow)
                    .tag(5)
                
            })
            .frame(height: 200)
            .tabViewStyle(PageTabViewStyle())
            
//            HStack(spacing: 15) {
//                Circle()
//                    .offset(y: count == 1 ? -20 : 0)
//                Circle()
//                    .offset(y: count == 2 ? -20 : 0)
//                Circle()
//                    .offset(y: count == 3 ? -20 : 0)
//            }
//            .frame(width: 150)
//            .foregroundStyle(Color.white)
        }
        // przyjmujemy wartość
        .onReceive(timer, perform: { _ in
            withAnimation(.default){
                count = count == 5 ? 1 : count + 1
            }
            
            
        })
    }
}

#Preview {
    TimerBootcamp()
}
