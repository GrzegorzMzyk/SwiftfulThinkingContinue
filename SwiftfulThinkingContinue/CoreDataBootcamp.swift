//
//  CoreDataBootcamp.swift
//  SwiftfulThinkingContinue
//
//  Created by Grzegorz Mzyk on 27/08/2024.
//

import SwiftUI
import CoreData
/*
MVVM ->
View -      UI
Model -     data point
ViewModel - manages the data for a view
*/
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
    
    func updateFruit(entity: FruitEntity) {
        let currentName = entity.name ?? ""
        let newName = currentName + "!"
        entity.name = newName
        saveData()
    }
    
    func deleteFruit(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let entity = saveEntitis[index]
        container.viewContext.delete(entity)
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
    @State var textFieldText: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing:20) {
                TextField("Add fruit here...", text: $textFieldText)
                    .font(.headline)
                    .padding(.leading)
                    .frame(height: 55)
                    .background(Color(#colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal)
                Button(action: {
                    guard !textFieldText.isEmpty else { return }
                    vm.addFruit(text: textFieldText)
                    textFieldText = ""
                }, label: {
                    Text("SAVE")
                        .font(.headline)
                        .foregroundStyle(Color.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color(#colorLiteral(red: 0.3718943, green: 0.3860599697, blue: 0.8404720426, alpha: 0.7855960265)))
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                        .padding(.horizontal)
                })
                List{
                    ForEach(vm.saveEntitis) { entity in
                        Text(entity.name ?? "No name")
                            .onTapGesture {
                                vm.updateFruit(entity: entity)
                            }
                    }
                    .onDelete(perform: vm.deleteFruit)
                    }
                .listStyle(PlainListStyle())
                }
               
                .navigationTitle("Fruits")
            }
            
        }
    }

#Preview {
    CoreDataBootcamp()
}
