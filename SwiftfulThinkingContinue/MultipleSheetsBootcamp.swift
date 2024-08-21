//
//  MultipleSheetsBootcamp.swift
//  SwiftfulThinkingContinue
//
//  Created by Grzegorz Mzyk on 21/08/2024.
//

import SwiftUI

struct RandomModel: Identifiable {
    let id = UUID().uuidString
    let title: String
}
// 1 - use a binding
// 2 - use multiple .sheets
// 3 - use $item

struct MultipleSheetsBootcamp: View {
    
    @State var selectedModel: RandomModel?  = nil
    //    @State var showSheet: Bool = false
    //    @State var showSheet2: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(0..<50) { index in
                    Button("Button \(index)") {
                        selectedModel = RandomModel(title: "\(index)")
                    }
                }
            }
            .sheet(item: $selectedModel) { model in
                NextScreen(selectedModel: model)
            }
        }
    }}
//            Button("Button 1") {
//                selectedModel = RandomModel(title: "ONE")
//                showSheet.toggle()
//            }
//            .sheet(isPresented: $showSheet, content: {
//                NextScreen(selectedModel: RandomModel(title: "one"))
//                    })
//            Button("Button 2") {
//                selectedModel = RandomModel(title: "TWO")
////                showSheet2.toggle()
//            }
//            .sheet(isPresented: $showSheet2, content: {
//                NextScreen(selectedModel: RandomModel(title: "two"))
//            })
//        .sheet(isPresented: $showSheet, content: {
//            NextScreen(selectedModel: selectedModel)
//        })
//    }
//}

struct NextScreen: View {
    
//    @Binding var selectedModel: RandomModel
    let selectedModel: RandomModel
    var body: some View {
        Text(selectedModel.title)
            .font(.largeTitle)
    }
}

#Preview {
    MultipleSheetsBootcamp()
}
