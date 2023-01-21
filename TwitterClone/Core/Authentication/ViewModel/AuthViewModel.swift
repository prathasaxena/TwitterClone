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
    }
}
