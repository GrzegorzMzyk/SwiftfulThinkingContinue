//
//  CoreDataBootcamp.swift
//  SwiftfulThinkingContinue
//
//  Created by Grzegorz Mzyk on 27/08/2024.
//

import SwiftUI
import CoreData

// MVVM ->
// View -      UI
// Model -     data point
// ViewModel - manages the data for a view

class CoreDataViewModel: ObservableObject {
    
    // loading CoreData
    let container: NSPersistentContainer
    init() {
        container = NSPersistentContainer(name: "FruitsContainer")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Error loading core data \(error)")
            }
        }
    }
}

struct CoreDataBootcamp: View {
    
    @StateObject var vm = CoreDataViewModel()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CoreDataBootcamp()
}
