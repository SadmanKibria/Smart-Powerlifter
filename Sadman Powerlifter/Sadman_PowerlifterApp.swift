//
//  Sadman_PowerlifterApp.swift
//  Sadman Powerlifter
//
//  Created by Sadman Kibria on 08/04/2024.
//

import SwiftUI
import Firebase

@main
struct Sadman_PowerlifterApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            //LoginView(viewModel: LoginViewModel())
            MenuBarView()
        }
    }
}
