//
//  FlashCardsApp.swift
//  FlashCards
//
//  Created by Richard on 13.09.2023.
//

import SwiftUI
import SwiftData
import TipKit

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
    @AppStorage("firstOpen") private var firstOpen = false

    var body: some Scene {
        WindowGroup {
            ChemistryView()
                .task {
                    try? await Tips.configure()
                    if !firstOpen{
                        let settings = AppSettings().initalizeData()
                        firstOpen = true
                    }
                }
        }
         .modelContainer(sharedModelContainer)
        #if os(visionOS)
        WindowGroup(id: "molecule") {
            MoleculeView()
        }
        .windowStyle(.volumetric)
        .defaultSize(width: 1.0, height: 1.0, depth: 1.0, in: .meters)
        .windowResizability(.automatic)
        #endif
    }
}
