//
//  OptionalStateView.swift
//  TCA-Learn
//
//  Created by 김민석 on 2023/10/12.
//

import SwiftUI

private let readme = """
이 화면은 선택적 자식 상태의 존재에 따라 보기를 표시하거나 숨기는 방법을 보여주고 있습니다.

부모 상태는 'CounterState?' 값을 보유합니다. 이 값이 'nil' 일 때, 일반 텍스트 뷰를 기본값으로 표시합니다. 그러나 'nil'이 아닌 경우 선택적 카운터 상태를 사용하는 카운터 뷰 프래그먼트를 표시합니다.

"Toggle counter state"을 탭하면 'nil'과 'nil'이 아닌 카운터 상태 간을 전환합니다.
"""

struct OptionalStateView: View {
    var body: some View {
        Form {
            Section {
                AboutView(readme: readme)
            }
            Section {
                Button("Toggle counter state") {
                    //
                }
                Text("CounterState is nil")
            }
        }
        .navigationTitle("Optional State")
    }
}
