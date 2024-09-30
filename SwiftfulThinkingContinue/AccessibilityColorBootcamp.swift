//
//  AccessibilityColorBootcamp.swift
//  SwiftfulThinkingContinue
//
//  Created by Grzegorz Mzyk on 29/09/2024.
//

import SwiftUI

struct AccessibilityColorBootcamp: View {
    
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    @Environment(\.colorSchemeContrast) var colorSchemeContrast
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.accessibilityInvertColors) var invertedColors
    
    var body: some View {
        VStack {
            Button("Button 1") {
            }
            .foregroundStyle(colorSchemeContrast == .increased ? .white : Color.primary)
            .buttonStyle(.borderedProminent)
            
            Button("Button 2") {
            }
            .foregroundStyle(Color.primary)
            .buttonStyle(.borderedProminent)
            .tint(.orange)
            
            Button("Button 3") {
            }
            .foregroundStyle(Color.white)
            .foregroundStyle(Color.primary)
            .buttonStyle(.borderedProminent)
            .tint(.green)
            
            Button("Button 4") {
            }
            .foregroundStyle(differentiateWithoutColor ? Color.white : Color.green)
            .foregroundStyle(Color.primary)
            .buttonStyle(.borderedProminent)
            .tint(differentiateWithoutColor ? .black : .purple)
        }
        .font(.largeTitle)
//        .navigationTitle("HI")
        .frame(maxWidth:.infinity, maxHeight: .infinity)
        .ignoresSafeArea()
//        .background(reduceTransparency ? Color.black : Color.black.opacity(0.5))
    }
}

#Preview {
    AccessibilityColorBootcamp()
}
