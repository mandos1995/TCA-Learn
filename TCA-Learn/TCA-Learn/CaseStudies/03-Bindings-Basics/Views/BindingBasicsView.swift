//
//  BindingBasicsView.swift
//  TCA-Learn
//
//  Created by 김민석 on 2023/10/10.
//

import SwiftUI

struct BindingBasicsView: View {
    
    @State var textViewText: String = ""
    @State var isToggleOn: Bool = false
    @State var stepperValue: Int = 10
    @State var sliderValue: Float = 10
    
    var body: some View {
        Form {
            Section {
                AboutView(readme: "ss")
            }
            Section {
                TextField("Type here", text: $textViewText)
                Toggle("Disable other controls", isOn: $isToggleOn)
                Stepper("Max slider value: \(stepperValue)", value: $stepperValue)
                HStack {
                    Text("Slider value: \(Int(sliderValue))")
                    Slider(value: $sliderValue, in: 1...100)
                }
                
            }
        }
        .navigationTitle("Binding Basics")
    }
}
