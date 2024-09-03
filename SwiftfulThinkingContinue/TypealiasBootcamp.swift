//
//  TypealiasBootcamp.swift
//  SwiftfulThinkingContinue
//
//  Created by Grzegorz Mzyk on 03/09/2024.
//

import SwiftUI

struct MovieModel {
    let title: String
    let director: String
    let count: Int
}

typealias TVModel = MovieModel
// new name for existing type


struct TypealiasBootcamp: View {
    
//    @State var item: MovieModel = MovieModel(title: "Title", director: "John", count: 5)
    @State var item: TVModel = TVModel(title: "TV Title", director: "Emilly", count: 10)
    
    var body: some View {
        VStack {
            Text(item.title)
            Text(item.director)
            Text("\(item.count)")
        }
    }
}

#Preview {
    TypealiasBootcamp()
}
