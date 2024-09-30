//
//  ScrollViewPagingBootcamp.swift
//  SwiftfulThinkingContinue
//
//  Created by Grzegorz Mzyk on 30/09/2024.
//

import SwiftUI

struct ScrollViewPagingBootcamp: View {
    @State private var scrolPosition: Int? = nil
    var body: some View {
        VStack {
            Button("Scroll to") {
                scrolPosition = (0..<20).randomElement()!
            }
            
  
            ScrollView(.horizontal) {
                HStack(spacing: 0) {
                    ForEach(0..<20) { index in
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 300, height: 300)
                            .overlay {
                                Text("\(index)").foregroundStyle(.white)
                            }
                            .frame(maxWidth: .infinity)
                            .padding(10)
                            .id(index)
                            .scrollTransition(.interactive.threshold(.visible(0.9))) { content, phase in
                                content
                                    .opacity(phase.isIdentity ? 1 : 0)
                                    .offset(y: phase.isIdentity ? 0 : -100)
                            }
                        //                                .containerRelativeFrame(.horizontal, alignment: .center)
                    }
                }
                .padding(.vertical, 100)
            }
            .ignoresSafeArea()
            .scrollTargetLayout()
            .scrollTargetBehavior(.viewAligned)
            .scrollBounceBehavior(.basedOnSize)
            .scrollPosition(id: $scrolPosition, anchor: .center)
            .animation(.smooth, value: scrolPosition)
        }
//        ScrollView {
//            VStack(spacing: 0) {
//                ForEach(0..<20) { index in
//                    Rectangle()
//                        .overlay {
//                            Text("\(index)").foregroundStyle(.white)
//                        }
//                        .frame(maxWidth: .infinity)
//                        .padding(.vertical, 10)
//                        .containerRelativeFrame(.vertical, alignment: .center)
//                }
//            }
//        }
//        .ignoresSafeArea()
//        .scrollTargetLayout()
//        .scrollTargetBehavior(.paging)
//        .scrollBounceBehavior(.basedOnSize)
    }
}

#Preview {
    ScrollViewPagingBootcamp()
}
