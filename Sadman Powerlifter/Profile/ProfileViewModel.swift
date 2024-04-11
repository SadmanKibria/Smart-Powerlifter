//
//  ProfileViewModel.swift
//  Sadman Powerlifter
//
//  Created by Sadman Kibria on 08/04/2024.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

class ProfileViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var name: String = ""
    
    func fetchData() {
        guard let currentUser = Auth.auth().currentUser else {
            print("User not logged in")
            return
        }
        
        let userId = currentUser.uid
        let ref = Database.database().reference().child("users").child(userId)
        
        ref.observeSingleEvent(of: .value) { snapshot in
            if let userData = snapshot.value as? [String: Any] {
                if let userEmail = userData["email"] as? String {
                    self.email = userEmail
                }
                if let userName = userData["name"] as? String {
                    self.name = userName
                }
            }
        }
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
            // Navigate to another view after logout if needed
        } catch let error {
            print("Error signing out: \(error.localizedDescription)")
        }
    }
}
