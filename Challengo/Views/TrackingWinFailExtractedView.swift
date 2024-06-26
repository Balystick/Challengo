import SwiftUI
import Charts
/**
 Cette vue affiche un graphique représentant le suivi des réussites et des échecs des challenges par mois.  Le graphique inclut une légende ainsi que des annotations pour chaque barre.

 `TrackingWinFailExtractedView` utilise un `Chart` avec `BarMark`.

 - Auteur: Aurélien
 - Date: 04/06/2024
 */
struct TrackingWinFailExtractedView: View {
    /// Les données de réussite/échec des challenges à afficher dans le graphique.
    private var winFailChallengeDatasV = winFailChallengeDatas

    var body: some View {
//        Text(String(winFailChallengeDatas[0].ChallengeStatus.color))
        // BarMark pour afficher les données de réussite/échec par mois
        Chart(winFailChallengeDatas) { item in
            BarMark(
                x: .value("Month", item.month),
                y: .value("Number", item.number),
                stacking: .standard
            )
            // Style de la barre selon le statut du challenge
            .foregroundStyle(item.challengeStatus.color)
            .foregroundStyle(by: .value("Nombre", item.challengeStatus.rawValue))
        }
        // Ajoute une légende sous le graphique
        .chartLegend(position: .bottom, alignment: .leading, spacing: 24, content: {
            HStack(spacing: 6) {
                ForEach(ChallengeStatus.allCases, id: \.self) { type in
                    Circle()
                        .fill(type.color)
                        .frame(width: 8, height: 8)
                    Text(type.rawValue)
                        .font(.system(size: 11, weight: .medium))
                        .foregroundColor(type.color)
                }
            }
        })
        // Personnalisation de l'axe Y du graphique
        .chartYAxis {
            AxisMarks(preset: .extended, position: .leading, values: .automatic(desiredCount: 31))
        }
        .chartYAxisLabel("Nombre")
        .frame(height: 600)
    }
}

struct TrackingWinFailExtractedView_Previews: PreviewProvider {
    static var previews: some View {
        TrackingWinFailExtractedView()
            .padding()
    }
}
