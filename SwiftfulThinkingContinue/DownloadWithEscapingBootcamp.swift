//
//  DownloadWithEscapingBootcamp.swift
//  SwiftfulThinkingContinue
//
//  Created by Grzegorz Mzyk on 06/09/2024.
//

import SwiftUI

class DownloadWithEscapingViewModel: ObservableObject {
    
    init() {
        getPosts()
    }
    
    func getPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                print("no data")
                return
            }
            guard error == nil else {
                print("Error:\(String(describing: error))")
                return
            }
            guard let response = response as? HTTPURLResponse else {
                print("Invalid response")
                return
            }
            guard response.statusCode >= 200 && response.statusCode < 300 else {
                print("Status code should be 2xx, but is \(response.statusCode)")
                return
            }
            print("Successfully downloaded data")
            print (data)
            let jsonString = String(data: data, encoding: .utf8)
            print(jsonString)
            
        }.resume()
    }
    
    
}

struct DownloadWithEscapingBootcamp: View {
    
    @StateObject var vm = DownloadWithEscapingViewModel()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    DownloadWithEscapingBootcamp()
}
