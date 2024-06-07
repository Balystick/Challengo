//
//  AcceptedChallengeView.swift
//  Challengo
//
//  Created by Audrey on 04/06/2024.
//

import SwiftUI

struct AcceptedChallengeView: View {
    @Binding var challengeNumber: Int
    let challenge = Challenge()

    var body: some View {
            ZStack {
                Image("ValleySun")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                    ZStack {
                    VStack {
//                        Text(challenge.items[challengeNumber-1].description)
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
                            Text("Challenge \(challengeNumber)")
                            .font(.headline)
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
            .navigationBarBackButtonHidden(true)
        }
    }

// Ajustement Preview
struct AcceptedChallengeView_Previews: PreviewProvider {
    @State static var challengeNumber = 3
    static var previews: some View {
        AcceptedChallengeView(challengeNumber: $challengeNumber)
    }
}
