//
//  Logjn.swift
//  TwitterClone
//
//  Created by Pratha Saxena on 16/01/23.
//

import SwiftUI

struct Login: View {
    @State var email = ""
    @State var password = ""
    var body: some View {
        VStack {
            AuthBgRect("Hello.","Welcome Back")
            // text fields
            VStack(spacing: 40) {
                CustomTextEdit(imageName: "envelope", placeholder: "Email", value: $email)
                CustomTextEdit(imageName: "lock", placeholder: "Password", value: $password)
            }
            .padding(.top, 40)
            .padding(.horizontal, 20)
            // forgot password
            HStack {
                Spacer()
                NavigationLink(destination: RegistrationView()) {
                    Text("Forgot Password?")
                        .authRightLink()
                }
            }.padding()
            // sign up button
            Button {
                
            } label: {
                Text("Sign in")
                    .wideBlueButton()
            }
            .buttonShadow()
            Spacer()
            NavigationLink(destination: RegistrationView()) {
                HStack {
                    Text("Don't have an account?")
                    Text("Sign up")
                        .fontWeight(.semibold)
                }.font(.footnote)
                    .foregroundColor(Color(.systemBlue))
                    .padding(.bottom,32)
            }
        } .ignoresSafeArea()
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
