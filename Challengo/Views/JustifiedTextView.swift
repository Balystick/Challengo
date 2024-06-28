//
//  JustifiedTextView.swift
//  Challengo
//
//  Created by Haiying on 06/06/2024.
//

import SwiftUI

/**
La vue `JustifiedTextView` affiche un texte justifié en utilisant `UITextView`.
Cette vue permet d'intégrer du texte justifié dans une application SwiftUI.
Elle utilise `UIViewRepresentable` pour intégrer un `UITextView` dans SwiftUI.
*/
struct JustifiedTextView: UIViewRepresentable {
    /// Texte à afficher dans la vue.
    var text: String

    /// Fonction pour créer et configurer une instance de `UITextView` pour afficher du texte justifié.
    /// - Paramètre context: Le contexte de la vue, fourni par SwiftUI.
    /// - Retourne: Une instance configurée de `UITextView` avec une police par défaut et un alignement justifié.
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
        textView.textAlignment = .justified
        return textView
    }
    
    /// Fonction pour mettre à jour le contenu du `UITextView` avec le texte fourni.
    /// Cette méthode est appelée par SwiftUI pour s'assurer que l'interface utilisateur reflète l'état actuel des données.
    /// - Paramètres:
    ///   - uiView: L'instance de `UITextView` à mettre à jour.
    ///   - context: Le contexte de la vue, fourni par SwiftUI.
    /// - Retourne: Rien.
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
}
