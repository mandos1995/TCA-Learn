//
//  CounterFeature.swift
//  TCA-Learn
//
//  Created by 김민석 on 2023/10/06.
//

import Foundation
import ComposableArchitecture

@Reducer
struct CounterFeature {
    struct State: Equatable {
        var count = 0
    }

    enum Action {
        case incrementButtonTapped
        case decrementButtonTapped
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .decrementButtonTapped:
                state.count -= 1
                return .none
            case .incrementButtonTapped:
                state.count += 1
                return .none
            }
        }
    }
}
