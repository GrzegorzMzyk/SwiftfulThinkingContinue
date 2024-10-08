//
//  BackgroundThreadBootcamp.swift
//  SwiftfulThinkingContinue
//
//  Created by Grzegorz Mzyk on 01/09/2024.
//

// From GPT:  DispatchQueue w języku Swift to klasa należąca do frameworka Grand Central Dispatch (GCD), która zarządza kolejkami zadań (queues) i pozwala na asynchroniczne lub synchroniczne wykonywanie kodu w różnych wątkach. GCD jest technologią Apple służącą do efektywnego zarządzania współbieżnością (ang. concurrency) w aplikacjach, co pozwala na wykonywanie wielu zadań równocześnie, nie blokując głównego wątku (zwłaszcza interfejsu użytkownika).

import SwiftUI

class BackgroundThreadViewModel: ObservableObject {
    
    @Published var dataArray: [String] = []
    
    func fetchData() {
        
//        DispatchQueue.global().async {
        DispatchQueue.global(qos: .background).async {
            let newData = self.downloadData()
            print("Check 1:\(Thread.isMainThread)")
            print("Check 1:\(Thread.current)")
            
            DispatchQueue.main.async {
                self.dataArray = newData
                print("Check 2:\(Thread.isMainThread)")
                print("Check 2:\(Thread.current)")
            }
            
        }
        
        
    }
    private func downloadData() ->[String] {
        var data: [String] = []
        for x in 0..<100 {
            data.append("\(x)")
            print(data)
        }
        return data
    }
}

struct BackgroundThreadBootcamp: View {
    
    @StateObject var vm = BackgroundThreadViewModel()
    
    var body: some View {
        ScrollView{
            LazyVStack(spacing: 10) {
                Text("Load data")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .onTapGesture {
                        vm.fetchData()
                    }
                
                ForEach(vm.dataArray, id: \.self) { item in
                    Text(item)
                        .font(.headline)
                        .foregroundStyle(Color.red)
                }
            }
        }
    }
}

#Preview {
    BackgroundThreadBootcamp()
}
