//
//  Mini_Golf_ScorerApp.swift
//  Mini Golf Scorer
//
//  Created by Colten Glover on 9/3/23.
//

import SwiftUI

@main
struct Mini_Golf_ScorerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
