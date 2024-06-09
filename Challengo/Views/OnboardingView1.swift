//
//  OnboardingView1.swift
//  Challengo
//
//  Created by Haiying on 06/06/2024.
//

import SwiftUI

struct OnboardingView1: View {
    @State private var navigateToStartView = false
    @State private var navigateToOnboardingView2 = false

    var body: some View {
        VStack {
            Text("ChallenGo")
                .font(.title3)
                .fontWeight(.semibold)
            ZStack {
                Image("Onbording background")
                    .offset(x: -105)
                    .frame(height: 250)
                Image("Logo")
                    .offset(y: -30)
            }
            .padding(.top, 50)
            Image("State 1")
                .padding(.bottom, 15)
            Text("Bienvenue sur")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.bottom, 1)
            Text("ChallenGo")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.bottom, 20)
            JustifiedTextView(text: "Embarquez pour un voyage de croissance personnelle et de réussite. Avec des défis  conçus pour vous inspirer et vous motiver, ChallenGo vous aide à grandir, un pas à la fois.")
                .padding(.horizontal, 30)
                .frame(height: 120)
            JustifiedTextView(text: "Commencez dès aujourd'hui un chemin de croissance ludique et plein de surprises !")
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
                    navigateToOnboardingView2 = true
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
        .navigationDestination(isPresented: $navigateToOnboardingView2) {
            OnboardingView2()
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    OnboardingView1()
}

