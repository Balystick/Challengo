//
//  OnbordingView5.swift
//  Challengo
//
//  Created by Haiying on 06/06/2024.
//

import SwiftUI

struct OnboardingView5: View {
    @State private var navigateToStartView = false
    
    var body: some View {
        VStack {
                Text("ChallenGo")
                    .font(.title3)
                    .fontWeight(.semibold)
                ZStack {
                    Image("Onbording background")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 400)
                        .offset(x: -80)
                        .rotationEffect(.degrees(-177.38))
                    VStack {
                        Image("Onbording 5")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 280)
                            .offset(y: -10)
                        Image("State 5")
                    }
                }
                Text("Prêt(e) à grandir?")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.bottom, 20)
                    .offset(y: -30)
                JustifiedTextView(text: "Votre voyage vers un meilleur vous commence maintenant. Relevez le défi, grandissez chaque jour et regardez votre forêt et vous même prospérer. Commencez maintenant!")
                    .padding(.horizontal, 30)
                Spacer()
                HStack(spacing: 200) {
                    Button(action: {
                        navigateToStartView = true
                    }, label: {
                        Text("Skip")
                            .fontWeight(.semibold)
                            .foregroundColor(.colorRose)
                    })
                    Button(action: {
                        navigateToStartView = true
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
    OnboardingView5()
}
