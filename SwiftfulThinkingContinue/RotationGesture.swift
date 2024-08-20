//
//  RotationGesture.swift
//  SwiftfulThinkingContinue
//
//  Created by Grzegorz Mzyk on 14/08/2024.
//

import SwiftUI

struct RotationGestureBootcamp: View {
    
    @State var currentAmount = Angle.zero
    @State var finalamount = Angle.zero
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .background(Color.red)
            .rotationEffect(currentAmount + finalamount)
            .gesture(
            RotateGesture()
                .onChanged{ value in
                    currentAmount = value.rotation
                }
                .onEnded{ value in
                    finalamount += currentAmount
                    currentAmount = .zero
                }
            )
    }
}

#Preview {
    RotationGestureBootcamp()
}
