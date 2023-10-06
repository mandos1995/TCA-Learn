//
//  RootView.swift
//  TCA-Learn
//
//  Created by 김민석 on 2023/10/06.
//

import SwiftUI

import ComposableArchitecture

struct RootView: View {
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    NavigationLink("Counter") {
                        CounterDemoView(store: Store(initialState: CounterFeature.State()) {
                            CounterFeature()
                                ._printChanges()
                        })
                    }
                }
            }
        }
    }
}
