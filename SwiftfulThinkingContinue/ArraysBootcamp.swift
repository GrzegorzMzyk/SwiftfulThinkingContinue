//
//  ArraysBootcamp.swift
//  SwiftfulThinkingContinue
//
//  Created by Grzegorz Mzyk on 22/08/2024.
//

import SwiftUI

struct UserModel: Identifiable {
    let id = UUID().uuidString
    let name: String?
    let points: Int
    let isVerified: Bool
}

class ArrayModificationViewModel: ObservableObject {
    
    @Published var dataArray: [UserModel] = []
    @Published var filterArray: [UserModel] = []
    @Published var mappedArray : [String] = []
    init() {
        getUsers()
        updateFilterArray()
    }
    
    func updateFilterArray() {
        //sort
        /*
            filterArray = dataArray.sorted { user1, user2 in
                return user1.points > user2.points
            } to jest to samo co ->
            filterArray = dataArray.sorted(by: {$0.points > $1.points})
    */
        // filter
        /*
        filterArray = dataArray.filter({ user in
            return user.isVerified
        }) // to tosamo co ->
        filterArray = dataArray.filter({$0.isVerified}) 
        */
        //map
        /*
//        mapArray = dataArray.map({ user in
//            return user.name ?? "error"
//        })
//        mapArray = dataArray.map({$0.name})
    
    mapArray = dataArray.compactMap({ user in
        return user.name
    })
    */
        
        
        mappedArray = dataArray
            .sorted(by: {$0.points > $1.points})
            .filter({$0.isVerified})
            .compactMap({$0.name})
    }
   
    func getUsers() {
        let user1 = UserModel(name: "Grzegorz", points: 5, isVerified: true)
        let user2 = UserModel(name: "Ola", points: 6, isVerified: false)
        let user3 = UserModel(name: "Paweł", points: 6, isVerified: true)
        let user4 = UserModel(name: "Sandra", points: 4, isVerified: false)
        let user5 = UserModel(name: "Gosia", points: 9, isVerified: false)
        let user6 = UserModel(name: "Oliwia", points: 4, isVerified: true)
        let user7 = UserModel(name: nil, points: 1, isVerified: true)
        let user8 = UserModel(name: "Krystyna", points: 9, isVerified: true)
        let user9 = UserModel(name: nil, points: 6, isVerified: false)
        let user10 = UserModel(name: "Jakub", points: 8, isVerified: true)
        self.dataArray.append(contentsOf: [
            user1,
            user2,
            user3,
            user4,
            user5,
            user6,
            user7,
            user8,
            user9,
            user10,
        ])
    }
}

struct ArraysBootcamp: View {
    
    @StateObject var vm = ArrayModificationViewModel()

    
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10){
                ForEach(vm.mappedArray, id: \.self) { name in
                    Text(name)
                        .font(.title)
                }
                
                
//                ForEach(vm.filterArray) { user in
//                    VStack(alignment: .leading) {
//                        Text(user.name)
//                            .font(.headline)
//                        HStack {
//                            Text("Points \(user.points)")
//                            Spacer()
//                            if user.isVerified {
//                                Image(systemName: "flame.fill")
//                            }
//                        }
//                    }
//                    .foregroundStyle(Color.white)
//                    .padding()
//                    .background(Color.blue.clipShape(RoundedRectangle(cornerRadius: 10)))
//                    .padding(.horizontal)
//                }
            }
        }
    }
}

#Preview {
    ArraysBootcamp()
}
