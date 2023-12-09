//
//  PearlV1App.swift
//  PearlV1
//
//  Created by ElAmir Mansour on 08/12/2023.
//

import SwiftUI
import SwiftData

@main
struct PearlV1App: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
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
            InitialView()
        }
        .modelContainer(sharedModelContainer)
    }
}
