//
//  DownlodingImagesBootcamp.swift
//  SwiftfulThinkingContinue
//
//  Created by Grzegorz Mzyk on 23/09/2024.
//

import SwiftUI
// Codable
// background threads
// weak self
// Combine
// Publishers and subscribers
// FileManager
// NSCache
struct DownlodingImagesBootcamp: View {
    
    @StateObject var divm = DownloadingImagesViewsModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(divm.dataArray) { model in
                    Text(model.title)
                }
                
            }
            .navigationTitle("Downloading Images")
        }
    }
}

#Preview {
    DownlodingImagesBootcamp()
}
