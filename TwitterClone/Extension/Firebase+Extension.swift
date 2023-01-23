//
//  Firebase+Extension.swift
//  TwitterClone
//
//  Created by Pratha Saxena on 23/01/23.
//

import Foundation
import Firebase

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
}

extension Firestore {
    func saveData(sendData data: [String: String],collectionName name : String, docName doc : String ) async throws {
        do {
            return try await withCheckedThrowingContinuation { continuation in
                Firestore.firestore().collection(name).document(doc).setData(data) { error in
                    if let error = error {
                        continuation.resume(throwing: error)
                    }
                }
            }
        } catch {
            
        }
    }
}
