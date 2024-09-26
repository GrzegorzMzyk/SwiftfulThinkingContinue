//
//  DownloadingImagesViewsModel.swift
//  SwiftfulThinkingContinue
//
//  Created by Grzegorz Mzyk on 23/09/2024.
//

import Foundation
import Combine

class DownloadingImagesViewsModel: ObservableObject {
    
    @Published var dataArray: [PhotoModel] = []
    var cancellables = Set<AnyCancellable>()
    let dataService = PhotoModelDataService.instance
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$photoModels
            .sink { [weak self] (returnedPhotoModels) in
                self?.dataArray = returnedPhotoModels
            }
            .store(in: &cancellables)
    }
}
