//
//  ScrollViewReaderBootcamp.swift
//  SwiftfulThinkingContinue
//
//  Created by Grzegorz Mzyk on 21/08/2024.
//

import SwiftUI

struct ScrollViewReaderBootcamp: View {
    @State var textFieldText:String = ""
    @State var scrollToIndex: Int = 0
    var body: some View {
        
        VStack {
            TextField("Enter number here", text:$textFieldText)
                .frame(height: 55)
                .border(.gray)
                .padding(.horizontal)
                .keyboardType(.numberPad)
            
            Button("scroll now") {
                withAnimation(.spring()) {
                    if let index = Int(textFieldText) {
                        scrollToIndex = index
                    }
//                    proxy.scrollTo(30, anchor: .bottom)
                }
            }
            
            ScrollView {
                ScrollViewReader { proxy in
    
                    ForEach(0..<50) { index in
                        Text("this is .. .\(index)")
                            .font(.headline)
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .shadow(radius: 10)
                            .padding()
                            .id(index)
                    }
                    .onChange(of: scrollToIndex) { oldValue, newValue in
                        withAnimation(.spring){
                            proxy.scrollTo(newValue, anchor: .top)
                        }}
                }
            }
        }
    }
}

#Preview {
    ScrollViewReaderBootcamp()
}
