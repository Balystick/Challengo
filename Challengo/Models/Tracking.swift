import SwiftUI

/**
 Cette enum représente les différentes catégories de challenges.
 
 Chaque catégorie est associée à son nom.
 */
enum ChallengeCategory: String, CaseIterable {
    case existentialCourage = "Courage existentiel"
    case opennessToExperience = "Ouverture à l'expérience et au changement"
    case selfCompassion = "Compassion pour soi"
    case autonomy = "Autonomie"
    case selfAwareness = "Conscience de soi"
    case compassionForOthers = "Compassion pour les autres"
    case selfResponsibility = "Responsabilité de soi"
}

/**
 Cette enum représente le statut des challenges.
 
 Chaque statut est associé à un titre dans la légende et à une couleur (verte/rouge).
 */
enum ChallengeStatus: String, CaseIterable {
    case succeeded = "Challenges réussis"
    case failed = "Challenges échoués"
    /// Couleur associée au statut du challenge.
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
 Classe représentant un challenge avec ses propriétés de suivi.
 */
class TrackingChallenge {
    /// Identifiant unique du challenge.
    let id: UUID
    /// Catégorie du challenge.
    let category: ChallengeCategory
    /// Date du challenge sous forme de chaîne.
    let date: String
    /// Statut du challenge.
    let status: ChallengeStatus
    /**
     Initialise un nouveau challenge de suivi.
     
     - Parameters:
     - id: Identifiant unique du challenge.
     - category: Catégorie du challenge.
     - date: Date du challenge sous forme de String.
     - status: Statut du challenge.
     */
    init(id: UUID = UUID(), category: ChallengeCategory, date: String, status: ChallengeStatus) {
        self.id = id
        self.category = category
        self.date = date
        self.status = status
    }
}

/**
 Classe contenant des outils pour le suivi des challenges.
 */
class TrackingTools {
    /**
     Cette méthode retourne le nom du mois correspondant à un numéro de mois donné.
     
     - Parameter date: Numéro du mois (1 pour janvier, 2 pour février, etc.).
     - Returns: Nom du mois correspondant en chaîne de caractères.
     */
    static func monthName(date: Int) -> String {
        let monthNames = ["Jan", "Fev", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        return monthNames[date-1]
    }
    
    /**
     Cette méthode extrait le numéro du mois à partir d'une date donnée.
     
     - Parameter date: Date sous forme de chaîne de caractères (format "yyyy-mm-ddThh-mm").
     - Returns: Numéro du mois extrait de la date.
     */
    static func dateToMonth(date: String) -> Int {
        let start = date.index(date.startIndex, offsetBy: 5)
        let end = date.index(date.startIndex, offsetBy: 7)
        return Int(String(date[start..<end])) ?? 0
    }
    
    /**
     Cette méthode calcule le nombre de challenges pour un mois donné selon un statut spécifique.
     
     - Parameters:
     - trackingChallenges: Liste des challenges suivis.
     - month: Numéro du mois.
     - status: Statut des challenges à compter.
     - Returns: Nombre de challenges correspondant aux critères.
     */
    static func statusCount(trackingChallenges: [TrackingChallenge], month: Int, status: ChallengeStatus) -> Int {
        var statusCount: Int = 0
        for challenge in trackingChallenges {
            if dateToMonth(date: challenge.date) == month {
                if challenge.status == status {
                    statusCount += 1
                }
            }
        }
        return statusCount
    }
    
    /**
     Cette méthode construit le tableau du nombre de challenges réussis et échoués par mois.
     
     - Parameter trackingChallenges: Liste des challenges suivis.
     - Returns: Tableau des données de réussites et d'échecs des challenges par mois.
     */
    static func buildWinFailChallengeData(trackingChallenges: [TrackingChallenge]) -> [WinFailChallengeData] {
        var winFailChallengeData: [WinFailChallengeData] = []
        for i in 1...12 {
            let succeededCount = statusCount(trackingChallenges: trackingChallenges, month: i, status: .succeeded)
            let failedCount = statusCount(trackingChallenges: trackingChallenges, month: i, status: .failed)
            
            if succeededCount > 0 {
                winFailChallengeData.append(WinFailChallengeData(month: monthName(date: i), number: succeededCount, challengeStatus: .succeeded))
            }
            if failedCount > 0 {
                winFailChallengeData.append(WinFailChallengeData(month: monthName(date: i), number: failedCount, challengeStatus: .failed))
            }
        }
        return winFailChallengeData
    }
    
    /**
     Cette méthode construit le tableau du nombre de challenges accomplis par catégorie.
     
     - Parameter [trackingChallenges]: Tableau des challenges accomplis.
     - Returns: Tableau du nombre de challenges accomplis par catégorie.
     */
    static func buildBalanceChallengeCat(trackingChallenges: [TrackingChallenge]) -> [BalanceChallengeCategory] {
        var balanceChallengeCat: [BalanceChallengeCategory] = []
        for category in ChallengeCategory.allCases {
            var challengeCount: Int = 0
            for challenge in trackingChallenges {
                if challenge.category == category {
                    challengeCount += 1
                }
            }
            balanceChallengeCat.append(BalanceChallengeCategory(title: String(category.rawValue), number: challengeCount))
        }
        return balanceChallengeCat
    }
}
/**
 Cette structure représente le nombre de challenges accomplis dans une catégorie
 */
struct BalanceChallengeCategory: Identifiable {
    var id = UUID()
    var title: String
    var number: Int
}
/**
 Cette structure représente le nombre de challenges réussis et échoués par mois.
 */
struct WinFailChallengeData: Identifiable {
    var id = UUID()
    var month: String
    var number: Int
    var challengeStatus: ChallengeStatus
}
