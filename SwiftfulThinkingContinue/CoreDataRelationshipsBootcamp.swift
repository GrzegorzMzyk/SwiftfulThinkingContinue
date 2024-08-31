//
//  CoreDataRelationshipsBootcamp.swift
//  SwiftfulThinkingContinue
//
//  Created by Grzegorz Mzyk on 31/08/2024.
//

import SwiftUI
import CoreData

/*
3 entitis:
- BusinessEntity
- DepartmentEntity
- EmployeeEntity
 
 */
class CoreDataManager {
    static let instance = CoreDataManager() // singleton
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    init() {
        container = NSPersistentContainer(name: "CoreDataContainer")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("error loading cora data: \(error)")
            }
        }
        context = container.viewContext
    }
    func save() {
        do {
            try context.save()
            print("Saved successfully")
        } catch let error {
            print ("error saving cora data: \(error.localizedDescription)")
        }
       
    }
}

class CoreDataRelationshipsViewModel: ObservableObject {
    let manager = CoreDataManager.instance
    @Published var businesses: [BusinessEntity] = []
    
    init() {
        getBusinesses()
    }
    
    func getBusinesses() {
        let request = NSFetchRequest<BusinessEntity>(entityName: "BusinessEntity")
        do {
            businesses = try manager.context.fetch(request)
        } catch let error {
            print("error fetching: \(error)")
        }
        
    }
    
    func addBusiness() {
        let newBusiness = BusinessEntity(context: manager.context)
        newBusiness.name = "Apple"
        save()
    }
    func save() {
        manager.save()
    }
}


struct CoreDataRelationshipsBootcamp: View {
    
    @StateObject var vm = CoreDataRelationshipsViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20){
                    Button(action: {
                        vm.addBusiness()
                    }, label: {
                        Text("Perform action")
                            .foregroundStyle(Color.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    })
                    ScrollView {
                        HStack(alignment: .top, content: {
                            ForEach(vm.businesses) { business in
                            BusinessView(entity: business)
                            }
                        })
                    }
                }
                .padding()
            }
            .navigationTitle("Relationships")
        }
    }
}

#Preview {
    CoreDataRelationshipsBootcamp()
}

struct BusinessView: View {
    
    let entity: BusinessEntity
    
    var body: some View {
        VStack(alignment:.leading, spacing: 20){
            Text("Name: \(entity.name ?? "" )")
                .bold()
            
            if let departments = entity.departments?.allObjects as? [DepartmentEntity] {
                Text("Departments:")
                    .bold()
                ForEach(departments) { department in
                    Text(department.name ?? "")
                }
            }
            if let employees = entity.employees?.allObjects as? [EmployeeEntity]{
                Text("employes:")
                    .bold()
                ForEach(employees) { employee in
                    Text(employee.name ?? "")
                }
            }
        }
        .padding()
        .frame(maxWidth: 300, alignment: .leading)
        .background(Color.gray.opacity(0.6))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 10)
    }
}
