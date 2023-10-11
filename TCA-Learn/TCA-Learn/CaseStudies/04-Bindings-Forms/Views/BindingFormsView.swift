//
//  BindingFormsView.swift
//  TCA-Learn
//
//  Created by 김민석 on 2023/10/11.
//

import SwiftUI

private let readme = """
이 화면은 Composable Architecture를 사용하여 양방향 바인딩을 다루는 방법을 보여줍니다.
바인딩 상태와 액션을 사용하면 모든 UI 컨트롤에 고유한 액션을 필요로 하는 부수적인 코드를 안전하게 제거할 수 있습니다. 
대신, 모든 UI 바인딩은 BindingAction 값을 보유하는 단일 binding 액션으로 통합되며, 모든 바인딩 상태는 BindingState 프로퍼티 래퍼로 안전하게 보호됩니다.

"Binding Basics" case study와 이 케이스 스터디를 비교하는 것은 교육적입니다. "Binding Basics" 케이스 스터디에서는 기본적인 바인딩 개념을 설명하며, 여기에서는 Composable Architecture를 사용하여 더 고급 바인딩을 다룹니다. Composable Architecture를 사용하면 복잡한 상태 관리 및 UI 상호작용을 더 쉽게 다룰 수 있으며, 코드의 재사용성과 유지 관리성을 향상시킬 수 있습니다.
"""

struct BindingFormsView: View {
    
    @State var txt: String = ""
    @State var isOn: Bool = false
    @State var stepperValue: Int = 0
    @State var sliderValue: Double = 0
    
    var body: some View {
        Form {
            Section {
                AboutView(readme: readme)
            }
            Section {
                TextField("Type here", text: $txt)
                Toggle(
                    "Disable other controls",
                    isOn: $isOn
                )
                
                Stepper(
                    "Max slider value: \(stepperValue)",
                    value: $stepperValue
                )
                HStack {
                    Text("Slider value: \(Int(sliderValue))")
                    Slider(
                        value: $sliderValue,
                        in: 0...100
                    )
                }
                Button("Reset") {
                    
                }
                .foregroundStyle(Color.red)
            }
        }
        .navigationTitle("Binding Forms")
    }
}

