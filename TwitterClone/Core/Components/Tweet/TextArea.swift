//
//  TextArea.swift
//  TwitterClone
//
//  Created by Pratha Saxena on 21/01/23.
//

import SwiftUI

struct TextArea: View {
    @Binding var text : String
    let placeholder : String
    
    init(placeholder: String, text: Binding<String>) {
        self._text = text
        self.placeholder = placeholder
        UIInputView.appearance().backgroundColor = .clear
    }
    var body: some View {
        ZStack {
            if(text.isEmpty){
                Text(placeholder)
                    .foregroundColor(Color(.placeholderText))
                    .padding(.vertical,12)
                    .padding(.horizontal,8)
            }
            TextEditor(text: $text)
                .padding(4)
        }
        .font(.body)
    }
}


