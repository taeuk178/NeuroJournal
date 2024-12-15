//
//  ScheduleView.swift
//  NeuroJournal
//
//  Created by tw on 12/15/24.
//

import Foundation
import SwiftUI

struct ScheduleView: View {
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                ForEach(1...31, id: \.self) { day in
                    Text("\(day)일")
                        .font(.system(size: 16))
                }
            }.padding()
        }.background(Color.gray.opacity(0.2))
    }
}
