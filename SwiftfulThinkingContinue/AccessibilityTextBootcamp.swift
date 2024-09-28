//
//  AccessibilityTextBootcamp.swift
//  SwiftfulThinkingContinue
//
//  Created by Grzegorz Mzyk on 28/09/2024.
//

import SwiftUI
// Dynamic Text

struct AccessibilityTextBootcamp: View {
    
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(0..<10) { _ in
                    VStack(alignment: .leading, spacing: 8){
                        HStack {
                            Image(systemName: "heart.fill")
                                .font(.system(size: 30))
                            Text("Welcome to my app")
                        }
                        .font(.title)
                        .truncationMode(.tail)
                        Text("This is some large text and it will be in multiple lines and we will see how it looks like")
                    }
                    .font(.subheadline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                    .lineLimit(3)
                    .minimumScaleFactor(dynamicTypeSize.customMinScaleFactor)
                }
//                .frame(height: 100)
                .background(Color.red)
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Hello World")
        }
    }
}
extension DynamicTypeSize {
    var customMinScaleFactor: CGFloat {
        switch self {
        case .xSmall, .small, .medium:
            return 1.0
        case .large, .xLarge, .xxLarge:
            return 0.8
        default:
            return 0.6
        }
    }
}
#Preview {
    AccessibilityTextBootcamp()
}
