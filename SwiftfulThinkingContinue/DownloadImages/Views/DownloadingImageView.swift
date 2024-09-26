//
//  DownloadingImageView.swift
//  SwiftfulThinkingContinue
//
//  Created by Grzegorz Mzyk on 26/09/2024.
//

import SwiftUI

struct DownloadingImageView: View {
    
    @State var isLoading: Bool = true
    
    var body: some View {
        ZStack {
            if isLoading {
                ProgressView()
            } else {
                Circle()
            }
        }
    }
}

#Preview {
    DownloadingImageView()
}
