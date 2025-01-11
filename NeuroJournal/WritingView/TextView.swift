//
//  TextView.swift
//  NeuroJournal
//
//  Created by tw on 12/15/24.
//

import Foundation
import SwiftUI

struct TextView: UIViewRepresentable {
    @Binding var item: Item
    var placeholder: String
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.delegate = context.coordinator
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.text = placeholder
        textView.textColor = .lightGray
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        if uiView.text == placeholder && item.text.isEmpty {
            uiView.text = placeholder
            uiView.textColor = .lightGray
        } else {
            uiView.text = item.text
            uiView.textColor = .black
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        var parent: TextView
        
        init(_ parent: TextView) {
            self.parent = parent
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            if textView.text == parent.placeholder {
                textView.text = ""
                textView.textColor = .black
            }
        }
        
        func textViewDidEndEditing(_ textView: UITextView) {
            if textView.text.isEmpty {
                textView.text = parent.placeholder
                textView.textColor = .lightGray
            }
        }
        
        func textViewDidChange(_ textView: UITextView) {
            parent.item.text = textView.text
        }
    }
}
