//
//  TwitterCloneApp.swift
//  TwitterClone
//
//  Created by Pratha Saxena on 09/01/23.
//

import SwiftUI
import Firebase

@main
struct TwitterCloneApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }
    }
}
