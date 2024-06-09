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
                    .frame(height: 350)
                    .rotationEffect(.degrees(-177.38))
                    .offset(x: 50)
                    Image("Onbording 3")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 240)
            }
            Image("State 3")
                .offset(y: 0)
                .padding(.bottom, 10)
            Text("Faites croître votre")
                .font(.title2)
                .fontWeight(.semibold)
            Text("forêt virtuelle")
                .font(.title2)
                .fontWeight(.semibold)
            JustifiedTextView(text: "Chaque fois que vous réussirez un challenge, vous planterez un arbre ou un élément de votre forêt virtuelle. Regardez votre forêt prospérer à mesure que vous atteignez vos objectifs.")
            // Visualisez vos progrès : Votre forêt virtuelle est le reflet de votre engagement et de votre croissance.
                .padding()

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

