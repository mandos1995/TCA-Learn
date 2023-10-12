//
//  SharedStateView.swift
//  TCA-Learn
//
//  Created by 김민석 on 2023/10/12.
//

import SwiftUI

private let counterReadme = "counter"
private let profileReadme = "profile"

struct SharedStateView: View {
    enum TabType: String {
        case counter = "Counter"
        case profile = "Profile"
    }
    @State var tabType: TabType = .counter
    var body: some View {
        VStack {
            Picker("Tab", selection: $tabType) {
                Text("Counter")
                    .tag(TabType.counter)
                Text("Profile")
                    .tag(TabType.profile)
            }
            .pickerStyle(.segmented)
            
            if tabType == .counter {
                SharedStateCounterView()
            } else {
                SharedStateProfileView()
            }
            Spacer()
        }
        .padding()
    }
}

struct SharedStateCounterView: View {
    var body: some View {
        VStack(spacing: 64) {
            Text(counterReadme)
            VStack(spacing: 16) {
                HStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "minus")
                    }
                    Text("0")
                    Button {
                        
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                Button("Is this prime?") {
                    //
                }
            }
            
        }.navigationTitle("Shared State")
    }
}

struct SharedStateProfileView: View {
    var body: some View {
        VStack(spacing: 64) {
            Text(profileReadme)
            VStack(spacing: 16) {
                Text("Current count: 0")
                Text("Max count: 0")
                Text("Min count: 0")
                Text("Total number of count events: 0")
                Button("Reset") {
                    print("Reset Tab")
                }
            }
        }
        .navigationTitle("Profile")
    }
}
