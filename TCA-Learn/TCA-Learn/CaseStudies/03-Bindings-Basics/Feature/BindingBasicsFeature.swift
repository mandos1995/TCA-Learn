//
//  BindingBasicsFeature.swift
//  TCA-Learn
//
//  Created by 김민석 on 2023/10/11.
//

import Foundation

import ComposableArchitecture

struct BindingBasicsFeature: Reducer {
    
    struct State: Equatable {
        var text: String = ""
        var toggleIsOn: Bool = false
        var stepCount: Int = 10
        var sliderValue: Double = 5.0
    }
    
    enum Action {
        case textChanged(text: String)
        case toggleChanged(isOn: Bool)
        case stepCountChanged(count: Int)
        case sliderValueChanged(value: Double)
    }
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .textChanged(let text):
            state.text = text
            return .none
        case .toggleChanged(let isOn):
            state.toggleIsOn = isOn
            return .none
        case .stepCountChanged(let count):
            state.sliderValue = min(state.sliderValue, Double(count))
            state.stepCount = count
            return .none
        case .sliderValueChanged(let value):
            state.sliderValue = value
            return .none
        }
    }
}
