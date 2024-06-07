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
                    .frame(height: 400)
                    .offset(x: -70)
                    .rotationEffect(.degrees(-2.61))
                VStack {
                    Image("Onbording 4")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 240)
                        .offset(y: -60)
                    Image("State 4")
                }
            }
            .padding(.top, 30)
            Text("Impact réel")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.bottom, 20)
                .offset(y: -50)
            JustifiedTextView(text: "Vos réalisations virtuelles peuvent avoir un impact réel sur votre  bien-être mental, physique, emotionnel, intellectuel et spirituel")
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
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
