//
//  AlignmentGuideBootcamp.swift
//  SwiftfulThinkingContinue
//
//  Created by Grzegorz Mzyk on 30/09/2024.
//

import SwiftUI

struct AlignmentGuideBootcamp: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("Hello, world!")
                .background(Color.blue)
//                .padding(.leading, 10) same as
//                .offset(x: 20)
                .alignmentGuide(.leading) { dimensions in
                    return dimensions.width / 2
                }
            
            
            Text("This is a some other text")
                .background(Color.red)
        }
        .background(Color.orange)
    }
}

struct AlignmentChildView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            row(title: "row 1", showIcon: false)
            row(title: "row 2", showIcon: true)
            row(title: "row 3", showIcon: false)
        }
        .padding(16)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 10)
        .padding(40)
    }
    
    private func row(title: String, showIcon: Bool) -> some View {
        HStack(spacing: 10) {
            if showIcon {
                Image(systemName: "info.circle")
                    .frame(width: 30, height: 30)
            }
           
            
            Text(title)
            Spacer()
        }
 
        .alignmentGuide(.leading) { dimensions in
            return showIcon ? 40 : 0
        }
    }
}

#Preview {
    AlignmentChildView()
}
