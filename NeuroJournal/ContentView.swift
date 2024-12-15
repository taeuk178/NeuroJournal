//
//  ContentView.swift
//  NeuroJournal
//
//  Created by tw on 12/15/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @State private var text: String = ""
    @State private var showDays = false
    
    
    var body: some View {
        
        GeometryReader { geometry in
            HStack(spacing: 0) {
                
                if showDays {
//                    MonthView()
//                        .frame(width: geometry.size.width * 0.2)
//                        .transition(.move(edge: .leading))
                    
                    ScheduleView()
                        .frame(width: geometry.size.width * 0.4)
                        .transition(.move(edge: .leading))
                }
                
                TextView(text: $text, placeholder: "Please Enter")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .gesture(
                        DragGesture()
                            .onEnded { value in
                                if value.translation.width > 100 {
                                    withAnimation {
                                        showDays = true
                                    }
                                } else if value.translation.width < -100 {
                                    withAnimation {
                                        showDays = false
                                    }
                                }
                            }
                    )
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.gray.opacity(0.1))
        }
    }
}

//struct ContentView: View {
//    @Environment(\.modelContext) private var modelContext
//    @Query private var items: [Item]
//
//    var body: some View {
//        NavigationSplitView {
//            List {
//                ForEach(items) { item in
//                    NavigationLink {
//                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
//                    } label: {
//                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
//                    }
//                }
//                .onDelete(perform: deleteItems)
//            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
//                ToolbarItem {
//                    Button(action: addItem) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
//            }
//        } detail: {
//            Text("Select an item")
//        }
//    }
//
//    private func addItem() {
//        withAnimation {
//            let newItem = Item(timestamp: Date())
//            modelContext.insert(newItem)
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            for index in offsets {
//                modelContext.delete(items[index])
//            }
//        }
//    }
//}

#Preview {
    ContentView()
//        .modelContainer(for: Item.self, inMemory: true)
}
