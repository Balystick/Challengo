//
//  WheelView.swift
//  Challengo
//
//  Created by Aurélien 143 on 04/06/2024.
//

import SwiftUI

struct WheelView: View {
    let sections = 8 // Nombre de sections de la roue
    let rotationDuration: Double = 4.0 // Durée de l'animation en secondes
    @State private var rotationAngle: Double = 0 // Angle de rotation de la roue
    @State private var selectedCategory: Int? // Catégorie de challenges sélectionnée
    @State private var showCarrouselView = false
    @State private var challengeAccepted = false
    @State private var challengeNumber = -1
    
    var body: some View {
        ZStack {
            Image("Valley")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack {
                Image("roue")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 350)
                    .rotationEffect(.degrees(rotationAngle))
                    .animation(.easeOut(duration: rotationDuration), value: rotationAngle)
                    .offset(x: 0, y: -135)
                
                Button(action: spinWheelAndSelectCategory) {
                    Text("Lancer !")
                        .font(.callout)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .foregroundColor(.black)
                        .background(Color(.colorGrey))              .foregroundColor(.white)
                        .cornerRadius(30)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.red, lineWidth: 1)
                        )
                }
                .padding()
            }
            Image("pointeur")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .offset(x: -120, y: -320)
        }
        .sheet(isPresented: $showCarrouselView) {
            CarrouselView(challengeAccepted: $challengeAccepted, selectedCategory: selectedCategory, challengeNumber: $challengeNumber)
                .onDisappear {
                    if challengeAccepted {
                        showCarrouselView = false
                    } 
                    else {
                        rotationAngle = 0
                    }
                }
        }
        .onChange(of: selectedCategory) {
            // Délai avant l'affichage de la modale
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                showCarrouselView = true
            }
        }
        .navigationDestination(isPresented: $challengeAccepted) {
            NatureGrowthView(selectedCategory: selectedCategory, challengeNumber: $challengeNumber)
                .navigationBarBackButtonHidden(true)
        }
    }
    
    func spinWheelAndSelectCategory() {
        // définit une rotation aléatoire entre 2 et 4 tous (en degrés)
        let rotation = Double.random(in: 2...4) * 360.0
        // Met à jour rotationAngle
        rotationAngle = rotation
        
        // Détermine la section sur laquelle se trouve le pointeur après rotation
        DispatchQueue.main.asyncAfter(deadline: .now() + rotationDuration) {
            let anglePerSection = 360.0 / Double(sections)
            let calculatedSection = Int(rotation.truncatingRemainder(dividingBy: 360.0) / anglePerSection) + 1
            // Détermine l'index de la catégorie
            selectedCategory = sections - calculatedSection
        }
    }
}

struct WheelView_Previews: PreviewProvider {
    static var previews: some View {
        WheelView()
    }
}
