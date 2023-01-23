//
//  AuthViewModel.swift
//  TwitterClone
//
//  Created by Pratha Saxena on 21/01/23.
//

import Foundation
import SwiftUI
import Firebase

class AuthViewModel : ObservableObject {
    @Published var urlSession : Firebase.User?
    
    init() {
        self.urlSession = Auth.auth().currentUser
        print("DEBUG: urlSession value is \(urlSession?.uid) ")
    }
    
    func login(withEmail email : String, password: String) {
        
    }
    
    func signUp(withEmail email : String, password: String, username: String, fullName: String) async throws {
        do {
            var createdUser = try await Auth.auth().sinupUser(withEmail: email, password: password)
            guard let newUser = createdUser?.user else {
                throw AuthError.sinupError
            }
            urlSession = newUser
            let data = ["email" : email, "username": username, "fullName": fullName, "uId": newUser.uid]
            try await Firestore.firestore().saveData(sendData: data, collectionName: "users", docName: newUser.uid)
        } catch {
            print("DEBUG: sign up failed")
        }
    }
}

enum AuthError : Error {
    case sinupError
}
