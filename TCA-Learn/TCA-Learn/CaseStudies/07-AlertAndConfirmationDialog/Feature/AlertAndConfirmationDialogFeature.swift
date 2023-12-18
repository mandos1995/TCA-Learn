//
//  AlertAndConfirmationDialogFeature.swift
//  TCA-Learn
//
//  Created by 김민석 on 10/24/23.
//

import Foundation
import ComposableArchitecture

struct AlertAndConfirmationDialogFeature: Reducer {
    struct State: Equatable {
        var count: Int = 0
        @PresentationState var alert: AlertState<Action.Alert>?
        @PresentationState var confirmationDialog: ConfirmationDialogState<Action.ConfirmationDialog>?
    }
    
    enum Action: Equatable {
        case alertButtonTapped
        case confirmationDialogButtonTapped
        case alert(PresentationAction<Alert>)
        case confirmationDialog(PresentationAction<ConfirmationDialog>)
        
        enum Alert: Equatable {
            case incrementButtonTapped
        }
        
        enum ConfirmationDialog: Equatable {
            case incrementButtonTapped
            case decrementButtonTapped
        }
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .alert(.presented(.incrementButtonTapped)), .confirmationDialog(.presented(.incrementButtonTapped)):
                state.alert = AlertState { TextState("Incremented!" ) }
                state.count += 1
                return .none
            case .alert: return .none
            case .alertButtonTapped:
                state.alert = AlertState {
                    TextState("Alert!")
                } actions: {
                    ButtonState(role: .cancel) {
                        TextState("Cancel")
                    }
                    ButtonState(action: .incrementButtonTapped) {
                        TextState("Increment")
                    }
                } message: {
                    TextState("This is an Alert")
                }
                return .none
            case .confirmationDialog(.presented(.decrementButtonTapped)):
                state.count -= 1
                return .none
            case .confirmationDialogButtonTapped:
                return .none
            case .confirmationDialog(.dismiss):
                return .none
            }
        }
    }
}

