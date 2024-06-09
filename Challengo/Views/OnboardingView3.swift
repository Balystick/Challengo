//
//  OnboardingView3.swift
//  Challengo
//
//  Created by Haiying on 06/06/2024.
//

import SwiftUI

struct OnboardingView3: View {
    @State private var navigateToStartView = false
    @State private var navigateToOnboardingView4 = false
    
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
                    .rotationEffect(.degrees(-177.38))
                    .offset(x: 50)
                VStack {
                    Image("Onbording 3")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 240)
                        .offset(y: -30)
                    Image("State 3")
                        .padding(.top, 15)
                }
            }
            Text("Faites croître votre")
                .font(.title2)
                .fontWeight(.semibold)
                .offset(y: -45)
            Text("forêt virtuelle")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.bottom, 10)
                .offset(y: -40)
            JustifiedTextView(text: "Chaque fois que vous réussirez un challenge, vous planterez un arbre ou un élément de votre forêt virtuelle. Regardez votre forêt prospérer à mesure que vous atteignez vos objectifs.")
                .frame(height: 120)
                .padding(.horizontal, 30)
                .offset(y: -20)
            JustifiedTextView(text: "Visualisez vos progrès : Votre forêt virtuelle est le reflet de votre engagement et de votre croissance.")
                .frame(height: 70)
                .padding(.horizontal, 30)
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
                    navigateToOnboardingView4 = true
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
        .navigationDestination(isPresented: $navigateToOnboardingView4) {
            OnboardingView4()
        }
        .navigationBarHidden(true)
    }
}


#Preview {
    OnboardingView3()
}

