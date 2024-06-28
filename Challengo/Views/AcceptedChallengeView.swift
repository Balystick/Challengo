//
//  AcceptedChallengeView.swift
//  Challengo
//
//  Created by Audrey on 04/06/2024.
//

import SwiftUI
/**
 La Structure AcceptedChallengeView est une view qui affiche les détails du challenge accepté
 */
struct AcceptedChallengeView: View {
    ///Le numéro du challenge accepté
    @Binding var challengeNumber: Int
    /// Instantiation d'un objet de la Class Challenge
    let challenge = Challenge()

    var body: some View {
            ZStack {
                Image("ValleySun")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                    VStack {
                        RectangleView(numeroChallenge: challengeNumber, shortDescription: "Prendre une douche froide")
                            .offset(y: -200)
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Text("Accompli")
                                    .font(.footnote)
                                    .padding(7)
                            })
                            .foregroundColor(.black)
                            .background(Color(red: 0.77, green: 0.76, blue: 0.761))
                            .cornerRadius(20)    
                            .offset(y: -250)
                    }
            }
            .navigationBarBackButtonHidden(true)
        }
    }

// Ajustement Preview
struct AcceptedChallengeView_Previews: PreviewProvider {
    @State static var challengeNumber = 3
    static var previews: some View {
        AcceptedChallengeView(challengeNumber: $challengeNumber)
    }
}
