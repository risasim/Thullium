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

    var body: some Scene {
        WindowGroup {
            ChemistryView()
                .task {
                    try? await Tips.configure()
                }
        }
         .modelContainer(sharedModelContainer)
        #if os(visionOS)
        WindowGroup(id: "molecule", for: String.self) { $link in
            if let usdz = link{
                MoleculeView(usdzLink: usdz)
            }
        }
        .windowStyle(.volumetric)
        .defaultSize(width: 0.3, height: 0.3, depth: 0.3, in: .meters)
        .windowResizability(.contentSize)
        #endif
    }
}
