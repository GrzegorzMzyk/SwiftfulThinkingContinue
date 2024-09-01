//
//  WeakSelfBootcamp.swift
//  SwiftfulThinkingContinue
//
//  Created by Grzegorz Mzyk on 01/09/2024.
//

import SwiftUI

struct WeakSelfBootcamp: View {
    
    @AppStorage("count") var count: Int?
    init() {
        count = 0
    }
    
    var body: some View {
        NavigationStack{
            NavigationLink("Navigate") {
                WeakSelfSecondScreen()
                   
            }
            .navigationTitle("Screen 1")
        }
        .overlay(alignment: .topTrailing){
            Text("\(count ?? 0)")
                .font(.largeTitle)
                .padding()
                .background(Color.green.clipShape(Circle()))
        }
    }
}





struct WeakSelfSecondScreen: View {
    
    @StateObject var vm = WeakSelfSecondScreenViewModel()
    
    var body: some View {
        VStack {
            Text("Second View")
                .font(.largeTitle)
            .foregroundStyle(Color.red)
            
            if let data = vm.data {
                Text(data)
            }
        }
    }
}





class WeakSelfSecondScreenViewModel: ObservableObject {
    
    @Published var data: String? = nil
    init() {
        print("initialize now")
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount + 1 , forKey: "count")
        getData()
        
    }
    
    deinit {
        print("deinitialize now")
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount - 1 , forKey: "count")
    }
    
    
    func getData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 100) { [weak self] in
            self?.data = "New data!!!"
            // deinit wykona sie dopioro po wykonaniu powyzszej funkcji dlatego self.data
            // i dlatego liczba rosnie i jest to liczba kolejnych ViewModels/class w tle
            
            // jesli [weak self] to wykonuje deinit i to jest ok i nie ma w tle niepotrzebnych zadań
        }
        
    
    }
}






#Preview {
    WeakSelfBootcamp()
}
