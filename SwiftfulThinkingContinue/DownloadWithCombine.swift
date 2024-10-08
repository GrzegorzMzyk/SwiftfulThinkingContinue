//
//  DownloadWithCombine.swift
//  SwiftfulThinkingContinue
//
//  Created by Grzegorz Mzyk on 08/09/2024.
//

import SwiftUI
import Combine

struct PostModel :Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
class DownloadWithCombineViewModel : ObservableObject {
    
    @Published var posts: [PostModel] = []
    var cancellables = Set<AnyCancellable>()
    
    init() {
        getPosts()
    }
    
    func getPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        // Combine discution:
        /*
         1. sign up for monthly subscription for package to be delivered
         2. the company would make a package behind the scene
         3. recieve the package at your door
         4. make sure the box isn't damaged
         5. open and make sure the item is correct
         6. use the item !!!
         7. cancellable at any time!!!
       
        
         1. create the publisher
         2. subscribe publisher on background thread (w combine dzieje się to automatycznie)
         3. recieve on main thread
         4. tryMap (check that data is good)
         5. decode (decode data into PostModels)
         6. sink (put the item into our app)
         7. store (cancel subscription if needed)
         */
        
        // checking data
        
        URLSession.shared.dataTaskPublisher(for: url)
//            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: [PostModel].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .sink(receiveValue: { [weak self] (returnedPosts) in
                self?.posts = returnedPosts})
                
//                switch completion {
//                case.finished :
//                    print("finish")
//                case.failure(let error):
//                    print("there was an error: \(error)")
//                }
            .store(in: &cancellables)

    }
    
    func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard
            let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
    
}
struct DownloadWithCombine: View {
    
    @StateObject var vm = DownloadWithEscapingViewModel()
    
    var body: some View {
        List {
            ForEach(vm.posts) { post in
                VStack(alignment: .leading) {
                    Text(post.title)
                        .font(.headline)
                    Text(post.body)
                        .foregroundStyle(Color.gray)
                }
            }
        }
    }
}

#Preview {
    DownloadWithCombine()
}
