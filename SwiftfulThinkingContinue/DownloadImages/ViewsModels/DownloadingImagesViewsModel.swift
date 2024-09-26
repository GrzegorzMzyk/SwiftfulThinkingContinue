//
//  DownloadingImagesViewsModel.swift
//  SwiftfulThinkingContinue
//
//  Created by Grzegorz Mzyk on 23/09/2024.
//

import Foundation

class DownloadingImagesViewsModel: ObservableObject {
    
    @Published var dataArray: [PhotoModel] = []
    let dataService = PhotoModelDataService.instance
}
