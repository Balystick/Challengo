//
//  AcceptedChallengeView.swift
//  Challengo
//
//  Created by Audrey on 04/06/2024.
//

import SwiftUI

struct AcceptedChallengeView: View {
    var body: some View {
            ZStack {
            
                Image("ValleySun")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                    ZStack {
                    VStack {
                        Spacer()
                        RoundedRectangle(cornerRadius: 30.0)
                            .fill(.red)
                            .opacity(0.7)
                            .cornerRadius(2.0)
                            .frame(width: 200.0, height: 220.0)
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        }
                    VStack {
                        Spacer()
                        Spacer()
                            Text("Challenge 1").font(.headline)
                            Spacer()
                            Text("Prendre une douche froide").font(.footnote)
                            Spacer()
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Text("Accompli")
                                    .font(.footnote)
                                    .padding(7)
                            })
                            .foregroundColor(.black)
                            .background(Color(red: 0.77, green: 0.76, blue: 0.761))
                            .cornerRadius(20)
                            
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        }
                    }
            }
        }
    }

#Preview {
    AcceptedChallengeView()
}
