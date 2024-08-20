//
//  DragGesture.swift
//  SwiftfulThinkingContinue
//
//  Created by Grzegorz Mzyk on 20/08/2024.
//

import SwiftUI

struct DragGestureView: View {
    
    @State var offset: CGSize = .zero
    
    var body: some View {
        
        RoundedRectangle(cornerRadius: 20)
            .frame(width: 100, height: 100)
            .offset(offset)
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        withAnimation(.spring()){
                            offset = value.translation
                        }
                    })
                    .onEnded({ value in
                        withAnimation(.spring()){
                            offset = .zero
                        }
                    })
                )
    }
}
#Preview {
    DragGestureView()
}
