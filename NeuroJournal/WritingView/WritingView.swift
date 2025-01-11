//
//  WritingView.swift
//  NeuroJournal
//
//  Created by tw on 1/11/25.
//

import SwiftUI
import SwiftData

struct WritingView: View {
    @Binding var item: Item
    
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss

    var body: some View {
        
        TextView(item: $item, placeholder: "Please Enter")
            .frame(maxWidth: .infinity)
            .background(Color.orange)
    }
}
//
//    func saveData() {
//        guard !text.isEmpty else { return } // 텍스트가 비어있으면 저장하지 않음
//        
//        if let item {
//            item.text = text
//        } else {
//            let newItem = Item(text: text, timestamp: Date())
//            modelContext.insert(newItem) // SwiftData에 저장
//        }
//    }
//}

#Preview {
    WritingView(item: .constant(Item(text: "예시1", timestamp: Date())))
}
