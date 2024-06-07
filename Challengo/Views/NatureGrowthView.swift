//
//  NatureGrowthView.swift
//  Challengo
//
//  Created by Aurélien on 05/06/2024.
//
//

import SwiftUI

// Modèle d'item avec id, position et image
struct NatureItem: Identifiable {
    let id = UUID()
    var position: CGSize
    var imageName: String
}

struct NatureGrowthView: View {
    @State private var navigateToStartView = false
    @State var offset: CGSize = .zero
    @State private var startLocation: CGSize = .zero
    // Collection d'items gagnés précédemment
    @State private var items: [NatureItem] = [
        NatureItem(position: CGSize(width: 50, height: 50), imageName: "sun1"),
        NatureItem(position: CGSize(width: 100, height: 100), imageName: "nuage1"),
        NatureItem(position: CGSize(width: 150, height: 150), imageName: "nuage5"),
        NatureItem(position: CGSize(width: 200, height: 150), imageName: "nuage1"),
        NatureItem(position: CGSize(width: 250, height: 150), imageName: "nuage1"),
        NatureItem(position: CGSize(width: 300, height: 150), imageName: "nuage1"),
        NatureItem(position: CGSize(width: 350, height: 150), imageName: "nuage1"),
        NatureItem(position: CGSize(width: 400, height: 400), imageName: "onSenFout") // Ajout du nouvel élément gagné
    ]
    let darkGreen = Color(red: 34/255, green: 139/255, blue: 34/255)
    var selectedSection: Int?
    @Binding var challengeNumber: Int
    let challenge = Challenge()
    @State private var isCompleted = false
    @State private var isFailed = false
    @State private var isCongratulated = false
    @State private var isMessageVisible = false
    
    // Créer une classe si on a le temps
    var categories: [String] = ["Courage existentiel", "Ouverture à l”expérience et au changement", "Compassion pour soi", "Joker", "Autonomie", "Conscience de soi", "Compassion pour les autres", "Responsabilité de soi"]
    
    var body: some View {
        ZStack {
            Image("Valley")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            // Affichage des items gagnés précédemment
            ForEach(items) { item in
                if !items.isEmpty && item.id != items[items.count-1].id {
                    Image(item.imageName)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(darkGreen)
                        .position(x: item.position.width, y: item.position.height)
                }
                
                
                // Affichage du Challenge en cours
                if !isCompleted && !isFailed && selectedSection != -1 {
                    ZStack {
                        RoundedRectangle(cornerRadius: 30.0)
                            .fill(Color.red)
                            .opacity(0.7)
                            .frame(width: 200.0, height: 220.0)
                        VStack {
                            Text("Challenge \(categories[selectedSection ?? -1])")
                                .font(.headline)
                                .padding(.top, 20)
                            Text(challenge.items[challengeNumber-1].description)                                    .font(.footnote)
                                .padding(.vertical, 10)
                            HStack {
                                Button(action: {
                                    isCompleted = true
                                }, label: {
                                    Text("Accompli")
                                        .font(.footnote)
                                        .padding(7)
                                })
                                .foregroundColor(.black)
                                .background(Color(red: 0.77, green: 0.76, blue: 0.761))
                                .cornerRadius(20)
                                
                                Button(action: {
                                    isFailed = true                            }, label: {
                                        Text("Échoué")
                                            .font(.footnote)
                                            .padding(7)
                                    })
                                .foregroundColor(.black)
                                .background(Color(red: 0.77, green: 0.76, blue: 0.761))
                                .cornerRadius(20)
                            }
                        }
                        .frame(width: 180, height: 200)
                    }
                    .offset(x: 0, y: -250)
                    VStack {
                        Text("Vous gagnez :")
                            .font(.headline)
                            .padding()
                            .frame(width: 200)
                        Image(challenge.items[challengeNumber-1].arbre)
                            .resizable()
                            .frame(width: 70.0, height:70.0)
                    }
                    .offset(x: 0, y: -70)
                }
                
                // Affichage des félicitations
                if isCompleted && !isCongratulated {
                    Text("Félicitations !\n\nTu as brillamment relevé ce défi.\n\nDépose ton nouvel item avec soin :")
                        .offset(x: 0, y: -120)
                        .frame(width: 350)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                isCongratulated = true
                            }
                        }
                }
                
                // Affichage des condoléances
                if isFailed && !isCongratulated {
                    Text("Ne vous découragez pas, chaque échec est une opportunité d’apprendre.\nRelevez le prochain défi et continuer à avancer ! 🌟")
                        .offset(x: 0, y: -150)
                        .frame(width: 350)
                        .transition(.slide)
                        .onAppear {
                            withAnimation(.easeInOut) {
                                isMessageVisible = true
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                                isCongratulated = true
                                navigateToStartView = true
                            }
                        }
                        .onDisappear {
                            withAnimation(.easeInOut) {
                                isMessageVisible = false
                            }
                        }
                    
                }
                
                // Affichage du nouvel item draggable
                if isCompleted && item.id == items[items.count-1].id  {
                    Image(challenge.items[challengeNumber-1].arbre)
                        .resizable()
                        .frame(width: 75, height: 75)
                        .foregroundColor(darkGreen)
                        .offset(x: offset.width, y: offset.height)
                        .gesture(
                            DragGesture ()
                                .onChanged { gesture in
                                    withAnimation(.spring()) {
                                        self.offset = CGSize(width: self.startLocation.width + gesture.translation.width,
                                                             height: self.startLocation.height + gesture.translation.height)                            }
                                }
                                .onEnded { gesture in
                                    self.startLocation = self.offset
                                    // Mise à jour de la nouvelle position du nouvel item dans la collection
                                    items[items.count-1].position = self.offset
                                }
                        )
                    // Affichage du bouton de validation position item
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Button(action: {
                                navigateToStartView = true
                            }) {
                                Image(systemName: "checkmark")
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.blue)
                                    .clipShape(Circle())
                                    .shadow(radius: 5)
                            }
                            .padding(.trailing, 50)
                        }
                    }
                }
            }
        }
        .navigationDestination(isPresented: $navigateToStartView) {
            StartView()
        }
    }
}

struct NatureGrowthView_Previews: PreviewProvider {
    @State static var challengeNumber = 3
    static var previews: some View {
        NatureGrowthView(selectedSection: 2, challengeNumber: $challengeNumber)
    }
}

