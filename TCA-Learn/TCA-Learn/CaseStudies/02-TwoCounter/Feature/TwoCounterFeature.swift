//
//  TwoCounterFeature.swift
//  TCA-Learn
//
//  Created by 김민석 on 2023/10/06.
//

import Foundation

import ComposableArchitecture

struct TwoCounterFeature: Reducer {
    struct State: Equatable {
        var counter1 = CounterFeature.State()
        var counter2 = CounterFeature.State()
    }
    
    enum Action: Equatable {
        case counter1(CounterFeature.Action)
        case counter2(CounterFeature.Action)
        case other
    }
    
    var body: some Reducer<State, Action> {
        Scope(state: \.counter1, action: /Action.counter1) {
            CounterFeature()
        }
        Scope(state: \.counter2, action: /Action.counter2) {
            CounterFeature()
        }
    }
}
