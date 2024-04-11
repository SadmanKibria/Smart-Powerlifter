//
//  WorkoutView.swift
//  Sadman Powerlifter
//
//  Created by Sadman Kibria on 08/04/2024.
//

import SwiftUI

struct WorkoutView: View {
    // Mock data for demonstration
    let workouts = ["Workout 1", "Workout 2", "Workout 3"]
    
    var body: some View {
        NavigationView {
            List(workouts, id: \.self) { workout in
                Text(workout)
            }
            .navigationBarTitle("Workouts", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                // Action to start a new workout
                print("Start new workout")
            }) {
                Text("Start")
            })
        }
    }
}

#Preview {
    WorkoutView()
}
