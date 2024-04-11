//
//  SessionManager.swift
//  Sadman Powerlifter
//
//  Created by Sadman Kibria on 11/04/2024.
//

import Combine
import FirebaseAuth

class SessionManager: ObservableObject {
    @Published var isLoggedIn: Bool = false
    
    init() {
        self.isLoggedIn = Auth.auth().currentUser != nil
        Auth.auth().addStateDidChangeListener { [weak self] (_, user) in
            self?.isLoggedIn = user != nil
        }
    }
    
    func login(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (result, error) in
            guard result != nil, error == nil else {
                // Handle errors here, such as displaying an alert
                return
            }
            // Successfully logged in
            self?.isLoggedIn = true
        }
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
            self.isLoggedIn = false
        } catch {
            // Handle errors here
        }
    }
}
