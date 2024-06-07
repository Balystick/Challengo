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
        NatureItem(position: CGSize(width: 180, height: 660), imageName: "lavande"),
        NatureItem(position: CGSize(width: 180, height: 700), imageName: "lavande"),
        

        
        
        
        
        
        
        NatureItem(position: CGSize(width: 400, height: 750), imageName: "arbre1") // Ajout du nouvel élément gagné
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
                    Image(item.imageName)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(darkGreen)
                        .position(x: item.position.width, y: item.position.height)
                }
                
                // Affichage du nouvel item draggable
                if item.id == items[items.count-1].id  {
                    Image("arbre1")
                        .resizable()
                        .frame(width: 50, height: 50)
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
    
