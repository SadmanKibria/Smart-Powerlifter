//
//  ProfileView.swift
//  Sadman Powerlifter
//
//  Created by Sadman Kibria on 08/04/2024.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var sessionManager: SessionManager
    @StateObject private var viewModel = ProfileViewModel()
    
    var body: some View {
        Form {
            Section(header: Text("Profile")) {
                Text("Email: \(viewModel.email)")
                Text("Name: \(viewModel.name)")
            }
            
            Button("Log Out") {
                viewModel.logout { success in
                    if success {
                        sessionManager.logout() // This should change the app's state to show LoginView
                    }
                }
            }
            .foregroundColor(.red)
        }
        .onAppear {
            viewModel.fetchData()
        }
        .navigationTitle("Profile")
        // Removed NavigationView wrapper to ensure it works within TabView
    }
}

#Preview {
    ProfileView()
}


