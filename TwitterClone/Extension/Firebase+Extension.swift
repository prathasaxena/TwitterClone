//
//  Firebase+Extension.swift
//  TwitterClone
//
//  Created by Pratha Saxena on 23/01/23.
//

import Foundation
import Firebase

class AuthController {
//    init() {
//    }
    typealias FirebaseUser = Firebase.User
    var currentUser : FirebaseUser? = Auth.auth().currentUser
    
    
    func signUp(withEmail email : String, password: String, username: String, fullName: String) async throws {
        do {
            var createdUser = try await Auth.auth().sinupUser(withEmail: email, password: password)
            guard let newUser = createdUser?.user else {
                throw AuthError.sinupError
            }
            currentUser = newUser
            let data = ["email" : email, "username": username, "fullName": fullName, "uId": newUser.uid]
            try await Firestore.firestore().saveData(sendData: data, collectionName: "users", docName: newUser.uid)
        } catch {
            print("DEBUG: sign up failed")
        }
    }
}

extension Auth {
     func sinupUser(withEmail email: String, password: String) async throws -> AuthDataResult? {
        do {
            return try await withCheckedThrowingContinuation { continuation in
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    if let error = error {
                        continuation.resume(throwing: error)
                    }
                    continuation.resume(returning: result)
                }
            }
        } catch {
            return nil
        }
    }
    
//    func loginUser
}

extension Firestore {
    func saveData(sendData data: [String: String],collectionName name : String, docName doc : String ) async throws {
        do {
               try await Firestore.firestore().collection(name).document(doc).setData(data) { error in
                    if let error = error {
                       print("DEBUG: Saving collection error")
                    }
                }
        } catch {
            
        }
    }
}
