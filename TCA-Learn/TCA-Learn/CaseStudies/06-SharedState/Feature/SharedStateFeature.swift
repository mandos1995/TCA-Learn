//
//  SharedStateFeature.swift
//  TCA-Learn
//
//  Created by 김민석 on 2023/10/12.
//

import Foundation

import ComposableArchitecture

struct SharedState: Reducer {
    enum Tab { case counter, profile }
    
    struct State: Equatable {
        var counter = Counter.State()
        var currentTab: Tab = .counter
        
        var profile: Profile.State {
            get {
                Profile.State(
                    currentTab: self.currentTab,
                    maxCount: self.counter.maxCount,
                    minCount: self.counter.minCount,
                    numberOfCounts: self.counter.numberOfCount
                )
            }
            set {
                self.currentTab = newValue.currentTab
                self.counter.count = newValue.count
                self.counter.maxCount = newValue.maxCount
                self.counter.minCount = newValue.minCount
                self.counter.numberOfCount = newValue.numberOfCounts
            }
        }
    }
    
    enum Action: Equatable {
        case counter(Counter.Action)
        case profile(Profile.Action)
        case selectTab(Tab)
    }
    
    var body: some Reducer<State, Action> {
        Scope(state: \.counter, action: /Action.counter) {
            Counter()
        }
        
        Scope(state: \.profile, action: /Action.profile) {
            Profile()
        }
        
        Reduce { state, action in
            switch action {
            case .counter, .profile:
                return .none
            case .selectTab(let tab):
                state.currentTab = tab
                return .none
            }
        }
    }
    
    struct Counter: Reducer {
        struct State: Equatable {
            @PresentationState var alert: AlertState<Action.Alert>?
            var count = 0
            var maxCount = 0
            var minCount = 0
            var numberOfCount = 0
        }
        
        enum Action: Equatable {
            case alert(PresentationAction<Alert>)
            case decrementButtonTapped
            case incrementButtonTapped
            case isPrimeButtonTapped
            
            enum Alert: Equatable { }
        }
        
        var body: some Reducer<State, Action> {
            Reduce { state, action in
                switch action {
                case .alert:
                    return .none
                case .incrementButtonTapped:
                    state.count += 1
                    state.numberOfCount += 1
                    state.maxCount = max(state.count, state.maxCount)
                    return .none
                case .decrementButtonTapped:
                    state.count -= 1
                    state.numberOfCount += 1
                    state.minCount = min(state.count, state.minCount)
                    return .none
                case .isPrimeButtonTapped:
                    state.alert = AlertState {
                        TextState(
                            isPrime(state.count)
                            ? "👍 The number \(state.count) is prime!"
                            : "👎 The number \(state.count) is not prime :("
                        )
                    }
                    return .none
                }
            }
            .ifLet(\.$alert, action: /Action.alert)
        }
    }
    
    struct Profile: Reducer {
        struct State: Equatable {
            private(set) var currentTab: Tab
            private(set) var count = 0
            private(set) var maxCount: Int
            private(set) var minCount: Int
            private(set) var numberOfCounts: Int
            
            fileprivate mutating func resetCount() {
                self.currentTab = .counter
                self.count = 0
                self.maxCount = 0
                self.minCount = 0
                self.numberOfCounts = 0
            }
        }
        
        enum Action: Equatable {
            case resetCounterButtonTapped
        }
        
        func reduce(into state: inout State, action: Action) -> Effect<Action> {
            switch action {
            case .resetCounterButtonTapped:
                state.resetCount()
                return .none
            }
        }
    }
}


private func isPrime(_ p: Int) -> Bool {
  if p <= 1 { return false }
  if p <= 3 { return true }
  for i in 2...Int(sqrtf(Float(p))) {
    if p % i == 0 { return false }
  }
  return true
}

