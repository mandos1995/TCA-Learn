//
//  AboutView.swift
//  TCA-Learn
//
//  Created by 김민석 on 2023/10/06.
//

import SwiftUI

struct AboutView: View {
    let readme: String
    
    var body: some View {
        DisclosureGroup("정보") {
            Text(readme)
        }
    }
}
