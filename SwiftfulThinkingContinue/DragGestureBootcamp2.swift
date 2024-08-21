//
//  DragGestureBootcamp2.swift
//  SwiftfulThinkingContinue
//
//  Created by Grzegorz Mzyk on 21/08/2024.
//

import SwiftUI

struct DragGestureBootcamp2: View {
    
    @State var startingOffsetY: CGFloat = UIScreen.main.bounds.height * 0.85
    @State var currentDragOffsetY: CGFloat = 0
    @State var endingOffsetY: CGFloat = 0
    var body: some View {
        ZStack{
            Color.green.ignoresSafeArea()
            
            MySignUpView()
                .offset(y: startingOffsetY)
                .offset(y: currentDragOffsetY)
                .offset(y: endingOffsetY)
                .gesture(
                DragGesture()
                    .onChanged{ value in
                        withAnimation(.spring) {
                            currentDragOffsetY = value.translation.height
                        }
                       
                    }
                    .onEnded{ value in
                        withAnimation(.spring) {
                            if currentDragOffsetY < -150 {
                                endingOffsetY = -startingOffsetY
                            } else if endingOffsetY != 0 && currentDragOffsetY > 150 {
                                endingOffsetY = 0
                            }
                            currentDragOffsetY = 0
                        }
                    }
                )
            Text(".\(currentDragOffsetY)")
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    DragGestureBootcamp2()
}

struct MySignUpView: View {
    var body: some View {
        VStack(spacing: 20){
            Image(systemName: "chevron.up")
                .padding(.top)
            Text("Sing up")
                .font(.headline)
                .fontWeight(.semibold)
            
            
            Image(systemName: "flame.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            Text("This is the description four our app. This is my favorite SwiftUI course 😁")
                .multilineTextAlignment(.center)
            Text("Create an Account")
                .foregroundStyle(Color.white)
                .font(.headline)
                .padding()
                .padding(.horizontal)
                .background(Color.black.clipShape(RoundedRectangle(cornerRadius: 10)))
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}
