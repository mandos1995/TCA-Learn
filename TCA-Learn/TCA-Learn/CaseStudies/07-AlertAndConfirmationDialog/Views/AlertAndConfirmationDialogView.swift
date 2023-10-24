//
//  AlertAndConfirmationDialogView.swift
//  TCA-Learn
//
//  Created by 김민석 on 2023/10/12.
//

import SwiftUI

private let readme = """
이 문서는 Composable Architecture에서 알림 및 확인 대화 상자(alerts and confirmation dialogs)를 처리하는 가장 좋은 방법을 설명하고 있습니다.

이 라이브러리는 애플리케이션에서 데이터가 단일 방향으로 흐르도록 요구하기 때문에 SwiftUI의 양방향 바인딩을 활용할 수 없습니다. 양방향 바인딩을 사용하면 리듀서를 거치지 않고 상태를 변경할 수 있기 때문입니다. 이것은 표준 API를 직접 사용하여 알림 및 시트를 표시하는 데 사용할 수 없다는 것을 의미합니다.

그러나 이 라이브러리에는 AlertState 및 ConfirmationDialogState 두 가지 유형이 함께 제공되며, 이 유형들은 리듀서에서 생성되어 알림 또는 확인 대화 상자가 표시되는지 여부를 제어합니다. 더불어, 이러한 유형들은 해당 버튼을 탭할 때 자동으로 작업을 처리하므로 리듀서에서 기능을 올바르게 처리할 수 있습니다. 이를 통해 양방향 바인딩 및 작업 클로저(action closures) 대신 리듀서에서 기능을 올바르게 처리할 수 있습니다.

이것을 하는 이점은 사용자가 애플리케이션의 알림 및 대화 상자와 상호 작용하는 방법에 대한 완전한 테스트 커버리지(test coverage)를 얻을 수 있다는 것입니다. 즉, 이러한 알림 및 대화 상자가 어떻게 작동하는지를 체계적으로 테스트할 수 있으며, 이는 앱의 신뢰성을 높이고 사용자 경험을 향상시키는 데 도움이 됩니다.
"""

struct AlertAndConfirmationDialogView: View {
    var body: some View {
        Form {
            Section {
                AboutView(readme: readme)
            }
            
            Section {
                Text("Count: 1")
                Button("Alert") {
                    
                }
                Button("Comfirmation Dialog") {
                    
                }
            }
        }
        .navigationTitle("Alerts & Dialogs")
    }
}
