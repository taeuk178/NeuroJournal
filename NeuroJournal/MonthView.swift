//
//  MonthView.swift
//  NeuroJournal
//
//  Created by tw on 12/15/24.
//

import Foundation
import SwiftUI

struct MonthView: View {
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                ForEach(1...12, id: \.self) { month in
                    Text("\(month)월")
                        .font(.system(size: 16))
                }
            }.padding()
        }.background(Color.gray.opacity(0.2))
    }
}
