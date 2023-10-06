//
//  CounterFeature.swift
//  TCA-Learn
//
//  Created by 김민석 on 2023/10/06.
//

import Foundation
import ComposableArchitecture

struct CounterFeature: Reducer {
    struct State: Equatable {
        var count = 0
    }
    
    enum Action: Equatable {
        case incrementButtonTapped
        case decrementButtonTapped
    }
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .incrementButtonTapped:
            state.count += 1
            return .none
        case .decrementButtonTapped:
            state.count -= 1
            return .none
        }
    }
}
