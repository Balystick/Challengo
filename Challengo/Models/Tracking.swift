import SwiftUI

// TrackingCalendar


/**
 Documentation de la structure balanceChallengeCategory
 
 Cette structure représente une catégorie de challenges avec un titre et le number de challenges accomplis associé.

 - Auteur: Aurélien
 - month: 26/06/2024
 */
struct balanceChallengeCategory: Identifiable {
    /// Identifiant unique de la catégorie de challenge.
    let id = UUID()
    /// Titre de la catégorie.
    let title: String
    /// number de challenges accomplis.
    let number: Int
}

/// Les données de catégories de challenge à afficher dans l'application.
var balanceChallengeCat: [balanceChallengeCategory] = [
    balanceChallengeCategory(title: "Courage existentiel", number: 53),
    balanceChallengeCategory(title: "Ouverture à l”expérience et au changement", number: 37),
    balanceChallengeCategory(title: "Compassion pour soi", number: 28),
    balanceChallengeCategory(title: "Autonomie", number: 9),
    balanceChallengeCategory(title: "Conscience de soi", number: 17),
    balanceChallengeCategory(title: "Compassion pour les autres", number: 13),
    balanceChallengeCategory(title: "Responsabilité de soi", number: 53)
]

/**
 Documentation de l'énumération ChallengeStatus
 
 Cette énumération représente le statut des challenges accomplis (réussi / échoué) avec les couleurs associées (vert / rouge).

 - Auteur: Aurélien
 - month: 26/06/2024
 */
enum ChallengeStatus: String, CaseIterable {
    /// Défi réussi.
    case succeeded = "Challenges réussis"
    /// Défi échoué.
    case failed = "Challenges échoués"
    /// Couleur associée au statut des défis.
    var color: Color {
        switch self {
        case .succeeded:
            return .green
        case .failed:
            return .red
        }
    }
}

/**
 Documentation de la structure winFailChallengeData
 
 Cette structure représentant les données des challenges accomplis avec le nom du mois, le number de challenges accomplis et le statut des challenges accomplis.

 - Auteur: Aurélien
 - month: 26/06/2024
 */
struct winFailChallengeData: Identifiable {
    /// Identifiant unique du défi.
    let id: String = UUID().uuidString
    /// Nom du mois.
    let month: String
    /// number de challenges.
    let number: Int
    /// Statut des défis.
    let ChallengeStatus: ChallengeStatus
}

    /// Les données de suivi des défis à afficher dans l'application.
var winFailChallengeDatas: [winFailChallengeData] = [
    winFailChallengeData(month: "Nov", number: 5, ChallengeStatus: .failed),
    winFailChallengeData(month: "Nov", number: 20, ChallengeStatus: .succeeded),
    winFailChallengeData(month: "Dec", number: 7, ChallengeStatus: .failed),
    winFailChallengeData(month: "Dec", number: 23, ChallengeStatus: .succeeded),
    winFailChallengeData(month: "Jan", number: 3, ChallengeStatus: .failed),
    winFailChallengeData(month: "Jan", number: 17, ChallengeStatus: .succeeded),
    winFailChallengeData(month: "Feb", number: 9, ChallengeStatus: .failed),
    winFailChallengeData(month: "Feb", number: 15, ChallengeStatus: .succeeded),
    winFailChallengeData(month: "Mar", number: 7, ChallengeStatus: .failed),
    winFailChallengeData(month: "Mar", number: 19, ChallengeStatus: .succeeded),
    winFailChallengeData(month: "Apr", number: 5, ChallengeStatus: .failed),
    winFailChallengeData(month: "Apr", number: 21, ChallengeStatus: .succeeded),
    winFailChallengeData(month: "May", number: 2, ChallengeStatus: .failed),
    winFailChallengeData(month: "May", number: 27, ChallengeStatus: .succeeded)
]
