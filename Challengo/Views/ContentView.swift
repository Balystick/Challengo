//
//  ContentView.swift
//  Challengo
//
//  Created by Aurélien on 03/06/2024
//

import SwiftUI
import SwiftData

// Extension UserDefaults pour gérer le flag de premier lancement
extension UserDefaults {
    private enum Keys {
        static let hasLaunchedBefore = "hasLaunchedBefore"
    }

    var hasLaunchedBefore: Bool {
        get {
            return bool(forKey: Keys.hasLaunchedBefore)
        }
        set {
            set(newValue, forKey: Keys.hasLaunchedBefore)
        }
    }
}

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    // State pour vérifier si c'est le premier lancement
    @State private var isFirstLaunch: Bool = !UserDefaults.standard.hasLaunchedBefore

    var body: some View {
        if isFirstLaunch {
            OnboardingView1()
                .onAppear {
                    // Marquer que l'app a été lancée
                    UserDefaults.standard.hasLaunchedBefore = true
                }
        } else {
            StartView()
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
