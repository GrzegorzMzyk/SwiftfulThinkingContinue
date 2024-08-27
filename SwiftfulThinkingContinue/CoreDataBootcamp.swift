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
    @Published var saveEntitis: [FruitEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "FruitsContainer")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Error loading core data \(error)")
            }
        }
        fetchFruits()
    }
    func fetchFruits() {
        let request = NSFetchRequest<FruitEntity>(entityName: "FruitEntity")
        do {
            saveEntitis = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching \(error)")
        }
        
    }
    func addFruit(text: String) {
        let newFruit = FruitEntity(context: container.viewContext)
        newFruit.name = text
        saveData()
    }
    func saveData() {
        do {
           try container.viewContext.save()
            fetchFruits()
        } catch let error {
            print("Error saving \(error)")
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
