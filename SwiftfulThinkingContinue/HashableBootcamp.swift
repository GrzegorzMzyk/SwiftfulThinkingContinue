//
//  HashableBootcamp.swift
//  SwiftfulThinkingContinue
//
//  Created by Grzegorz Mzyk on 22/08/2024.
//
// hashable - dana wartosc ma swoje unikalne id 

import SwiftUI
struct MyCustomModel: Hashable {
    let title: String
//    let id = UUID().uuidString
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
}
struct HashableBootcamp: View {
    
    let data: [MyCustomModel] = [
        MyCustomModel(title: "one"),
        MyCustomModel(title: "two"),
        MyCustomModel(title: "three"),
        MyCustomModel(title: "four"),
        MyCustomModel(title: "five")
  ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
//                ForEach(data) { item in
//                    Text(item.id)
//                        .font(.headline)
//                }
                ForEach(data, id: \.self) { item in
                    Text(item.hashValue.description)
                        .font(.headline)
                }
            }
        }
    }
}

#Preview {
    HashableBootcamp()
}
