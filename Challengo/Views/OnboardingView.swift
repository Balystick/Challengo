//
//  OnboardingView.swift
//  Challengo
//
//  Created by Apprenant 166 on 26/06/2024.
//

import SwiftUI

/**
La vue `OnboardingView` représentant l'écran d'accueil pour l'application ChallenGo.
Cette vue guide les utilisateurs à travers plusieurs étapes d'accueil pour les introduire à l'application.

- Remarques:
Utilise des images et des textes définis dans `onboardingData` pour afficher les étapes d'accueil.
Permet de naviguer vers la vue de démarrage `StartView` soit en appuyant sur le bouton `Skip`, soit en terminant toutes les étapes d'accueil.
*/
struct OnboardingView: View {
    /// Etat indiquant si la navigation vers la vue de démarrage doit se produire.
    @State private var navigateToStartView = false
    /// Index actuel de l'étape d'accueil affichée.
    @State private var currentOnboarding = 0
    
    var body: some View {
        VStack {
            Text("ChallenGo")
                .font(.title3)
                .fontWeight(.semibold)
            ZStack{
                Image("Onbording background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: onboardingData[currentOnboarding].imageBelow.height)
                    .offset(x: onboardingData[currentOnboarding].imageBelow.offsetX, y: onboardingData[currentOnboarding].imageBelow.offsetY)
                    .rotationEffect(.degrees(onboardingData[currentOnboarding].imageBelow.degree))
                Image(onboardingData[currentOnboarding].imageTop.name)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: onboardingData[currentOnboarding].imageTop.height)
                    .offset(y: onboardingData[currentOnboarding].imageTop.offsetY)
            }
            .padding(.top, 50)
            Image(onboardingData[currentOnboarding].imageState)
                .offset(y: -50)
            Text(onboardingData[currentOnboarding].headline)
                .font(.title2)
                .fontWeight(.semibold)
                .offset(y: -40)
            JustifiedTextView(text: onboardingData[currentOnboarding].description)
                .padding(.horizontal)
                .offset(y: -20)
            HStack(spacing: 200) {
                Button(action: {
                    navigateToStartView = true
                }, label: {
                    Text("Skip")
                        .fontWeight(.semibold)
                        .foregroundColor(.colorRose)
                })
                Button(action: {
                    if currentOnboarding < onboardingData.count - 1 {
                        currentOnboarding += 1
                    } else {
                        navigateToStartView = true
                    }
                }, label: {
                    Text("Next")
                        .padding(.horizontal, 25)
                        .padding(.vertical, 10)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .background(Color(.colorRose))
                        .cornerRadius(10)
                })
            }
        }
        .navigationDestination(isPresented: $navigateToStartView) {
            StartView()
            .navigationBarBackButtonHidden(true)
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    OnboardingView()
}
