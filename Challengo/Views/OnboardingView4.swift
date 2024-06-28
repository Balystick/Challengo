//
//  OnboardingView4.swift
//  Challengo
//
//  Created by Haiying on 06/06/2024.
//

import SwiftUI

struct OnboardingView4: View {
    @State private var navigateToStartView = false
    @State private var navigateToOnboardingView5 = false
    
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
                    .offset(x: -70)
                    .rotationEffect(.degrees(-2.61))
                    Image("Onbording 4")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 240)
                        .offset(y: -60)
            }
            .padding(.top, 30)
            Image("State 4")
                .offset(y: 0)
                .padding(.bottom, 10)
            Text("Impact réel")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.bottom, 20)
            JustifiedTextView(text: "L'accomplissement de challenges de croissance personnelle et votre forêt virtuelle peuvent avoir un réel impact sur votre bien-être physique, émotionnel, mental et spirituel.")
                .multilineTextAlignment(.center)
                .padding()
                .offset(y: -5)
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
                    navigateToOnboardingView5 = true
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
        .navigationDestination(isPresented: $navigateToOnboardingView5) {
            OnboardingView5()
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    OnboardingView4()
}
