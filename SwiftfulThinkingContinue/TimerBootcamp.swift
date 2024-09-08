//
//  TimerBootcamp.swift
//  SwiftfulThinkingContinue
//
//  Created by Grzegorz Mzyk on 08/09/2024.
//

import SwiftUI

struct TimerBootcamp: View {
    // publikujemy wartość co jedna sekunde
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    
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
    
    @State var count: Int = 10
    @State var finishedText: String? = nil
    
    var body: some View {
        ZStack {
          RadialGradient(colors: [Color(#colorLiteral(red: 0, green: 0.5690457821, blue: 0.5746168494, alpha: 1)), Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))],
                         center: .center,
                         startRadius: 5,
                         endRadius: 500)
                .ignoresSafeArea()
            
            Text(finishedText ?? "\(count)")
                .font(.system(size: 100, weight: .semibold, design: .rounded))
                .foregroundStyle(Color.white)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
        }
        // przyjmujemy wartość
        .onReceive(timer, perform: { _ in
            if count <= 1 {
                finishedText = "WOW!"
            } else {
                count -= 1
            }
        })
    }
}

#Preview {
    TimerBootcamp()
}
