//
//  FlashCardsApp.swift
//  FlashCards
//
//  Created by Richard on 13.09.2023.
//

import SwiftUI
import SwiftData

// data https://github.com/Bowserinator/Periodic-Table-JSON/blob/master/PeriodicTableJSON.json

@main
struct FlashCardsApp: App {
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            ElementsData.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
           // ContentView()
            ChemistryView()
              
        }
        .modelContainer(sharedModelContainer)
    }
}
