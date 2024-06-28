//
//  OnboardingModel.swift
//  Challengo
//
//  Created by Apprenant 166 on 26/06/2024.
//

import Foundation

/**
Documentation de la structure Onboarding.
Cette structure représente des étapes d'accueil avec des informations visuelles et textuelles.
Elle est utilisée pour gérer les informations et les images affichées lors de l'accueil des utilisateurs.
*/
struct Onboarding: Identifiable {
    /// Identifiant unique pour chaque instance d'Onboarding.
    var id = UUID()
    /// Image du fond.
    var imageBelow: ImageBelow
    /// Image au-dessus de l'image du fond.
    var imageTop: ImageTop
    /// Image de l'état.
    var imageState: String
    /// Titre principal.
    var headline: String
    /// Description détaillée.
    var description: String
}

/**
Documentation de la structure ImageBelow.
Cette structure représente une image placée en dessous dans l'étape d'accueil.
*/
struct ImageBelow {
    /// Hauteur de l'image.
    var height: Double
    /// Décalage horizontal de l'image.
    var offsetX: Double
    /// Décalage vertical de l'image.
    var offsetY: Double
    /// Angle de rotation de l'image en degrés.
    var degree: Double
}

/**
Documentation de la structure ImageTop.
Cette structure représente une image placée au-dessus dans l'étape d'accueil.
*/
struct ImageTop {
    /// Nom de l'image.
    var name: String
    /// Hauteur de l'image.
    var height: Double
    /// Décalage vertical de l'image.
    var offsetY: Double
}
