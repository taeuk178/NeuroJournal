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
    
    // TextView 띄우기
    @State private var showModal: Bool = false
    
    // 선택된 Item
    @State private var selectedItem: Item? = nil
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .center) {
                List {
                    ForEach(items) { item in
                        VStack(alignment: .leading, spacing: 0) {
                            Text(item.text)
                                .font(.headline)
                            Text(item.timestamp, style: .date)
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .onTapGesture {
                            selectedItem = item
                            showModal.toggle()
                        }
                    }
                }
                .navigationTitle("일기")

                
                VStack {
                    Spacer() // 상단 공간을 차지
                    HStack {
                        Spacer() // 우측 공간을 차지
                        Button(action: {
                            selectedItem = nil
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
                            WritingView(item: $selectedItem)
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
