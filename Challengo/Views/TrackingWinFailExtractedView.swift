import SwiftUI
import Charts
/**
 Cette vue affiche un graphique représentant le suivi des réussites et des échecs des challenges par mois.

 `TrackingWinFailExtractedView` utilise un `Chart` pour montrer les réussites et les échecs des challenges avec `BarMark`. Une légende est inclue sous le graphique qui comporte également
 Le graphique inclut des légendes en bas ainsi que pour chaque barre.

 - Auteur: Aurélien
 - Date: 04/06/2024
 */
struct TrackingWinFailExtractedView: View {
    /// Les données de réussite/échec des challenges à afficher dans le graphique.
    private var winFailChallengeDatasV = winFailChallengeDatas

    var body: some View {
        // BarMark pour afficher les données de réussite/échec par mois
        Chart(winFailChallengeDatasV) { item in
            BarMark(
                x: .value("Month", item.month),
                y: .value("Number", item.number),
                stacking: .standard
            )
            // Annotation pour afficher le mois au-dessous de chaque barre
            .annotation(position: .overlay, content: {
                VStack {
                    Text("\(item.month)")
                        .font(.system(size: 8, weight: .regular))
                        .foregroundStyle(.black)
                    Spacer()
                }
            })
            // Style de la barre selon le statut du challenge
            .foregroundStyle(item.ChallengeStatus.color)
            .foregroundStyle(by: .value("Nombre", item.ChallengeStatus.rawValue))
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
