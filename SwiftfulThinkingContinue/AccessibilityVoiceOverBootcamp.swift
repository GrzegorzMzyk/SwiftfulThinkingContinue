//
//  AccessibilityVoiceOverBootcamp.swift
//  SwiftfulThinkingContinue
//
//  Created by Grzegorz Mzyk on 30/09/2024.
//

import SwiftUI

struct AccessibilityVoiceOverBootcamp: View {
    
    @State private var isActive: Bool = false
    
    var body: some View {
        NavigationStack{
            Form {
                Section {
                    Toggle ("Volume", isOn: $isActive)
                    
                    HStack {
                        Text("Volume")
                        Spacer()
                        
                        Text(isActive ? "True" : "False")
                            .accessibilityHidden(true)
                    }
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        isActive.toggle()
                    }
                    .accessibilityElement(children: .combine)
                    .accessibilityAddTraits(.isButton)
                    .accessibilityValue(isActive ? "is ON" : "is OFF")
                    .accessibilityHint("Double tap to toggle setting")
                    .accessibilityAction {
                        isActive.toggle()
                    }
                }
                Section {
                    Button("Favorites") {
                        
                    }
                    .accessibilityRemoveTraits(.isButton)
                    Button {
                        
                    } label: {
                        Image(systemName: "heart.fill")
                    }
                    .accessibilityLabel("Favorites")
                    
                    Text("Favorites")
                        .accessibilityAddTraits(.isButton)
                        .onTapGesture {
                            
                        }

                } header: {
                    Text("Aplication")
                }
                VStack {
                Text("Content")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundStyle(Color.secondary)
                        .font(.caption)
                        .accessibilityAddTraits(.isHeader)
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 8) {
                            ForEach(0..<10) { x in
                                VStack{
                                    Image("dog-shiba")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 100, height: 100)
                                        .clipShape(RoundedRectangle(cornerRadius: 25))
                                    Text("Item \(x)")
                                }
                                .onTapGesture {
                                    
                                }
                                .accessibilityElement(children: .combine)
                                .accessibilityAddTraits(.isButton)
                                .accessibilityLabel("Item \(x). Image of dog")
                                .accessibilityHint("Double tap to open")
                                .accessibilityAction {
                                    
                                }
                            }
                        }
                    }
                }
                }
            .navigationTitle("Settings")
            }
        }
    }


#Preview {
    AccessibilityVoiceOverBootcamp()
}
