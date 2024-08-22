//
//  ArraysBootcamp.swift
//  SwiftfulThinkingContinue
//
//  Created by Grzegorz Mzyk on 22/08/2024.
//

import SwiftUI

struct UserModel: Identifiable {
    let id = UUID().uuidString
    let name: String
    let points: Int
    let isVerified: Bool
}

class ArrayModificationViewModel: ObservableObject {
    
    @Published var dataArray: [UserModel] = []
    @Published var filterArray: [UserModel] = []
    
    init() {
        getUsers()
    }
    func getUsers() {
        let user1 = UserModel(name: "Grzegorz", points: 5, isVerified: true)
        let user2 = UserModel(name: "Ola", points: 6, isVerified: false)
        let user3 = UserModel(name: "Paweł", points: 6, isVerified: true)
        let user4 = UserModel(name: "Sandra", points: 4, isVerified: false)
        let user5 = UserModel(name: "Gosia", points: 9, isVerified: false)
        let user6 = UserModel(name: "Oliwia", points: 4, isVerified: true)
        let user7 = UserModel(name: "Jan", points: 1, isVerified: true)
        let user8 = UserModel(name: "Krystyna", points: 9, isVerified: true)
        let user9 = UserModel(name: "Basia", points: 6, isVerified: false)
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
                ForEach(vm.dataArray) { user in
                    VStack(alignment: .leading) {
                        Text(user.name)
                            .font(.headline)
                        HStack {
                            Text("Points \(user.points)")
                            Spacer()
                            if user.isVerified {
                                Image(systemName: "flame.fill")
                            }
                        }
                    }
                    .foregroundStyle(Color.white)
                    .padding()
                    .background(Color.blue.clipShape(RoundedRectangle(cornerRadius: 10)))
                    .padding(.horizontal)
                }
            }
        }
    }
}

#Preview {
    ArraysBootcamp()
}
