import SwiftUI

/**
 Documentation de la structure NatureItem
 
 Cette structure représente un item de l'univers virtuel avec une position et une image.

 - Author: Aurélien
 - Date: 27/06/2024
 */
struct NatureItem: Identifiable {
    /// L'identifiant unique de l'item
    let id = UUID()
    /// La position de l'item dans l'univers virtuel
    var position: CGSize
    /// L'image de l'item
    var image: Image
}

let natureGrowthItems: [NatureItem] = [
    //Ciel
    NatureItem(position: CGSize(width: 50, height: 50), image: Image("sun1")),
    NatureItem(position: CGSize(width: 100, height: 100), image: Image("nuage1")),
    NatureItem(position: CGSize(width: 150, height: 250), image: Image("nuage5")),
    NatureItem(position: CGSize(width: 200, height: 140), image: Image("nuage2")),
    NatureItem(position: CGSize(width: 250, height: 300), image: Image("nuage3")),
    NatureItem(position: CGSize(width: 300, height: 300), image: Image("nuage3")),
    NatureItem(position: CGSize(width: 350, height: 250), image: Image("nuage1")),
    
    //Arbres
    NatureItem(position: CGSize(width: 50, height: 750), image: Image("arbre1")),
    NatureItem(position: CGSize(width: 60, height: 750), image: Image("arbre1")),
    NatureItem(position: CGSize(width: 75, height: 750), image: Image("arbre1")),
    NatureItem(position: CGSize(width: 60, height: 740), image: Image("arbre1")),
    NatureItem(position: CGSize(width: 150, height: 550), image: Image("arbre5")),
    NatureItem(position: CGSize(width: 230, height: 550), image: Image("arbre5")),
    NatureItem(position: CGSize(width: 70, height: 550), image: Image("arbre5")),
    NatureItem(position: CGSize(width: 80, height: 500), image: Image("arbre5")),
    NatureItem(position: CGSize(width: 60, height: 500), image: Image("arbre5")),
    NatureItem(position: CGSize(width: 120, height: 570), image: Image("arbre5")),
    
    //Fleurs
    NatureItem(position: CGSize(width: 350, height: 750), image: Image("buisson1")),
    NatureItem(position: CGSize(width: 300, height: 750), image: Image("buisson3")),
    NatureItem(position: CGSize(width: 320, height: 770), image: Image("buisson3")),
    
    //Autres
    NatureItem(position: CGSize(width: 350, height: 550), image: Image("lac1")),
    NatureItem(position: CGSize(width: 300, height: 650), image: Image("cascade")),
    NatureItem(position: CGSize(width: 220, height: 770), image: Image("pierres")),
    NatureItem(position: CGSize(width: 180, height: 640), image: Image("lavande")),
    NatureItem(position: CGSize(width: 190, height: 640), image: Image("lavande")),
    NatureItem(position: CGSize(width: 200, height: 640), image: Image("lavande")),
    NatureItem(position: CGSize(width: 180, height: 640), image: Image("lavande")),
    NatureItem(position: CGSize(width: 180, height: 680), image: Image("lavande")),
    NatureItem(position: CGSize(width: 172, height: 660), image: Image("lavande")),
    NatureItem(position: CGSize(width: 170, height: 700), image: Image("lavande")),
    NatureItem(position: CGSize(width: 0, height: -80), image: Image("tmp")) // Ajout du nouvel élément gagné
]

/**
 Un tableau de catégories de challenge.

 - Note: Les catégories actuelles comprennent le courage existentiel, l'ouverture à l'expérience, la compassion pour soi, l'autonomie, la conscience de soi, la compassion pour les autres et la responsabilité de soi.
 */
let natureGrowthCategories: [String] = [
    "Courage existentiel",
    "Ouverture à l”expérience",
    "Compassion pour soi",
    "Joker",
    "Autonomie",
    "Conscience de soi",
    "Compassion pour les autres",
    "Responsabilité de soi"]
