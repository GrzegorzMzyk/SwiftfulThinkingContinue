//
//  PhotoModel.swift
//  SwiftfulThinkingContinue
//
//  Created by Grzegorz Mzyk on 23/09/2024.
//

import Foundation

struct PhotoModel: Codable, Identifiable {
    
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
    
}


/*
 {
   "albumId": 1,
   "id": 1,
   "title": "accusamus beatae ad facilis cum similique qui sunt",
   "url": "https://via.placeholder.com/600/92c952",
   "thumbnailUrl": "https://via.placeholder.com/150/92c952"
 }
*/
