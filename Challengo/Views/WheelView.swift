//
//  WheelView.swift
//  Challengo
//
//  Created by Aurélien 143 on 04/06/2024.
//

import SwiftUI

struct WheelView: View {
    @State private var rotationAngle: Double = 0
    @State private var isAnimating = false
    @State private var SelectedSection: Int?
    let sections = 8 // Nombre de sections de la roue
    let rotationDuration: Double = 4.0 // Durée de l'animation en secondes
    var result: [String] = ["Courage existentiel", "Ouverture à l”expérience et au changement", "Compassion pour soi", "Joker", "Autonomie", "Conscience de soi", "Compassion pour les autres", "Responsabilité de soi"]
    
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
                    .animation(isAnimating ? .easeOut(duration: rotationDuration) : .none, value: rotationAngle)
                    .offset(x: 0, y: -135)
                
                Button(action: spinWheel) {
                    Text("Tourner la roue")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                
            }
            Image("pointeur")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .offset(x: -115, y: -330)
           
            // Affichage du résultat (temporaire)
            if let SelectedSection = SelectedSection {
                Text(result[SelectedSection])
                    .padding()
                    .offset(x: 0, y: 300)
            }
        }
    }

    func spinWheel() {
        let fullRotation = 360.0
        // Définit un nombre de tours aléatoire (3 ou 4)
        let randomRotation = Double.random(in: 3...4) * fullRotation
        
        // Ajoute une rotation supplémentaire aléatoire
        let additionalRotation = Double.random(in: 0..<Double(sections)) * (fullRotation / Double(sections))
        let totalRotation = randomRotation + additionalRotation

        // Démarre l'animation de la roue
        withAnimation {
            rotationAngle += totalRotation
            isAnimating = true
        }
        
        // Détermine la section sélectionnée après l'animation
        DispatchQueue.main.asyncAfter(deadline: .now() + rotationDuration) {
            isAnimating = false
            self.calculateSelectedSection(totalRotation: totalRotation)
        }
    }
    
    func calculateSelectedSection(totalRotation: Double) {
        // Normalise la rotation entre 0 et 360
        let fullRotation = 360.0
        let normalizedRotation = totalRotation.truncatingRemainder(dividingBy: fullRotation)
        
        // Calcul de l'angle par section
        let angleSection = fullRotation / Double(sections)
        
        // Détermine la section sélectionnée
        var SelectedSection = Int(normalizedRotation / angleSection)
        SelectedSection = (sections - 1) - SelectedSection // fait correspondre la section sélectionnée avec l'indice de la catégorie
        
        // Mettre à jour l'état avec la section gagnante
        self.SelectedSection = SelectedSection
    }
}

struct WheelView_Previews: PreviewProvider {
    static var previews: some View {
        WheelView()
    }
}
