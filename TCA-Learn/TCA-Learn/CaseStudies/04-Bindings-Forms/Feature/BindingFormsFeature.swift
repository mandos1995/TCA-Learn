//
//  BindingFormsFeature.swift
//  TCA-Learn
//
//  Created by 김민석 on 2023/10/11.
//

import Foundation

import ComposableArchitecture

struct BindingFormsFeature: Reducer {
    
    struct State: Equatable {
        @BindingState var text: String = ""
        @BindingState var toggleIsOn: Bool = false
        @BindingState var stepCount: Int = 10
        @BindingState var sliderValue: Double = 5.0
    }
    
    enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        case resetButtonTapped
    }
    
    var body: some Reducer<State, Action> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .binding:
                return .none
            case .binding(\.$stepCount):
                state.sliderValue = min(state.sliderValue, Double(state.stepCount))
                return .none
            case .resetButtonTapped:
                state = State()
                return .none
            }
        }
    }
}
