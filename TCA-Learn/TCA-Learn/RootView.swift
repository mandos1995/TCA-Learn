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
                    
                    NavigationLink("Two Counter") {
                        TwoCounterView(store: Store(initialState: TwoCounterFeature.State()) {
                            TwoCounterFeature()
                                ._printChanges()
                        })
                    }
                    NavigationLink("Binding Basics") {
                        BindingBasicsView(store: Store(initialState: BindingBasicsFeature.State()) {
                            BindingBasicsFeature()
                                ._printChanges()
                        })
                    }
                    
                    NavigationLink("Binding Forms") {
                        BindingFormsView(store: Store(initialState: BindingFormsFeature.State()) {
                            BindingFormsFeature()
                                ._printChanges()
                        })
                    }
                    NavigationLink("Optional State") {
                        OptionalStateView(store: Store(initialState: OptionalStateFeature.State()) {
                            OptionalStateFeature()
                                ._printChanges()
                        })
                    }
                    NavigationLink("Shared State") {
                        SharedStateView(store: Store(initialState: SharedState.State()) {
                            SharedState()
                                ._printChanges()
                        })
                    }
                }
            }
            .navigationTitle("Case Studies")
        }
        
    }
}
