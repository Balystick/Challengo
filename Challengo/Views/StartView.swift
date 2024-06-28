//
//  StartView.swift
//  Challengo
//
//  Created by Haiying on 06/06/2024.
//

import SwiftUI

/**
`StartView` est la vue de démarrage de l'application qui offre plusieurs options de navigation et des interactions basées sur des gestes.
Elle permet à l'utilisateur de naviguer vers différentes vues de l'application, comme la vue d'accueil, la vue du calendrier, la vue de la roue des défis et la vue de croissance de la nature.
Elle utilise des gestes de glissement pour naviguer entre les vues.
Elle contient des boutons pour accéder aux informations de l'application et au calendrier.
*/
struct StartView: View {
    /// Etat qui détermine si la navigation vers `TrackingView` doit se produire.
    @State private var navigateToCalendarView = false
    /// Etat qui détermine si la navigation vers `OnboardingView` doit se produire.
    @State private var navigateToOnboardingView = false
    /// Etat qui détermine si la navigation vers `WheelView` doit se produire.
    @State private var navigateToWheelView = false
    /// Etat qui détermine si la navigation vers `NatureGrowthView` doit se produire.
    @State private var navigateToNatureGrowthView = false
    /// Variable d'état pour la catégorie sélectionnée.
    @State private var selectedCategory = -1
    /// Variable d'état pour le nombre de défis.
    @State private var challengeNumber = 3
    
    var body: some View {
        ZStack {
            Image("Valley")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .gesture(
                    DragGesture()
                        .onEnded { value in
                            if value.translation.width < -50 {
                                navigateToWheelView = true
                            }
                            if value.translation.width > 50 {
                                navigateToNatureGrowthView = true
                            }
                        }
                )
            VStack {
                HStack(spacing: 300){
                    Button(action: {
                        navigateToOnboardingView = true
                    }, label: {
                        Image(systemName: "info.square")
                            .foregroundColor(Color.black)
                    })
                    Button(action: {
                        navigateToCalendarView = true
                    }, label: {
                        Image(systemName: "calendar")
                            .foregroundColor(Color.black)
                    })
                }
                Spacer()
                Text("Envie de")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.bottom, 1)
                Text(" Challenge ?")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding(.bottom, 90)
                Text("Relève des défis amusants pour enrichir ta croissance personnelle")
                    .font(.body)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .frame(width: 250)
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            }
            Image("arrow")
                .resizable()
                .frame(width: 80, height: 80)
                .offset(CGSize(width: 150.0, height: -46.0))
            HStack {
                Image("arrow")
                    .resizable()
                    .frame(width: 75, height: 75)
                    .scaleEffect(x: -1, y: 1)
                Text("Découvre ta forêt virtuelle")
                    .font(.body)
                    .fontWeight(.semibold)
                Spacer()
            }
            .offset(x: 20, y: 230)
        }
        .navigationBarHidden(true)
        .navigationDestination(isPresented: $navigateToOnboardingView) {
            OnboardingView()
                .navigationBarBackButtonHidden(true)
        }
        .navigationDestination(isPresented: $navigateToCalendarView) {
            TrackingView()
                .navigationBarBackButtonHidden(true)
        }
        .navigationDestination(isPresented: $navigateToWheelView) {
            WheelView(navigateToWheelView: $navigateToWheelView)
                .navigationBarBackButtonHidden(true)

        }
        .navigationDestination(isPresented: $navigateToNatureGrowthView) {
            NatureGrowthView(selectedCategory: -1, challengeNumber: $challengeNumber)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    StartView()
}
