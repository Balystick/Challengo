//
//  RectangleView.swift
//  Challengo
//
//  Created by Audrey on 27/06/2024.
//

import SwiftUI
/**
 La structure RectangleView représente une view en forme de rectangle utilisée dans les fichiers suivants du projet: CarrouselView, AcceptedChallengeView, CongratsView, NatureGrowthView
 */
struct RectangleView: View {
    ///Variable qui représente le numéro du challenge
    var numeroChallenge: Int
    ///Variable qui donne la description courte du challenge
    var shortDescription: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .fill(Color(.colorRose))
                .cornerRadius(2.0)
                .frame(width: 200.0, height: 220.0)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.black, lineWidth: 1))
            VStack {
                Spacer()
                Text("Challenge \(numeroChallenge)")
                    .font(.headline)
                Spacer()
                Text("\(shortDescription)").font(.subheadline)
                    .multilineTextAlignment(.center)
                    .padding()
                Spacer()
                Spacer()
            }
        }
        .frame(width: 200, height: 200)
    }
}

#Preview {
    RectangleView(numeroChallenge: 2, shortDescription: "test")
}
