//
//  ContentView.swift
//  Mini Golf Scorer
//
//  Created by Colten Glover on 9/3/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    private var p1Score: Int {
        var runningScore = 0
        for score in p1Scores {
            runningScore += score
        }
        return runningScore
    }
    
    private var p2Score: Int {
        var runningScore = 0
        for score in p2Scores {
            runningScore += score
        }
        return runningScore
    }
    
    @State private var p1Scores = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    @State private var p2Scores = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    @FocusState private var keyboardIsFocused: Bool
    
    var body: some View {
        NavigationView {
            Form {
                ForEach(1..<19) { hole in
                    Section("Hole \(hole)") {
                        TextField("", value: $p1Scores[hole - 1], format: .number)
                            .keyboardType(.numberPad)
                            .focused($keyboardIsFocused)
                        TextField("", value: $p2Scores[hole - 1], format: .number)
                            .keyboardType(.numberPad)
                            .focused($keyboardIsFocused)
                    }
                }
                
                Section("Results") {
                    Text("Player 1: \(p1Score)")
                    Text("Player 2: \(p2Score)")
                }
            }
            .navigationTitle("Mini Golf Scorecard")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Done") {
                        keyboardIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
