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
    // Créer une classe si on a le temps
    var categories: [String] = ["Courage existentiel", "Ouverture à l”expérience", "Compassion pour soi", "Joker", "Autonomie", "Conscience de soi", "Compassion pour les autres", "Responsabilité de soi"]
    var selectedCategory: Int?
    @Binding var challengeNumber: Int
    let challenge = Challenge()
    // Retour à la vue de départ
    @State private var navigateToStartView = false
    // Drag'n drop nouvel item
    @State var offset: CGSize = CGSize(width: 0, height: -50)
    @State private var startLocation: CGSize = .zero
    // Logique d'affichage
    @State private var isCompleted = false
    @State private var isFailed = false
    @State private var isCongratulated = false
    // Texte bande-dessinée
    @State private var displayedText: String = ""
    @State private var index: Int = 0
    @State private var timer: Timer?
    // Collection d'items gagnés précédemment
    @State private var items: [NatureItem] = [
        //Ciel
        NatureItem(position: CGSize(width: 50, height: 50), imageName: "sun1"),
        NatureItem(position: CGSize(width: 100, height: 100), imageName: "nuage1"),
        NatureItem(position: CGSize(width: 150, height: 250), imageName: "nuage5"),
        NatureItem(position: CGSize(width: 200, height: 140), imageName: "nuage2"),
        NatureItem(position: CGSize(width: 250, height: 300), imageName: "nuage3"),
        NatureItem(position: CGSize(width: 300, height: 300), imageName: "nuage3"),
        NatureItem(position: CGSize(width: 350, height: 250), imageName: "nuage1"),
        
        //Arbres
        NatureItem(position: CGSize(width: 50, height: 750), imageName: "arbre1"),
        NatureItem(position: CGSize(width: 60, height: 750), imageName: "arbre1"),
        NatureItem(position: CGSize(width: 75, height: 750), imageName: "arbre1"),
        NatureItem(position: CGSize(width: 60, height: 740), imageName: "arbre1"),
        NatureItem(position: CGSize(width: 150, height: 550), imageName: "arbre5"),
        NatureItem(position: CGSize(width: 230, height: 550), imageName: "arbre5"),
        NatureItem(position: CGSize(width: 70, height: 550), imageName: "arbre5"),
        NatureItem(position: CGSize(width: 80, height: 500), imageName: "arbre5"),
        NatureItem(position: CGSize(width: 60, height: 500), imageName: "arbre5"),
        NatureItem(position: CGSize(width: 120, height: 570), imageName: "arbre5"),
        
        //Fleurs
        NatureItem(position: CGSize(width: 350, height: 750), imageName: "buisson1"),
        NatureItem(position: CGSize(width: 300, height: 750), imageName: "buisson3"),
        NatureItem(position: CGSize(width: 320, height: 770), imageName: "buisson3"),
        
        //Autres
        NatureItem(position: CGSize(width: 350, height: 550), imageName: "lac1"),
        NatureItem(position: CGSize(width: 300, height: 650), imageName: "cascade"),
        NatureItem(position: CGSize(width: 220, height: 770), imageName: "pierres"),
        NatureItem(position: CGSize(width: 180, height: 640), imageName: "lavande"),
        NatureItem(position: CGSize(width: 190, height: 640), imageName: "lavande"),
        NatureItem(position: CGSize(width: 200, height: 640), imageName: "lavande"),
        NatureItem(position: CGSize(width: 180, height: 640), imageName: "lavande"),
        NatureItem(position: CGSize(width: 180, height: 680), imageName: "lavande"),
        NatureItem(position: CGSize(width: 172, height: 660), imageName: "lavande"),
        NatureItem(position: CGSize(width: 170, height: 700), imageName: "lavande"),
        NatureItem(position: CGSize(width: 0, height: -80), imageName: "tmp") // Ajout du nouvel élément gagné
    ]
    
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
                        .position(x: item.position.width, y: item.position.height)
                }
                
                
                // Affichage du Challenge en cours
                if !isCompleted && !isFailed && selectedCategory != -1 {
                    ZStack {
                        RoundedRectangle(cornerRadius: 30.0)
                            .fill(Color(.colorRose))
                            .opacity(0.7)
                            .frame(width: 200.0, height: 220.0)
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.black, lineWidth: 1))
                        VStack {
                            Text(challenge.items[challengeNumber-1].description)                                    .font(.footnote)
                                .padding(.vertical, 10)
                            HStack {
                                Spacer()
                                Button(action: {
                                    isCompleted = true
                                }, label: {
                                    Image(systemName: "checkmark")
                                        .padding(12)
                                })
                                .foregroundColor(.black)
                                .background(Color(.colorGrey))
                                .cornerRadius(30)
                                Spacer()
                                Spacer()
                                Button(action: {
                                    isFailed = true                            }, label: {
                                        Image(systemName: "multiply")
                                            .padding(13)
                                    })
                                .foregroundColor(.black)
                                .background(Color(.colorGrey))
                                .cornerRadius(30)
                                Spacer()
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
                            .frame(width: 50.0, height:50.0)
                    }
                    .offset(x: 0, y: -80)
                }
                
                // Affichage des félicitations
                
                if isCompleted && !isCongratulated {
                    Text("Félicitations !\n\nTu as brillamment relevé ce défi.\n\nPlace ton nouvel élément et savoure\nta réussite !")
                        .font(.callout)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(.colorGrey))
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color(.colorRose), lineWidth: 1)
                        )
                        .offset(x: 0, y: -190)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                                isCongratulated = true
                                
                            }
                        }
                }
                
                // Affichage des condoléances
                if isFailed && !isCongratulated {
                    Text("Ne vous découragez pas !\n\nChaque échec est une opportunité\nd’apprendre.\n\nRelevez le prochain défi et continuez\nà avancer ! 🌟")
                        .font(.callout)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(.colorGrey))
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color(.colorRose), lineWidth: 1)
                        )
                        .offset(x: 0, y: -130)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
                                isCongratulated = true
                                navigateToStartView = true
                            }
                        }
                }
                
                // Affichage du nouvel item draggable
                if isCompleted && item.id == items[items.count-1].id  {
                    Image(challenge.items[challengeNumber-1].arbre)
                        .resizable()
                        .frame(width: 50, height: 50)
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
                    // Affichage du bouton de validation placement item
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Button(action: {
                                navigateToStartView = true
                            }) {
                                Image(systemName: "checkmark")
                                    .padding(20)
                                    .foregroundColor(.black)
                                    .background(Circle().fill(Color(.colorGrey)))
                                    .overlay(
                                        Circle()
                                            .stroke(Color.red, lineWidth: 1)
                                    )
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
        NatureGrowthView(selectedCategory: 2, challengeNumber: $challengeNumber)
    }
}


