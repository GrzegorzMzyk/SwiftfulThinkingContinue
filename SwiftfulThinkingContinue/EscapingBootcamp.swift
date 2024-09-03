//
//  EscapingBootcamp.swift
//  SwiftfulThinkingContinue
//
//  Created by Grzegorz Mzyk on 03/09/2024.
//

import SwiftUI

class EscapingViewModel: ObservableObject {
    @Published var text: String = "Hello"
    
    func getData() {
        
        downloadData5 { [weak self] (returnResult) in
            self?.text = returnResult.data
        }
//        downloadData3 { [weak self] (returnedData) in
//            self?.text = returnedData
//        }
    }
    
    func downloadData1() -> String {
        return "New data"
    }
    
    func downloadData2(completionHandler: (_ data: String) -> Void) {
        completionHandler("New data")
    }
    
    func downloadData3(completionHandler: @escaping (_ data: String) -> ()){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completionHandler("New data")
        }
    }
    
    func downloadData4(completionHandler: @escaping (DownloadResult) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let result =  DownloadResult(data: "New data")
            completionHandler(result)
        }
    }
    func downloadData5(completionHandler: @escaping DownloadCompletion) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let result =  DownloadResult(data: "New data")
            completionHandler(result)
        }
    }

}

struct DownloadResult {
    let data: String
}
typealias DownloadCompletion = (DownloadResult) -> ()


//    func doSomething(_ data: String) -> () {
//        print(data)
//    }
    
// (_ data: String)   TO JEST TO SAMO    downloadData2 { data in text = data

struct EscapingBootcamp: View {
    
    @StateObject var vm = EscapingViewModel()
    
    var body: some View {
        Text(vm.text)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundStyle(Color.blue)
            .onTapGesture {
                vm.getData()
            }
    }
}

#Preview {
    EscapingBootcamp()
}
