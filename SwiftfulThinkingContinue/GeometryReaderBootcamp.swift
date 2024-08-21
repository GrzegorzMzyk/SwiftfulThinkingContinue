//
//  GeometryReaderBootcamp.swift
//  SwiftfulThinkingContinue
//
//  Created by Grzegorz Mzyk on 21/08/2024.
//

import SwiftUI

struct GeometryReaderBootcamp: View {
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing:0) {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: geometry.size.width * 0.666)
                //                .frame(width: UIScreen.main.bounds.width * 0.666)
                Rectangle()
                    .fill(Color.blue)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    GeometryReaderBootcamp()
}
