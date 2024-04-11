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
            self.email = "No Email"
            self.name = "No Name"
            return
        }
        self.email = currentUser.email ?? "No Email"
        
        let userId = currentUser.uid
        let ref = Database.database().reference().child("users").child(userId)
        
        ref.observeSingleEvent(of: .value) { snapshot in
            if let userData = snapshot.value as? [String: Any] {
                self.email = userData["email"] as? String ?? "No email"
                self.name = userData["name"] as? String ?? "No name"
            }
        }
    }
    
    func logout(completion: @escaping (Bool) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(true)
        } catch let error {
            print("Error signing out: \(error.localizedDescription)")
            completion(false)
        }
    }
}
