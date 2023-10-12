//
//  OptionalStateFeature.swift
//  TCA-Learn
//
//  Created by 김민석 on 2023/10/12.
//

import Foundation

import ComposableArchitecture

struct OptionalStateFeature: Reducer {
    struct State: Equatable {
        var optionalCounter: CounterFeature.State?
    }
    
    enum Action: Equatable {
        case optionalCounter(CounterFeature.Action)
        case toggleCounterButtonTapped
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .toggleCounterButtonTapped:
                state.optionalCounter = state.optionalCounter == nil ? CounterFeature.State() : nil
                return .none
            case .optionalCounter:
                return .none
            }
        }
        .ifLet(\.optionalCounter, action: /Action.optionalCounter) {
            CounterFeature()
        }
    }

}
