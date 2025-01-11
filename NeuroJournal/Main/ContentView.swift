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
    
    @State private var writeModel: [Item] = []
    
    var body: some View {
        List {
            ForEach($writeModel) { $item in
                ZStack {
                    CustomHeaderView(item: $item)
                }
                .listRowSeparator(.hidden)
                .listRowBackground(Color.white)
                .listRowInsets(
                    EdgeInsets(
                        top: 2,
                        leading: 3,
                        bottom: 2,
                        trailing: 0
                    )
                )
            }
        }
        .listStyle(PlainListStyle())
        .onAppear {
            if items.isEmpty {
                addTestData()
            }
            
            writeModel = items
            
        }
    }
    
    private func addTestData() {
        let sampleItems = [
            Item(text: "2025/01/11", timestamp: Date()),
            Item(text: "2025/01/10", timestamp: Date()),
            Item(text: "2025/01/09", timestamp: Date()),
            Item(text: "2025/01/08", timestamp: Date())
        ]
        for item in sampleItems {
            modelContext.insert(item)
        }
        
        try? modelContext.save()
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
