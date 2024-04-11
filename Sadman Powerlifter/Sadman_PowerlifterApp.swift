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
    @StateObject var sessionManager = SessionManager()
    @StateObject var workoutViewModel = WorkoutViewModel() // Create a WorkoutViewModel instance
    @StateObject var loginViewModel = LoginViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            if sessionManager.isLoggedIn {
                WorkoutView(viewModel: workoutViewModel)
                    .environmentObject(sessionManager)
            } else {
                LoginView(viewModel: loginViewModel)
                    .environmentObject(sessionManager)
            }
        }
    }
}
