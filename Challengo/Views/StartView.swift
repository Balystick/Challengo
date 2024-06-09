//
//  StartView.swift
//  Challengo
//
//  Created by Haiying on 06/06/2024.
//

import SwiftUI

struct StartView: View {
    @State private var navigateToCalendarView = false
    @State private var navigateToOnboardingView1 = false
    @State private var navigateToWheelView = false
    @State private var navigateToNatureGrowthView = false
    @State static var selectedCategory = -1
    @State static var challengeNumber = 3
    
    var body: some View {
        ZStack {
            Image("Valley")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .gesture(
                    DragGesture()
                        .onEnded { value in
                            if value.translation.width < -50 {
                                navigateToWheelView = true
                            }
                            if value.translation.width > 50 {
                                navigateToNatureGrowthView = true
                            }
                        }
                )
            VStack {
                HStack(spacing: 300){
                    Button(action: {
                        navigateToOnboardingView1 = true
                    }, label: {
                        Image(systemName: "info.square")
                            .foregroundColor(Color.black)
                    })
                    Button(action: {
                        navigateToCalendarView = true
                    }, label: {
                        Image(systemName: "calendar")
                            .foregroundColor(Color.black)
                    })
                }
                Spacer()
                Text("Envie de")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text(" Challenge ?")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding(.vertical, 20.0)
                Text("pour être meilleur dans ta vie")
                    .font(.body)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .frame(width: 100)
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            }
            Image("arrow")
                .resizable()
                .frame(width: 100, height: 100)
                .offset(CGSize(width: 120.0, height: 100.0))
        }
        .navigationBarHidden(true)
        .navigationDestination(isPresented: $navigateToOnboardingView1) {
            OnboardingView1()
                .navigationBarBackButtonHidden(true)
        }
        .navigationDestination(isPresented: $navigateToCalendarView) {
            TrackingView()
            //                .navigationBarItems(leading: backButton)
                .navigationBarBackButtonHidden(true)
        }
        .navigationDestination(isPresented: $navigateToWheelView) {
            WheelView()
                .navigationBarBackButtonHidden(true)
        }
        .navigationDestination(isPresented: $navigateToNatureGrowthView) {
            NatureGrowthView(selectedCategory: -1, challengeNumber: StartView.$challengeNumber)
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    StartView()
}
