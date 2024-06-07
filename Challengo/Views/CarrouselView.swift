//
//  CarrouselView.swift
//  }
//
//  Created by Audrey on 04/06/2024.
//

import SwiftUI

struct Card: Identifiable {
    var id: Int
    var num: Int
    var title: String
    var shortDescription: String
    var description: String
    var arbre: String
}

class Challenge: ObservableObject {
    @Published var items: [Card]
    
    let nums: [Int] = [1, 2, 3]
    
    let shortDescriptions : [String] = ["Douche froide", "Méditer", "Se coucher tôt", ]
    
    let descriptions: [String] = ["Votre défi aujourd’hui est de prendre une douche froide pendant 3 minutes", "Votre défi aujourd’hui est de méditer pendant 20mn", "Votre défi aujourd’hui est de vous coucher avant 22h"]
    
    let arbres: [String] = ["arbre1", "arbre2", "arbre3"]
    
    init() {
        items = []
        for i in 0..<3 {
            let new = Card(id: i, num: nums[i], title: "Challenge \(i)", shortDescription: shortDescriptions[i], description: descriptions[i], arbre: arbres[i])
            items.append(new)
        }
    }
}


struct CarrouselView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var challenge = Challenge()
    @State private var snappedItem = 0.0
    @State private var draggingItem = 0.0
    @State var activeIndex: Int = 0
    //Passage du challenge accepté à la vue mère
    @Binding var challengeAccepted: Bool
    var selectedSection: Int?
    @Binding var challengeNumber: Int
    // Créer une classe si on a le temps
    var categories: [String] = ["Courage existentiel", "Ouverture à l”expérience et au changement", "Compassion pour soi", "Joker", "Autonomie", "Conscience de soi", "Compassion pour les autres", "Responsabilité de soi"]

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
                            ZStack {
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(Color(red: 0.98, green: 0.439, blue: 0.439))
                                    .cornerRadius(2.0)
                                    .frame(width: 200.0, height: 220.0)
                                VStack {
                                    Spacer()
                                    Text("Challenge \(item.num)")
                                        .font(.headline)
                                    Spacer()
                                    Text(" \(item.shortDescription)").font(.subheadline)
                                        .multilineTextAlignment(.center)
                                        .padding()
                                    Spacer()
                                    Spacer()
                                }
                            }
                            .frame(width: 200, height: 200)
                        
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
                .onAppear(perform: {
                    appear()
                })
                }
    }
    
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
    
    func distance(_ item: Int) -> Double {
        return (draggingItem - Double(item)).remainder(dividingBy: Double(challenge.items.count))
    }
    
    func myXOffset(_ item: Int) -> Double {
        let angle = Double.pi * 2 / Double(challenge.items.count) * distance(item)
        return sin(angle) * 200
    }
    
    func appear() {
        
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
