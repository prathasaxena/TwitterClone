//
//  AuthViewModel.swift
//  TwitterClone
//
//  Created by Pratha Saxena on 21/01/23.
//

import Foundation
import SwiftUI


class AuthViewModel : ObservableObject {
    @Published var urlSession : AuthController.FirebaseUser?
    var authController : AuthController = AuthController()
    init() {
        self.urlSession = AuthController().currentUser
        print("DEBUG: urlSession value is \(urlSession?.uid) ")
    }
    
    func login(withEmail email : String, password: String) {
        do {
            
        } catch {
            
        }
    }
    
    func signUp(withEmail email : String, password: String, username: String, fullName: String) {
        Task {
            do {
                try await authController.signUp(withEmail: email, password: password, username: username, fullName: fullName)
            } catch {
                print("Can't signup ")
            }
        }
    }
    
    

}

enum AuthError : Error {
    case sinupError
}
