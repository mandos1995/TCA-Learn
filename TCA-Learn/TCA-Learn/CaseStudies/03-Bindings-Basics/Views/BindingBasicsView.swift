//
//  BindingBasicsView.swift
//  TCA-Learn
//
//  Created by 김민석 on 2023/10/10.
//

import SwiftUI

import ComposableArchitecture

private let readme =
"""
이 화면은 Composable Architecture에서 양방향 바인딩(two-way bindings)을 다루는 방법을 보여줍니다.

SwiftUI에서의 양방향 바인딩은 강력하지만 Composable Architecture의 "단방향 데이터 흐름"에 어긋나는 특성을 가지고 있습니다. 이는 어떤 요소든 언제든지 값을 변경할 수 있기 때문입니다.

반면, Composable Architecture는 mutations가 store로 액션을 전송함으로써만 발생할 수 있도록 요구합니다. 이는 기능(feature)의 상태가 어떻게 진화하는지 볼 수 있는 유일한 장소인 reducer가 있음을 의미합니다.

Composable Architecture에서는 작업을 수행하기 위해 바인딩(Binding)이 필요한 모든 SwiftUI 컴포넌트를 사용할 수 있습니다. ViewStore에서 binding 메서드를 사용하여 바인딩을 유도할 수 있습니다. 이를 통해 해당 컴포넌트를 렌더링하는 데 어떤 상태가 사용되고, 컴포넌트가 변경될 때 어떤 액션을 보낼지를 지정할 수 있으므로, 기능을 단방향 스타일로 유지할 수 있습니다.
"""

struct BindingBasicsView: View {
    
    let store: StoreOf<BindingBasicsFeature>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            Form {
                Section {
                    AboutView(readme: readme)
                }
                Section {
                    TextField(
                        "Type here",
                        text: viewStore.binding(
                            get: \.text,
                            send: { .textChanged(text: $0) }
                        )
                    )
                    .foregroundStyle(viewStore.toggleIsOn ? .secondary : .primary)
                    .disabled(viewStore.toggleIsOn)
                    
                    Toggle(
                        "Disable other controls",
                        isOn: viewStore.binding(
                            get: \.toggleIsOn,
                            send: { .toggleChanged(isOn: $0) }
                        )
                    )
                    
                    Stepper("Max slider value: \(viewStore.stepCount)",
                            value: viewStore.binding(
                                get: \.stepCount,
                                send: { .stepCountChanged(count: $0) }
                            )
                    )
                    .disabled(viewStore.toggleIsOn)
                    
                    HStack {
                        Text("Slider value: \(Int(viewStore.sliderValue))")
                        Slider(
                            value: viewStore.binding(
                                get: \.sliderValue,
                                send: { .sliderValueChanged(value: $0) }
                            ), in: 0...Double(viewStore.stepCount)
                        )
                        .tint(viewStore.toggleIsOn ? Color.gray : Color.primary)
                        .disabled(viewStore.toggleIsOn)
                    }
                }
            }
            .navigationTitle("Binding Basics")
        }
        
    }
}
