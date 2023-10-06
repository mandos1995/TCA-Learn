//
//  CounterView.swift
//  TCA-Learn
//
//  Created by 김민석 on 2023/10/06.
//

import SwiftUI

import ComposableArchitecture

let readme: String =
    """
    Composable Architecture"를 사용하여 구성된 카운터 애플리케이션의 기본 동작을 보여줍니다.
    애플리케이션의 도메인, 즉 애플리케이션의 상태와 상태나 외부 환경에 영향을 미치는 액션을 나타내기 위해 간단한 데이터 유형을 사용합니다.
    """

struct CounterView: View {
    let store: StoreOf<CounterFeature>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            Form {
                Section {
                    AboutView(readme: readme)
                }
                Section {
                    HStack {
                        Button {
                            viewStore.send(.decrementButtonTapped)
                        } label: {
                            Image(systemName: "minus")
                        }
                        
                        Text("\(viewStore.count)")
                            .monospacedDigit()
                        
                        Button {
                            viewStore.send(.incrementButtonTapped)
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .buttonStyle(.borderless)
            .navigationTitle("Counter")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}
