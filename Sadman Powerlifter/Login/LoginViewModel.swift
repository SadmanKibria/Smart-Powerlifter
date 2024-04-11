//
//  LoginViewModel.swift
//  Sadman Powerlifter
//
//  Created by Sadman Kibria on 08/04/2024.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseDatabase

class LoginViewModel: ObservableObject {
    @Published var email: String = "sadman@gmail.com"
    @Published var password: String = "12345678"
    @Published var showAlert = false
    @Published var alertMessage = ""
    @Published var loggedIn = false // Flag to track login status
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                self.alertMessage = error.localizedDescription
                self.showAlert = true
                print("Login error: \(error.localizedDescription)")
            } else {
                print("User logged in successfully.")
                self.loggedIn = true // Update flag to indicate successful login
                // Navigate to the next screen or perform any other action upon successful login
            }
        }
    }
}
