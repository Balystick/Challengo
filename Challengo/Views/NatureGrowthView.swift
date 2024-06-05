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
    @State var offset: CGSize = .zero
    @State private var startLocation: CGSize = .zero
    // Collection d'items gagnés précédemment
    @State private var items: [NatureItem] = [
        NatureItem(position: CGSize(width: 50, height: 50), imageName: "leaf.fill"),
        NatureItem(position: CGSize(width: 100, height: 150), imageName: "leaf.fill"),
        NatureItem(position: CGSize(width: 150, height: 250), imageName: "leaf.fill"),
        NatureItem(position: CGSize(width: 200, height: 350), imageName: "leaf.fill"),
        NatureItem(position: CGSize(width: 250, height: 450), imageName: "leaf.fill"),
        NatureItem(position: CGSize(width: 300, height: 550), imageName: "leaf.fill"),
        NatureItem(position: CGSize(width: 350, height: 650), imageName: "leaf.fill"),
        NatureItem(position: CGSize(width: 400, height: 750), imageName: "tree.fill") // Ajout de l'arbre ici
    ]
    
    let darkGreen = Color(red: 34/255, green: 139/255, blue: 34/255)
    
    var body: some View {
        ZStack {
            Image("Valley")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            // Affichage des items gagnés précédemment
            ForEach(items) { item in
                if !items.isEmpty && item.id != items[items.count-1].id {
                    Image(systemName: item.imageName)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(darkGreen)
                        .position(x: item.position.width, y: item.position.height)
                }
                
                // Affichage du nouvel item draggable
                if item.id == items[items.count-1].id  {
                    //Test Mise à jour coordonnées dans collection
                    Text("(\(Int(items[items.count-1].position.width)), \(Int(items[items.count-1].position.height)))")
                        .offset(x: 100, y: 200)
                    // Fin du test
                    Image(systemName: "tree.fill")
                        .resizable()
                        .frame(width: 75, height: 75)
                        .foregroundColor(darkGreen)
                        .offset(x: offset.width, y: offset.height)                .gesture(
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
                }
            }
        }
    }
}
    
struct NatureGrowthView_Previews: PreviewProvider {
    static var previews: some View {
        NatureGrowthView()
    }
}
    
