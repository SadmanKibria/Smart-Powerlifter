//
//  TabView.swift
//  Sadman Powerlifter
//
//  Created by Sadman Kibria on 08/04/2024.
//

import SwiftUI

struct MenuBarView: View {
    var body: some View {
        TabView {
            WorkoutView()
                .tabItem {
                    Image(systemName: "list.bullet.rectangle")
                    Text("Workout")
                }
            
            OneRMView()
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("1RM")
                }
            
            TrackingView()
                .tabItem {
                    Image(systemName: "waveform.path.ecg")
                    Text("Tracking")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
        }
    }
}

struct MenuBarView_Previews: PreviewProvider {
    static var previews: some View {
        MenuBarView()
    }
}
