//
//  RegistrationView.swift
//  TwitterClone
//
//  Created by Pratha Saxena on 21/01/23.
//

import SwiftUI

struct RegistrationView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var email : String = ""
    @State var username : String = ""
    @State var fullName : String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            AuthBgRect("Get Started.","Create your account")
            VStack(spacing: 40) {
                CustomTextEdit(imageName: "envelope", placeholder: "Email", value: $email)
                CustomTextEdit(imageName: "person", placeholder: "Username", value: $username)
                CustomTextEdit(imageName: "person", placeholder: "Full Name", value: $fullName)
                CustomTextEdit(imageName: "lock", placeholder: "Password", value: $password)
            }
            .padding(.vertical, 40)
            .padding(.horizontal, 20)
    
            // sign up button
            Button {
                
            } label: {
                Text("Sign up")
                    .wideBlueButton()
            }
            .buttonShadow()
            Spacer()
            Button {
                presentationMode.wrappedValue.dismiss()
            } label:  {
                HStack {
                    Text("Already have an account?")
                    Text("Sign in")
                        .fontWeight(.semibold)
                }.font(.footnote)
                    .foregroundColor(Color(.systemBlue))
                    .padding(.bottom,32)
            }
        }.ignoresSafeArea()
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
