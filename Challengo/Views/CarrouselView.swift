//
//  CarrouselView.swift
//  }
//
//  Created by Audrey on 04/06/2024.
//

import SwiftUI
/**
 La structure Card pour définir les éléments d'une Card avec unnuméro d' identification unique
 */

struct Card: Identifiable {
    /// Identification de la Card
    var id: Int
    /// Numéro d'identification de la Card
    var num: Int
    /// Titre de la Card
    var title: String
    /// Description courte de la Card
    var shortDescription: String
    /// Description complète de la Card
    var description: String
    /// Elément arbre associé à la Card
    var arbre: String
}

/**
 * La classe Challenge représente un ensemble de défis.
 * La classe Challenge est un objet observable qui contient une liste d'objets Card avec des défis (items) initialisée avec des valeurs prédéfinies.
*/
class Challenge: ObservableObject {
    /// Une liste des objets `Card` représentant les défis.
    @Published var items: [Card]
    /// Une liste des numéros associés aux défis.
    let nums: [Int] = [1, 2, 3]
    /// Une liste des courtes descriptions pour chaque défi.
    let shortDescriptions : [String] = ["Douche froide", "Méditer", "Se coucher tôt"]
    /// Une liste des descriptions détaillées pour chaque défi.
    let descriptions: [String] = ["Votre défi aujourd’hui est de prendre une douche froide pendant 3 minutes", "Votre défi aujourd’hui est de méditer pendant 20mn", "Votre défi aujourd’hui est de vous coucher avant 22h"]
    /// Une liste des noms des arbres associés à chaque défi.
    let arbres: [String] = ["arbre1", "arbre2", "arbre3"]
    
    /// Initialiseur pour la classe `Challenge`.
    /// Crée une nouvelle instance de `Challenge` et initialise la liste `items` avec trois objets `Card`, chacun représentant un défi spécifique.
    /// Parametres:
    ///  - id : numéro d'identification la Card
    /// - num : Une liste des numéros associés aux défis.
    /// - shortDescription: Une liste des courtes descriptions pour chaque défi.
    /// - description : Description complète de la Card
    /// - arbre : Elément arbre associé à la Card
    init() {
        items = []
        for i in 0..<3 {
            let new = Card(id: i, num: nums[i], title: "Challenge \(i)", shortDescription: shortDescriptions[i], description: descriptions[i], arbre: arbres[i])
            items.append(new)
        }
    }
}

/**
 La structure CarrouselView est une vue représentant un carrousel de défis.

 Cette vue permet à l'utilisateur de parcourir une série de défis, avec la possibilité de sélectionner un défi en particulier. Elle inclut des fonctionnalités de glissement pour naviguer à travers les défis disponibles.

 Cette vue utilise `Challenge` comme objet d'état pour gérer les données des défis.

 Les gestes de glissement (`DragGesture`) sont utilisés pour interagir avec les défis à l'écran. 
 Les méthodes `distance(_:)` et `myXOffset(_:)` calculent respectivement la distance entre les éléments et leur position X sur l'écran, basées sur l'état de glissement (`draggingItem`) et le nombre total d'éléments (`challenge.items.count`).

 Cette vue inclut également des actions pour sélectionner un défi et revenir en arrière à l'aide du bouton de fermeture.

 */
struct CarrouselView: View {
    ///Propriété d'environnement pour gérer le comportement de dismissal d'une vue.
    @Environment(\.dismiss) var dismiss
    
    ///Propriété d'environnement pour accéder au mode de présentation de la vue actuelle. Est utilisée pour déclencher la fermeture de la vue modale présentement affichée.
    @Environment(\.presentationMode) var presentationMode
    
    ///Propriété observable de type Challenge
    @StateObject var challenge = Challenge()
    
    ///Synchronise les changements d'état  de la variable privée `snappedItem`.  Initialement définie à 0.0.
    @State private var snappedItem = 0.0
    
    ///Synchronise les changements d'état  de la variable privée `draggingItem`.  Initialement définie à 0.0.
    @State private var draggingItem = 0.0
    
    ///Synchronise les changements d'état  de la variable `activeIndex`.  Initialement définie à 0.
    @State var activeIndex: Int = 0
    
    ///Variable avec une liaison bidirectionnelle à un Booléen pour indiquer si un défi a été accepté par l'utilisateur.
    //Passage du challenge accepté à la vue mère
    @Binding var challengeAccepted: Bool
    
    ///Variable qui de l'index de la section sélectionnée dans les catégories de défis.
    var selectedSection: Int?
    
    ///Variable avec une liaison bidirectionnelle à un entier qui représente le numéro du défi sélectionné
    @Binding var challengeNumber: Int
    
    ///Variable qui crée un tableau des catégories de challenges
    var categories: [String] = ["Courage existentiel", "Ouverture à l'expérience et au changement", "Compassion pour soi", "Joker", "Autonomie", "Conscience de soi", "Compassion pour les autres", "Responsabilité de soi"]

    var body: some View {
     
        VStack {
            ZStack {
                VStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "xmark.circle")
                            .font(.largeTitle)
                            .foregroundColor(.gray)
                    }
                    .frame(alignment: .topTrailing)
//                    .padding()
                    .font(.title)
                    Text("Challenges \(categories[selectedSection ?? -1])")
                        .font(.title3)
                        
                        .fontWeight(.bold)
                        .frame(height: 50)

                }
                   }
                ZStack {
                    ForEach(challenge.items) { item in
                        VStack {
                            RectangleView(numeroChallenge: item.num, shortDescription: item.shortDescription)
                                .offset(y: 20)
                            VStack {
                                Spacer()
                                Text("Description:")
                                .font(.headline)
                                .padding()
                                .frame(width: 200)
                                
                                Text("\(item.description)")
                                    .font(.subheadline)
                                    .frame(width: 200.0)
                            Spacer()
                            Text("Vous gagnez:")
                                    .font(.headline)
                                    .frame(width: 200)
                            Spacer()
                                Image(item.arbre)
                                .resizable()
                                .frame(width: 70.0, height:70.0)
                            Spacer()
                            Button(action: {
                                // Passage du challenge accepté à la vue mère
                                challengeAccepted = true
                                challengeNumber = item.num
                                dismiss()
                            }, label: {
                                Text("Choisir")
                                    .font(.footnote)
                                    .foregroundColor(Color.black)
                                    .frame(width: 60)
                                    .padding(.horizontal, 20.0)
                                    .foregroundColor(.black)
                                    .background(Color(red: 0.77, green: 0.76, blue: 0.761))
                                    .cornerRadius(20)
                                    .border(.red)
                            })
                                Spacer()
                     
                            }.opacity(1.0 - abs(distance(item.id)) * 1 )
                           
                        }
                        .frame(width: 20.0)
                        .scaleEffect(1.0 - abs(distance(item.id)) * 0.1 )
                        .opacity(1.0 - abs(distance(item.id)) * 0.4 )
                        .offset(x: myXOffset(item.id), y: 0)
                        .zIndex(1.0 - abs(distance(item.id)) * 0.1)
                        .onTapGesture {
                            withAnimation {
                                draggingItem = Double(item.id)
                            }
                    }
                    }
                }
                .gesture(getDragGesture())
                }
    }
/**
     Cette méthode privée `getDragGesture` retourne un geste de glissement (`DragGesture`) personnalisé. Le geste de glissement permet de gérer l'interaction de l'utilisateur en déplaçant et en arrêtant un élément à l'écran en fonction de ses translations.

     - Returns: Un geste (`some Gesture`) de type `DragGesture` configuré avec des actions spécifiques pour les événements `onChanged` et `onEnded`.
*/
    private func getDragGesture() -> some Gesture {
         DragGesture()
             .onChanged { value in
                 draggingItem = snappedItem + value.translation.width / 100
             }
             .onEnded { value in
                 withAnimation {
                     draggingItem = snappedItem + value.predictedEndTranslation.width / 100
                     draggingItem = round(draggingItem).remainder(dividingBy: Double(challenge.items.count))
                     snappedItem = draggingItem
                     
                     //Get the active Item index
                     self.activeIndex = challenge.items.count + Int(draggingItem)
                     if self.activeIndex > challenge.items.count || Int(draggingItem) >= 0 {
                         self.activeIndex = Int(draggingItem)
                     }
                 }
             }
     }
    /**
     Calcule la distance entre l'élément en cours de glissement et un élément donné.

     Cette fonction utilise l'opération du reste pour calculer la distance, ce qui permet de gérer les cas où la distance pourrait dépasser les limites de l'ensemble des éléments.

     - Parameter item: L'index de l'élément pour lequel la distance doit être calculée.
     - Returns: La distance entre l'élément en cours de glissement et l'élément spécifié.
     - Note: `draggingItem` et `challenge.items.count` doivent être définis et valides avant d'appeler cette fonction.
     */
    func distance(_ item: Int) -> Double {
        return (draggingItem - Double(item)).remainder(dividingBy: Double(challenge.items.count))
    }
    
    /**
     Calcule l'offset X pour un élément donné.

     Cette fonction utilise l'index de l'élément pour calculer un angle basé sur le nombre total d'éléments dans `challenge.items`. Elle utilise ensuite cet angle pour calculer la composante X d'un point sur un cercle de rayon 200.

     - Parameter item: L'index de l'élément pour lequel calculer l'offset X.
     - Returns: L'offset X calculé pour l'élément spécifié.
     */
    func myXOffset(_ item: Int) -> Double {
        let angle = Double.pi * 2 / Double(challenge.items.count) * distance(item)
        return sin(angle) * 200
    }
}

// Ajustement Preview
struct CarrouselView_Previews: PreviewProvider {
    @State static var challengeAccepted = true
    @State static var selectedSection = 3
    @State static var challengeNumber = 3
    static var previews: some View {
        CarrouselView(challengeAccepted: $challengeAccepted, selectedSection: selectedSection, challengeNumber: $challengeNumber)
    }
}
