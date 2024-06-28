import SwiftUI

/**
 Cette vue représente une roue de catégories de challenges avec une animation de rotation qui permet de sélectionner une catégorie de challenge de manière aléatoire.
 
 */
struct WheelView: View {
    /// Indicateur de navigation vers la vue `WheelView`.
    @Binding var navigateToWheelView: Bool
    /// Nombre de sections de la roue.
    let sections = 8
    /// Durée de l'animation de rotation de la roue en secondes.
    let rotationDuration: Double = 3.0
    /// Angle de rotation de la roue.
    @State private var rotationAngle: Double = 0
    /// Catégorie de défis sélectionnée.
    @State private var selectedCategory: Int?
    /// Indicateur pour afficher la vue carrousel.
    @State private var showCarrouselView = false
    /// Indicateur si le défi est accepté.
    @State private var challengeAccepted = false
    /// Numéro du défi sélectionné.
    @State private var challengeNumber = -1
    
    var body: some View {
        ZStack {
            // Image de fond
            Image("Valley")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .gesture(
                    DragGesture()
                        .onEnded { value in
                            if value.translation.width > 50 {
                                navigateToWheelView = false
                            }
                        }
                )
            VStack {
                // Image de la roue
                Image("roue")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 350)
                    .rotationEffect(.degrees(rotationAngle))
                    .animation(.easeInOut(duration: rotationDuration), value: rotationAngle)
                    .offset(x: 0, y: -135)
                
                // Bouton pour lancer la roue
                Button(action: spinWheelAndSelectCategory) {
                    Text("Lancer !")
                        .font(.callout)
                        .padding(.horizontal, 15)
                        .padding(.vertical, 10)
                        .foregroundColor(.black)
                        .background(Color(.colorGrey))
                        .cornerRadius(30)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.red, lineWidth: 1)
                        )
                }
                .padding()
            }
            // Image du pointeur de la roue
            Image("pointeur")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .offset(x: -120, y: -320)
        }
        // Présente la vue carrousel lorsque `showCarrouselView` est vrai
        .sheet(isPresented: $showCarrouselView) {
            CarrouselView(challengeAccepted: $challengeAccepted, selectedCategory: selectedCategory, challengeNumber: $challengeNumber)
                .onDisappear {
                    if challengeAccepted {
                        showCarrouselView = false
                    } 
                    else {
                        rotationAngle = 0
                    }
                }
        }
        // Lors du changement de `selectedCategory`, affiche la modale après un délai
        .onChange(of: selectedCategory) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                showCarrouselView = true
            }
        }
        // Navigation vers `NatureGrowthView` si le défi est accepté
        .navigationDestination(isPresented: $challengeAccepted) {
            NatureGrowthView(selectedCategory: selectedCategory, challengeNumber: $challengeNumber)
                .navigationBarBackButtonHidden(true)
        }
    }
    /// Fait tourner la roue et sélectionne une catégorie de manière aléatoire.
    func spinWheelAndSelectCategory() {
        // définit une rotation aléatoire entre 4 et 6 tours (en degrés)
        let rotation = Double.random(in: 4...6) * 360.0
        // Met à jour rotationAngle
        rotationAngle = rotation
        
        // Détermine la section sur laquelle se trouve le pointeur après rotation
        DispatchQueue.main.asyncAfter(deadline: .now() + rotationDuration) {
            let anglePerSection = 360.0 / Double(sections)
            let calculatedSection = Int(rotation.truncatingRemainder(dividingBy: 360.0) / anglePerSection) + 1
            // Détermine l'index de la catégorie
            selectedCategory = sections - calculatedSection
        }
    }
}

struct WheelView_Previews: PreviewProvider {
    @State static var navigateToWheelView = false
    
    static var previews: some View {
        WheelView(navigateToWheelView: $navigateToWheelView)
    }
}
