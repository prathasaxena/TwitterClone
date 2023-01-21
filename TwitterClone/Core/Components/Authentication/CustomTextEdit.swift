//
//  CustomTextEdit.swift
//  TwitterClone
//
//  Created by Pratha Saxena on 21/01/23.
//

import SwiftUI

struct CustomTextEdit: View {
    var imageName : String
    var placeholder: String
    @Binding var value : String
    
    init(imageName: String, placeholder : String, value: Binding<String>){
        self.imageName = imageName
        self.placeholder = placeholder
        self._value = value
    }
    var body: some View {
        VStack {
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Color(.darkGray))
                    .frame(width: 20, height: 20)
                TextField(placeholder, text: $value)
            }
            Divider().background(Color(.darkGray))
        }
    }
}

struct CustomTextEdit_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextEdit(imageName: "person", placeholder: "email", value: .constant(""))
    }
}
