//
//  ContentView.swift
//  Challengo
//
//  Created by Aurélien on 03/06/2024
//

import SwiftUI

/**
La vue `ContentView` est la vue principale de l'application.
Elle gère la navigation entre la vue d'accueil `OnboardingView` et la vue de démarrage `StartView`.
Elle vérifie si l'utilisateur est un nouvel utilisateur et affiche la vue d'accueil ou la vue de démarrage en conséquence.
Elle Utilise `UserDefaults` pour stocker une valeur indiquant si l'utilisateur a déjà vu la vue d'accueil.
Lors de la première apparition de `OnboardingView`, la valeur `isFirstTimeUser` est mise à jour dans `UserDefaults`.
*/
struct ContentView: View {
    /// Etat qui détermine si l'utilisateur est un nouvel utilisateur. Défini par défaut à `true`
    @State private var isFirstTimeUser: Bool = true
    
    var body: some View {
        NavigationStack {
            if isFirstTimeUser {
                OnboardingView()
                    .onAppear {
                        UserDefaults.standard.set(true, forKey: "isFirstTimeUser")
                    }
            } else {
                StartView()
            }
        }
    }
}

#Preview {
    ContentView()
}
