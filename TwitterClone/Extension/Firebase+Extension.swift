//
//  Firebase+Extension.swift
//  TwitterClone
//
//  Created by Pratha Saxena on 23/01/23.
//

import Foundation
import Firebase
import FirebaseStorage


class AuthController {
    typealias FirebaseUser = Firebase.User
    var currentUser : FirebaseUser? = Auth.auth().currentUser
    var tempUser : FirebaseUser? = Auth.auth().currentUser
    static let COLLECTION_NAME = "users"
    func signIn(withEmail email : String, password: String) async throws {
        do {
            let signedInUser = try await Auth.auth().loginUser(withEmail: email, password: password)
            guard let newUser = signedInUser?.user else {
                throw AuthError.signinError
            }
            currentUser = newUser
        } catch {
            print("DEBUG: sign ip failed")
        }
    }
    
    func signUp(withEmail email : String, password: String, username: String, fullName: String) async throws {
        do {
            let createdUser = try await Auth.auth().sinupUser(withEmail: email, password: password)
            guard let newUser = createdUser?.user else {
                throw AuthError.sinupError
            }
            tempUser = newUser
            let data = ["email" : email, "username": username.lowercased(), "fullName": fullName, "uId": newUser.uid]
            try await Firestore.firestore().saveData(sendData: data, collectionName: AuthController.COLLECTION_NAME, docName: newUser.uid)
        } catch {
            print("DEBUG: sign up failed")
        }
    }
    
    func updateProfile(userId : String, profileImageUrl : String) async throws {
        try await Firestore.firestore().updateData(cn: AuthController.COLLECTION_NAME, uid: userId, data: ["profileImageUrl": profileImageUrl])
        currentUser = tempUser
    }
    
    func signOut() throws {
        do {
            currentUser = nil
            tempUser = nil
            try Auth.auth().signOut()
        } catch {
            throw AuthError.signoutError
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
                        return
                    }
                    continuation.resume(returning: result)
                    
                }
            }
        } catch {
            return nil
        }
    }
    
    //    func loginUser
    func loginUser(withEmail email: String, password: String) async throws -> AuthDataResult? {
       do {
           return try await withCheckedThrowingContinuation { continuation in
               Auth.auth().signIn(withEmail: email, password: password) { result, error in
                   if let error = error {
                       continuation.resume(throwing: error)
                       return
                   }
                   continuation.resume(returning: result)
               }
           }
       } catch {
           return nil
       }
   }
}

extension  Firestore {
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
    
    func updateData(cn collectionName : String, uid uid: String, data updatedObj: [String : String]) async throws {
        try await Firestore.firestore().collection(collectionName).document(uid).updateData(updatedObj)
    }
}
