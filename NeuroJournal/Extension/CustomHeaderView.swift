//
//  CustomHeaderView.swift
//  NeuroJournal
//
//  Created by tw on 1/11/25.
//

import SwiftUI

struct CustomHeaderView: View {
    
    @Binding var item: Item
    @State private var isExpandable: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(item.text)
                .font(.headline)
                .frame(maxWidth: UIScreen.main.bounds.width * 0.75, alignment: .leading)
                .padding()
                .background(.yellow)
                .clipShape(
                    CustomCornerShape(
                        radius: 15,
                        corner: [
                            .topLeft,
                            .topRight
                        ])
                )
                .onTapGesture {
                    isExpandable = !isExpandable
                }
            
            if isExpandable {
                WritingView(item: $item)
//                Text("1")
            } else {
                
            }
        }
    }
}

//#Preview {
//    CustomHeaderView(item: .constant(Item(text: "123", timestamp: Date())))
//}
