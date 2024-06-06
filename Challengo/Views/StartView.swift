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
    
    var backButton: some View {
          Button(action: {
              // Action à effectuer lors du retour
              // Par exemple, pour revenir à la vue précédente :
              navigateToCalendarView = false
          }) {
              Image(systemName: "arrow.left")
                  .foregroundColor(Color.black)
          }
      }
    
    var body: some View {
        NavigationStack {
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
                             }
                     )
                VStack{
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
                    Text("pour être")
                        .font(.body)
                        .fontWeight(.semibold)
                    Text("meilleur")
                        .font(.body)
                        .fontWeight(.semibold)
                    Text("dans ta vie")
                        .font(.body)
                        .fontWeight(.semibold)
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                }
            }
            .navigationDestination(isPresented: $navigateToOnboardingView1) {
                OnboardingView1()
                .navigationBarBackButtonHidden(true)
            }
            .navigationDestination(isPresented: $navigateToCalendarView) {
                TrackingView()
                .navigationBarItems(leading: backButton)
                .navigationBarBackButtonHidden(true)
            }
            .navigationDestination(isPresented: $navigateToWheelView) {
                WheelView()
                .navigationBarBackButtonHidden(true)
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    StartView()
}
