//
//  CodableBootcamp.swift
//  SwiftfulThinkingContinue
//
//  Created by Grzegorz Mzyk on 06/09/2024.
//

import SwiftUI

struct CustomerModel: Identifiable {
    let id: String
    let name: String
    let points: Int
    let isPremium: Bool
}

class CodableViewModel: ObservableObject {
    
    @Published var customer: CustomerModel? = nil
    init() {
        getData()
    }
    
    
    // manual decoding
    func getData() {
        guard let data = getJSONData() else { return }
        if
            let localData = try? JSONSerialization.jsonObject(with: data),
            let dictionary = localData as? [String:Any],
            
                let id = dictionary["id"] as? String,
                let name = dictionary["name"] as? String,
                let points = dictionary["points"] as? Int,
                let isPremium = dictionary["isPremium"] as? Bool {
            
            let newCustomer = CustomerModel(id: id, name: name, points: points, isPremium: isPremium)
            customer = newCustomer
            }
    }
        
//        print("JSON Data:")
//        print(data)
//        let jsonString = String(data: data, encoding: .utf8)
//        print(jsonString)
    
    
    // fake jsondata
    func getJSONData() -> Data? {
        
        let dictionary: [String:Any] = [
            "id"   : "12345",
            "name" : "Grzegorz",
            "points" : 10,
            "isPremium" : true
        ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: dictionary)
        return jsonData
    }
}


struct CodableBootcamp: View {
    
    @StateObject var vm = CodableViewModel()
    
    var body: some View {
        VStack(spacing:20){
            if let customer = vm.customer {
                Text(customer.id)
                Text(customer.name)
                Text(customer.isPremium.description)
                Text("\(customer.points)")
            }
        }
    }
}

#Preview {
    CodableBootcamp()
}
