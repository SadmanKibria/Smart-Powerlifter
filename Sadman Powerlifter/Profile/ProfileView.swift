//
//  ProfileView.swift
//  Sadman Powerlifter
//
//  Created by Sadman Kibria on 08/04/2024.
//

import SwiftUI

struct ProfileView: View {
    @StateObject private var viewModel = ProfileViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Profile")) {
                    Text(viewModel.email)
                    Text(viewModel.name)
                }
                
                Button(action: {
                    viewModel.logout()
                }) {
                    Text("Log Out")
                        .foregroundColor(.red)
                }
            }
            .onAppear {
                viewModel.fetchData()
            }
            .navigationTitle("Profile")
        }
    }
    
    struct ProfileView_Previews: PreviewProvider {
        static var previews: some View {
            ProfileView()
        }
    }
}
