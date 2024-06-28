import SwiftUI

enum ChallengeCategory: String, CaseIterable {
    case existentialCourage = "Courage existentiel"
    case opennessToExperience = "Ouverture à l'expérience et au changement"
    case selfCompassion = "Compassion pour soi"
    case autonomy = "Autonomie"
    case selfAwareness = "Conscience de soi"
    case compassionForOthers = "Compassion pour les autres"
    case selfResponsibility = "Responsabilité de soi"
}

enum ChallengeStatus: String, CaseIterable {
    case succeeded = "Challenges réussis"
    case failed = "Challenges échoués"
    var color: Color {
        switch self {
        case .succeeded:
            return .green
        case .failed:
            return .red
        }
    }
}

class TrackingChallenge {
    var id: UUID
    var category: ChallengeCategory
    var date: String
    var status: ChallengeStatus
    
    init(id: UUID = UUID(), category: ChallengeCategory, date: String, status: ChallengeStatus) {
        self.id = id
        self.category = category
        self.date = date
        self.status = status
    }
}

class TrackingTools {
    // Fonction pour obtenir le nom du mois à partir d'une date
    static func monthName(date: Int) -> String {
        let monthNames = ["Jan", "Fev", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        return monthNames[date-1]
    }
    // Fonction pour extraire le nom du mois d'une date
    static func dateToMonth(date: String) -> Int {
        let start = date.index(date.startIndex, offsetBy: 5)
        let end = date.index(date.startIndex, offsetBy: 7)
        return (Int(String(date[start..<end]))!) //Déballage forcé ?
    }
    
    // Calcul du nombre de Challenges par mois selon le statut
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
    
    // Construction du tableau winFailChallengeData
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
    
    // Construction du tableau balanceChallengeCat
    static func buildBalanceChallengeCat(trackingChallenges: [TrackingChallenge]) -> [BalanceChallengeCategory] {
        var balanceChallengeCat: [BalanceChallengeCategory] = []
        var challengeCount: Int = 0
        for category in ChallengeCategory.allCases {
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

struct BalanceChallengeCategory: Identifiable {
    var id = UUID()
    var title: String
    var number: Int
}

struct WinFailChallengeData: Identifiable {
    var id = UUID()
    var month: String
    var number: Int
    var challengeStatus: ChallengeStatus
}


let trackingChallenges: [TrackingChallenge] = [
    TrackingChallenge(category: .compassionForOthers, date: "2024-01-02T00-00", status: .failed),
    TrackingChallenge(category: .existentialCourage, date: "2024-01-03T00-00", status: .failed),
    TrackingChallenge(category: .selfAwareness, date: "2024-01-04T00-00", status: .failed),
    TrackingChallenge(category: .existentialCourage, date: "2024-01-05T00-00", status: .succeeded),
    TrackingChallenge(category: .opennessToExperience, date: "2024-01-06T00-00", status: .failed),
    TrackingChallenge(category: .compassionForOthers, date: "2024-01-07T00-00", status: .failed),
    TrackingChallenge(category: .selfCompassion, date: "2024-01-08T00-00", status: .failed),
    TrackingChallenge(category: .selfAwareness, date: "2024-01-09T00-00", status: .succeeded),
    TrackingChallenge(category: .existentialCourage, date: "2024-01-10T00-00", status: .succeeded),
    TrackingChallenge(category: .selfAwareness, date: "2024-01-11T00-00", status: .failed),
    TrackingChallenge(category: .autonomy, date: "2024-01-12T00-00", status: .succeeded),
    TrackingChallenge(category: .existentialCourage, date: "2024-01-13T00-00", status: .succeeded),
    TrackingChallenge(category: .existentialCourage, date: "2024-01-14T00-00", status: .failed),
    TrackingChallenge(category: .compassionForOthers, date: "2024-01-15T00-00", status: .succeeded),
    TrackingChallenge(category: .selfCompassion, date: "2024-01-16T00-00", status: .succeeded),
    TrackingChallenge(category: .autonomy, date: "2024-01-17T00-00", status: .succeeded),
    TrackingChallenge(category: .selfAwareness, date: "2024-01-18T00-00", status: .failed),
    TrackingChallenge(category: .selfResponsibility, date: "2024-01-19T00-00", status: .failed),
    TrackingChallenge(category: .opennessToExperience, date: "2024-01-20T00-00", status: .failed),
    TrackingChallenge(category: .compassionForOthers, date: "2024-01-21T00-00", status: .succeeded),
    TrackingChallenge(category: .selfAwareness, date: "2024-01-22T00-00", status: .succeeded),
    TrackingChallenge(category: .selfAwareness, date: "2024-01-23T00-00", status: .succeeded),
    TrackingChallenge(category: .opennessToExperience, date: "2024-01-24T00-00", status: .succeeded),
    TrackingChallenge(category: .opennessToExperience, date: "2024-01-25T00-00", status: .failed),
    TrackingChallenge(category: .selfResponsibility, date: "2024-01-26T00-00", status: .failed),
    TrackingChallenge(category: .selfCompassion, date: "2024-01-27T00-00", status: .failed),
    TrackingChallenge(category: .selfAwareness, date: "2024-01-28T00-00", status: .succeeded),
    TrackingChallenge(category: .existentialCourage, date: "2024-01-29T00-00", status: .succeeded),
    TrackingChallenge(category: .autonomy, date: "2024-01-30T00-00", status: .failed),
    TrackingChallenge(category: .existentialCourage, date: "2024-01-31T00-00", status: .failed),
    TrackingChallenge(category: .selfResponsibility, date: "2024-02-01T00-00", status: .failed),
    TrackingChallenge(category: .compassionForOthers, date: "2024-02-02T00-00", status: .failed),
    TrackingChallenge(category: .selfCompassion, date: "2024-02-03T00-00", status: .succeeded),
    TrackingChallenge(category: .opennessToExperience, date: "2024-02-04T00-00", status: .succeeded),
    TrackingChallenge(category: .selfAwareness, date: "2024-02-05T00-00", status: .succeeded),
    TrackingChallenge(category: .selfAwareness, date: "2024-02-06T00-00", status: .failed),
    TrackingChallenge(category: .selfCompassion, date: "2024-02-07T00-00", status: .succeeded),
    TrackingChallenge(category: .opennessToExperience, date: "2024-02-08T00-00", status: .failed),
    TrackingChallenge(category: .opennessToExperience, date: "2024-02-09T00-00", status: .succeeded),
    TrackingChallenge(category: .opennessToExperience, date: "2024-02-10T00-00", status: .failed),
    TrackingChallenge(category: .existentialCourage, date: "2024-02-11T00-00", status: .failed),
    TrackingChallenge(category: .compassionForOthers, date: "2024-02-12T00-00", status: .failed),
    TrackingChallenge(category: .selfCompassion, date: "2024-02-13T00-00", status: .succeeded),
    TrackingChallenge(category: .autonomy, date: "2024-02-14T00-00", status: .succeeded),
    TrackingChallenge(category: .compassionForOthers, date: "2024-02-15T00-00", status: .failed),
    TrackingChallenge(category: .selfCompassion, date: "2024-02-16T00-00", status: .failed),
    TrackingChallenge(category: .selfAwareness, date: "2024-02-17T00-00", status: .succeeded),
    TrackingChallenge(category: .existentialCourage, date: "2024-02-18T00-00", status: .failed),
    TrackingChallenge(category: .compassionForOthers, date: "2024-02-19T00-00", status: .succeeded),
    TrackingChallenge(category: .selfCompassion, date: "2024-02-20T00-00", status: .failed),
    TrackingChallenge(category: .selfResponsibility, date: "2024-02-21T00-00", status: .failed),
    TrackingChallenge(category: .existentialCourage, date: "2024-02-22T00-00", status: .failed),
    TrackingChallenge(category: .autonomy, date: "2024-02-23T00-00", status: .failed),
    TrackingChallenge(category: .autonomy, date: "2024-02-24T00-00", status: .failed),
    TrackingChallenge(category: .autonomy, date: "2024-02-25T00-00", status: .succeeded),
    TrackingChallenge(category: .opennessToExperience, date: "2024-02-26T00-00", status: .failed),
    TrackingChallenge(category: .existentialCourage, date: "2024-02-27T00-00", status: .succeeded),
    TrackingChallenge(category: .autonomy, date: "2024-02-28T00-00", status: .failed),
    TrackingChallenge(category: .autonomy, date: "2024-02-29T00-00", status: .succeeded),
    TrackingChallenge(category: .existentialCourage, date: "2024-03-01T00-00", status: .failed),
    TrackingChallenge(category: .compassionForOthers, date: "2024-03-02T00-00", status: .succeeded),
    TrackingChallenge(category: .selfAwareness, date: "2024-03-03T00-00", status: .failed),
    TrackingChallenge(category: .autonomy, date: "2024-03-04T00-00", status: .failed),
    TrackingChallenge(category: .autonomy, date: "2024-03-05T00-00", status: .succeeded),
    TrackingChallenge(category: .selfCompassion, date: "2024-03-06T00-00", status: .failed),
    TrackingChallenge(category: .existentialCourage, date: "2024-03-07T00-00", status: .failed),
    TrackingChallenge(category: .opennessToExperience, date: "2024-03-08T00-00", status: .succeeded),
    TrackingChallenge(category: .selfAwareness, date: "2024-03-09T00-00", status: .succeeded),
    TrackingChallenge(category: .opennessToExperience, date: "2024-03-10T00-00", status: .succeeded),
    TrackingChallenge(category: .autonomy, date: "2024-03-11T00-00", status: .succeeded),
    TrackingChallenge(category: .compassionForOthers, date: "2024-03-12T00-00", status: .succeeded),
    TrackingChallenge(category: .autonomy, date: "2024-03-13T00-00", status: .succeeded),
    TrackingChallenge(category: .selfAwareness, date: "2024-03-14T00-00", status: .failed),
    TrackingChallenge(category: .selfResponsibility, date: "2024-03-15T00-00", status: .failed),
    TrackingChallenge(category: .selfResponsibility, date: "2024-03-16T00-00", status: .failed),
    TrackingChallenge(category: .opennessToExperience, date: "2024-03-17T00-00", status: .failed),
    TrackingChallenge(category: .selfCompassion, date: "2024-03-18T00-00", status: .failed),
    TrackingChallenge(category: .selfAwareness, date: "2024-03-19T00-00", status: .succeeded),
    TrackingChallenge(category: .selfResponsibility, date: "2024-03-20T00-00", status: .failed),
    TrackingChallenge(category: .selfAwareness, date: "2024-03-21T00-00", status: .failed),
    TrackingChallenge(category: .compassionForOthers, date: "2024-03-22T00-00", status: .succeeded),
    TrackingChallenge(category: .opennessToExperience, date: "2024-03-23T00-00", status: .failed),
    TrackingChallenge(category: .autonomy, date: "2024-03-24T00-00", status: .succeeded),
    TrackingChallenge(category: .compassionForOthers, date: "2024-03-25T00-00", status: .failed),
    TrackingChallenge(category: .autonomy, date: "2024-03-26T00-00", status: .failed),
    TrackingChallenge(category: .existentialCourage, date: "2024-03-27T00-00", status: .succeeded),
    TrackingChallenge(category: .selfAwareness, date: "2024-03-28T00-00", status: .succeeded),
    TrackingChallenge(category: .compassionForOthers, date: "2024-03-29T00-00", status: .succeeded),
    TrackingChallenge(category: .compassionForOthers, date: "2024-03-30T00-00", status: .succeeded),
    TrackingChallenge(category: .selfResponsibility, date: "2024-03-31T00-00", status: .succeeded),
    TrackingChallenge(category: .selfCompassion, date: "2024-04-01T00-00", status: .succeeded),
    TrackingChallenge(category: .existentialCourage, date: "2024-04-02T00-00", status: .failed),
    TrackingChallenge(category: .selfCompassion, date: "2024-04-03T00-00", status: .succeeded),
    TrackingChallenge(category: .selfResponsibility, date: "2024-04-04T00-00", status: .failed),
    TrackingChallenge(category: .autonomy, date: "2024-04-05T00-00", status: .failed),
    TrackingChallenge(category: .selfAwareness, date: "2024-04-06T00-00", status: .succeeded),
    TrackingChallenge(category: .selfAwareness, date: "2024-04-07T00-00", status: .failed),
    TrackingChallenge(category: .autonomy, date: "2024-04-08T00-00", status: .succeeded),
    TrackingChallenge(category: .existentialCourage, date: "2024-04-09T00-00", status: .failed),
    TrackingChallenge(category: .autonomy, date: "2024-04-10T00-00", status: .succeeded)]

let winFailChallengeDatas = TrackingTools.buildWinFailChallengeData(trackingChallenges: trackingChallenges)

let balanceChallengeCat = TrackingTools.buildBalanceChallengeCat(trackingChallenges: trackingChallenges)




