//
//  SharedStateView.swift
//  TCA-Learn
//
//  Created by 김민석 on 2023/10/12.
//

import SwiftUI

import ComposableArchitecture

private let counterReadme = """
이 화면은 Composable Architecture에서 여러 독립적인 화면이 상태를 공유하는 방법을 보여줍니다. 각 탭은 자체 상태를 관리하며 별도의 모듈에 있을 수 있지만 한 탭에서의 변경 사항은 즉시 다른 탭에서 반영됩니다.

이 탭은 자체 상태를 가지고 있으며 이 상태에는 증가 및 감소할 수 있는 카운트 값과 현재 카운트가 소수인지 확인하는 데 사용되는 알림 값이 포함되어 있습니다.

내부적으로, 이 탭은 최소 및 최대 카운트 및 발생한 카운트 이벤트의 총 수와 같은 다양한 통계를 추적하고 있습니다. 이러한 상태는 다른 탭에서 볼 수 있으며 통계를 재설정할 수 있는데, 이는 Composable Architecture에서 상태를 공유하고 다른 화면 간에 데이터를 전달하고 조작하는 방법을 보여줍니다.
"""
private let profileReadme = """
이 탭은 이전 탭에서의 상태를 표시하며, 모든 상태를 0으로 재설정할 수 있습니다.

이것은 각 화면이 자체 상태를 가장 적합한 방식으로 모델링할 수 있지만 동시에 독립적인 화면 간에 상태와 변경 사항을 공유할 수 있는 가능성을 보여줍니다. 다시 말해, 각 화면은 그 자체 독립적인 방식으로 상태를 관리하면서도 필요한 경우 다른 화면에서의 상태를 참조하고 수정할 수 있음을 의미합니다.

이것은 Composable Architecture나 비슷한 상태 관리 패턴을 사용하는 앱에서 중요한 개념입니다. 각 화면은 자체 상태를 유지하면서, 필요한 경우 다른 화면과 데이터를 공유하고 동기화하는 데 필요한 메커니즘을 제공합니다.
"""

struct SharedStateView: View {
    let store: StoreOf<SharedState>
    
    var body: some View {
        WithViewStore(self.store, observe: \.currentTab) { viewStore in
            VStack {
                Picker("Tab", selection: viewStore.binding(send: { .selectTab($0) } )) {
                    Text("Counter")
                        .tag(SharedState.Tab.counter)
                    Text("Profile")
                        .tag(SharedState.Tab.profile)
                }
                .pickerStyle(.segmented)
                
                if viewStore.state == .counter {
                    SharedStateCounterView(store: store.scope(state: \.counter, action: { .counter($0) }))
                } else {
                    SharedStateProfileView(store: store.scope(state: \.profile, action: { .profile($0) }))
                }
                Spacer()
            }
            .padding()
        }
    }
}

struct SharedStateCounterView: View {
    let store: StoreOf<SharedState.Counter>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack(spacing: 64) {
                Text(counterReadme)
                VStack(spacing: 16) {
                    HStack {
                        Button {
                            viewStore.send(.decrementButtonTapped)
                        } label: {
                            Image(systemName: "minus")
                        }
                        Text("\(viewStore.count)")
                        Button {
                            viewStore.send(.incrementButtonTapped)
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                    Button("Is this prime?") {
                        viewStore.send(.isPrimeButtonTapped)
                    }
                }
                
            }
            .padding(.top)
            .alert(store: self.store.scope(state: \.$alert, action: { .alert($0) }))
            .navigationTitle("Shared State")
        }
        
    }
}

struct SharedStateProfileView: View {
    let store: StoreOf<SharedState.Profile>
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack(spacing: 64) {
                Text(profileReadme)
                VStack(spacing: 16) {
                    Text("Current count: \(viewStore.count)")
                    Text("Max count: \(viewStore.maxCount)")
                    Text("Min count: \(viewStore.minCount)")
                    Text("Total number of count events: \(viewStore.numberOfCounts)")
                    Button("Reset") {
                        viewStore.send(.resetCounterButtonTapped)
                    }
                }
            }
            .navigationTitle("Profile")
        }
    }
}
