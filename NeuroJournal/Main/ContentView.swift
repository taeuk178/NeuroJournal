//
//  ContentView.swift
//  NeuroJournal
//
//  Created by tw on 12/15/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query private var items: [Item]
    
    let sampleItems = [
        "1994/02/24",
        "2025/01/11",
        "Cherry",
        "Date",
        "Elderberry"
    ]
    
    @State private var showModal: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .center) {
                List(items, id: \.self) { item in
                    Text(item.text)
                        .font(.headline)
                }
                .navigationTitle("일기")
                
                VStack {
                    Spacer() // 상단 공간을 차지
                    HStack {
                        Spacer() // 우측 공간을 차지
                        Button(action: {
                            showModal.toggle()
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .foregroundColor(.blue)
                                .padding()
                        }
                        .padding(.bottom, 10)
                        .padding(.trailing, 10)
                        .sheet(isPresented: $showModal) {
                            WritingView()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
