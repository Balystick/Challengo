import SwiftUI

/**
 Cette vue affiche l'univers virtuel et le challenge en cours.
 Si le challenge est réussi, cette vue permet de placer le nouvel élément gagné dans l'univers virtuel.
 
 - Auteur: Aurélien
 - Date: 04/06/2024
 */
struct NatureGrowthView: View {
    /// Liste de catégories de challenges.
    var categories = natureGrowthCategories
    /// Index de la catégorie sélectionnée.
    var selectedCategory: Int?
    /// Numéro du défi en cours.
    @Binding var challengeNumber: Int
    /// Instance de la classe Challenge
    let challenge = Challenge()
    /// Booléen indiquant s'il faut retourner à la vue de départ.
    @State private var navigateToStartView = false
    /// Position du nouvel élément draggable.
    @State var offset: CGSize = CGSize(width: 0, height: -50)
    /// Position de départ du nouvel élément draggable.
    @State private var startLocation: CGSize = .zero
    /// Booléen indiquant si le défi est réussi.
    @State private var isCompleted = false
    /// Booléen indiquant si le défi est échoué.
    @State private var isFailed = false
    /// Booléen indiquant si les félicitations ont été affichées.
    @State private var isCongratulated = false
    /// Collection d'items gagnés précédemment et placés dans l'univers virtuel.
    @State private var items = natureGrowthItems
    
    var body: some View {
        ZStack {
            Image("Valley")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            // Affichage des items gagnés précédemment
            ForEach(items) { item in
                if !items.isEmpty && item.id != items[items.count-1].id {
                    item.image
                        .resizable()
                        .frame(width: 50, height: 50)
                        .position(x: item.position.width, y: item.position.height)
                }
                
                // Affichage du Challenge en cours
                if !isCompleted && !isFailed && selectedCategory != -1 {
                    ZStack {
                       RectangleView(numeroChallenge: challengeNumber, shortDescription: "")
                        VStack {
                            Text(challenge.items[challengeNumber-1].description)
                                .font(.footnote)
                                .padding(.vertical, 10)
                                .offset(y: 15)
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
                            .offset(y: 30)
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
                    Text("Ne te décourage pas !\n\nChaque échec est une opportunité\nd’apprendre.\n\nRelève le prochain défi et continue\nà avancer ! 🌟")
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


