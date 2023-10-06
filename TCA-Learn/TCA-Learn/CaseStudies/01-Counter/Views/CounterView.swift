//
//  CounterView.swift
//  TCA-Learn
//
//  Created by 김민석 on 2023/10/06.
//

import SwiftUI

struct CounterView: View {
    var body: some View {
        Form {
            Section {
                AboutView(readme: "정보")
            }
            Section {
                HStack(spacing: 10) {
                    Image(systemName: "minus")
                        .foregroundColor(.blue)
                    Text("0")
                    Image(systemName: "plus")
                        .foregroundColor(.blue)
                }
                .frame(maxWidth: .infinity)
            }
        }
        .navigationTitle("Counter")
        .navigationBarTitleDisplayMode(.large)
    }
}
