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
                    HStack {
                        Circle()
                            .frame(width: 75, height: 75)
                        VStack(alignment: .leading) {
                            Text(model.title)
                                .font(.headline)
                            Text(model.url)
                                .foregroundStyle(Color.gray)
                                .italic()
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                
            }
            .navigationTitle("Downloading Images")
        }
    }
}

#Preview {
    DownlodingImagesBootcamp()
}
