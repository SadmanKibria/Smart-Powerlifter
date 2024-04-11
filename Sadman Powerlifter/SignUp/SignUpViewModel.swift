//
//  SignUpViewModel.swift
//  Sadman Powerlifter
//
//  Created by Sadman Kibria on 08/04/2024.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseDatabase

class SignUpViewModel: ObservableObject {
    @Published var name: String = "Sadman"
    @Published var email: String = "sadman@gmail.com"
    @Published var password: String = "12345678"
    @Published var confirmPassword: String = "12345678"
    
    func signUp() {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("Error signing up: \(error.localizedDescription)")
            } else {
                // Save additional user information (name) to Firebase database
                let userData: [String: Any] = ["name": self.name,"email": self.email]
                self.saveUserData(uid: authResult?.user.uid ?? "", userData: userData)
                print("User signed up successfully.")
            }
        }
    }
    
    func saveUserData(uid: String, userData: [String: Any]) {
        let usersRef = Database.database().reference().child("users").child(uid)
        
        usersRef.setValue(userData) { error, _ in
            if let error = error {
                print("Error saving user data: \(error.localizedDescription)")
            } else {
                print("User data saved successfully.")
            }
        }
    }
}
