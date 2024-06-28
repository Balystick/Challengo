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
    @State private var selectedCategory = -1
    @State private var challengeNumber = 3
    
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
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.bottom, 1)
                Text(" Challenge ?")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding(.bottom, 90)
                Text("Relève des défis amusants pour enrichir ta croissance personnelle")
                    .font(.body)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .frame(width: 250)
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            }
            Image("arrow")
                .resizable()
                .frame(width: 80, height: 80)
                .offset(CGSize(width: 150.0, height: -46.0))
            HStack {
                Image("arrow")
                    .resizable()
                    .frame(width: 75, height: 75)
                    .scaleEffect(x: -1, y: 1)
                Text("Découvre ta forêt virtuelle")
                    .font(.body)
                    .fontWeight(.semibold)
                Spacer()
            }
            .offset(x: 20, y: 230)
        }
        .navigationBarHidden(true)
        .navigationDestination(isPresented: $navigateToOnboardingView1) {
            OnboardingView1()
                .navigationBarBackButtonHidden(true)
        }
        .navigationDestination(isPresented: $navigateToCalendarView) {
            TrackingView()
                .navigationBarBackButtonHidden(true)
        }
        .navigationDestination(isPresented: $navigateToWheelView) {
            WheelView(navigateToWheelView: $navigateToWheelView)
                .navigationBarBackButtonHidden(true)

        }
        .navigationDestination(isPresented: $navigateToNatureGrowthView) {
            NatureGrowthView(selectedCategory: -1, challengeNumber: $challengeNumber)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    StartView()
}
