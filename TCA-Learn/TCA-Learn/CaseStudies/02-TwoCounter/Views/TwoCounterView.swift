//
//  TwoCounterView.swift
//  TCA-Learn
//
//  Created by 김민석 on 2023/10/06.
//

import SwiftUI

import ComposableArchitecture

private let readme =
    """
    이 화면은 작은 기능을 가져와서 더 큰 기능으로 조합하는 방법을 보여줍니다.
    리듀서 빌더 및 Scope 리듀서를 사용하여 작은 기능을 큰 기능으로 통합합니다.
    카운터 화면의 도메인을 재사용하며 이 도메인을 큰 도메인 내에 두 번 포함시킵니다.
    """

struct TwoCounterView: View {
    let store: StoreOf<TwoCounterFeature>
    
    var body: some View {
        Form {
            Section {
                AboutView(readme: readme)
            }
            
            Section {
                HStack {
                    Text("Counter 1")
                    Spacer()
                    CounterView(
                        store: store.scope(
                            state: \.counter1,
                            action: { .counter1($0) }
                        )
                    )
                }
                HStack {
                    Text("Counter 2")
                    Spacer()
                    CounterView(
                        store: store.scope(
                            state: \.counter2,
                            action: { .counter2($0) }
                        )
                    )
                }
            }
        }
        .navigationTitle("Two Counter")
    }
}
