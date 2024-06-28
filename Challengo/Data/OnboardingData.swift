//
//  OnboardingData.swift
//  Challengo
//
//  Created by Apprenant 166 on 26/06/2024.
//

import Foundation

/// Un tableau de données `Onboarding` représentant les étapes d'accueil pour les utilisateurs.
/// - Note: Chaque instance d'`Onboarding` contient des informations visuelles et textuelles pour une étape spécifique de l'accueil des utilisateurs.
let onboardingData = [
    Onboarding(
        imageBelow: ImageBelow(height: 350, offsetX: -80, offsetY: -45, degree: 0),
        imageTop: ImageTop(name: "Logo", height: 260, offsetY: -55),
        imageState: "State 1",
        headline: "Bienvenue sur\n    ChallenGo",
        description: "Embarquez pour un voyage de croissance personnelle et de réussite. Avec des défis  conçus pour vous inspirer et vous motiver, ChallenGo vous aide à grandir, un pas à la fois. \n\nCommencez dès aujourd'hui un chemin de croissance ludique et plein de surprises !"
    ),
    
    Onboarding(
        imageBelow: ImageBelow(height: 350, offsetX: -90, offsetY: -35, degree: 0),
        imageTop: ImageTop(name: "Onbording 2", height: 280, offsetY: -60),
        imageState: "State 2",
        headline: "Défis quotidiens",
        description: "Chaque jour, relevez un nouveau défi conçu pour vous aider à grandir. Des exercices de pleine conscience aux astuces de productivité, chaque défi est conçu pour vous guider et vous soutenir dans votre développement.\n\nRestez constant : relevez des défis quotidiens aide à construire des habitudes durables."
    ),
    
    Onboarding(
        imageBelow: ImageBelow(height: 360, offsetX: -50, offsetY: 60, degree: -177.38),
        imageTop: ImageTop(name: "Onbording 3", height: 250, offsetY: -70),
        imageState: "State 2",
        headline: "Faites croître votre\n      forêt virtuelle",
        description: "Chaque fois que vous réussirez un challenge, vous planterez un arbre ou un élément de votre forêt virtuelle. Regardez votre forêt prospérer à mesure que vous atteignez vos objectifs. Visualisez vos progrès : Votre forêt virtuelle est le reflet de votre engagement et de votre croissance."
    ),
    
    Onboarding(
        imageBelow: ImageBelow(height: 360, offsetX: -70, offsetY: -35, degree: -2.61),
        imageTop: ImageTop(name: "Onbording 4", height: 250, offsetY: -60),
        imageState: "State 2",
        headline: "Impact réel",
        description: "L'accomplissement de challenges de croissance personnelle et votre forêt virtuelle peuvent avoir un réel impact sur votre bien-être physique, émotionnel, mental et spirituel."
    ),
    
    Onboarding(
        imageBelow: ImageBelow(height: 400, offsetX: -80, offsetY: 50, degree: -177.38),
        imageTop: ImageTop(name: "Onbording 5", height: 300, offsetY: -70),
        imageState: "State 2",
        headline: "Prêt(e) à grandir ?",
        description: "Votre aventure avec Challengo commence maintenant. Relevez le défi, grandissez chaque jour et voyez comment votre forêt et vous-même prospérez."
    )
]
