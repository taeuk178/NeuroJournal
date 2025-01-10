//
//  WritingView.swift
//  NeuroJournal
//
//  Created by tw on 1/11/25.
//

import SwiftUI
import SwiftData

struct WritingView: View {
    @State var text: String = ""
//    @Binding var item: Item? // 기존 Item을 바인딩
    
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        NavigationView {
            TextView(text: $text, placeholder: "Please Enter")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .navigationTitle("쓰기")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            saveData()
                            dismiss()
                        } label: {
                            Text("완료")
                        }
                    }
                }
        }
        .onAppear {
            // NavigationBar 색 변경
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = UIColor.lightGray
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white] // 제목 색을 흰색으로 변경
            appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white] // 대제목 색 변경
            
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().compactAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
            
//            if let item {
//                text = item.text
//            }
        }
    }
    
    func saveData() {
        guard !text.isEmpty else { return } // 텍스트가 비어있으면 저장하지 않음
        
//        if let item {
//            item.text = text
//        } else {
//            let newItem = Item(text: text, timestamp: Date())
//            modelContext.insert(newItem) // SwiftData에 저장
//        }
    }
}

#Preview {
    WritingView()
}
