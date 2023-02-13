//
//  AuthViewModel.swift
//  TwitterClone
//
//  Created by Pratha Saxena on 21/01/23.
//

import Foundation
import SwiftUI


class AuthViewModel : ObservableObject {
    var authController : AuthController = AuthController()
    @Published var urlSession : AuthController.FirebaseUser? = AuthController().currentUser
    @Published var didUserAuthenticated = false
 
    
    init() {
        print("DEBUG: urlSession value is \(urlSession?.uid ?? "") ")
    }
    
     var getUrlSession : AuthController.FirebaseUser? {
        urlSession
    }
    
    func login(withEmail email : String, password: String) {
        Task {
            do {
                try await authController.signIn(withEmail: email, password: password)
                self.urlSession = authController.currentUser
            } catch {
                print("Can't sign in ")
            }
        }
    }
    
    func signUp(withEmail email : String, password: String, username: String, fullName: String)  {
        Task {
            do {
                try await authController.signUp(withEmail: email, password: password, username: username, fullName: fullName)
                self.didUserAuthenticated = true
            } catch {
                print("Can't signup ")
            }
        }
    }
    
    func uploadProfileImage(image: UIImage) {
        UploadImageHelper.uploadImage(image: image) { imageUrl in
            Task {
                do {
                    if let userUid = self.authController.tempUser?.uid {
                        try await self.authController.updateProfile(userId: userUid, profileImageUrl: imageUrl)
                        self.urlSession = self.authController.currentUser
                    }
                } catch {
                    print("error in updating profile")
                }
            }
        }
    }
    
    func logout() {
        do {
            try authController.signOut()
            self.urlSession = authController.currentUser
        } catch {
            print("Can't sign out ")
        }
    }

}

enum AuthError : Error {
    case sinupError
    case signoutError
    case signinError
}
