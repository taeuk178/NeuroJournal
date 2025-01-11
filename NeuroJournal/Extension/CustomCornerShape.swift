//
//  CustomCornerShape.swift
//  NeuroJournal
//
//  Created by tw on 1/11/25.
//

import SwiftUI

struct CustomCornerShape: Shape {
    
    var radius: CGFloat
    var corner: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corner,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        
        return Path(path.cgPath)
    }
}
