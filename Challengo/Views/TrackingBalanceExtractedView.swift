import SwiftUI
import Charts

/**
 Cette vue affiche un graphique représentant la proportion de challenges accomplis dans les différentes catégorie. Une légende est inclue sous le graphique.
 
 `TrackingBalanceExtractedView` utilise un `Chart` avec `SectorMark`.

 - Auteur: Aurélien
 - Date: 04/06/2024
 */
struct TrackingBalanceExtractedView: View {
    /// Les nombres de challenges accomplis par catégories à afficher dans le graphique.
    @State private var balanceChallengeCatV = balanceChallengeCat
    
    var body: some View {
        // Affiche un graphique en secteurs montrant les challenges accomplis par catégorie
        Chart(balanceChallengeCatV) { Category in
            SectorMark(
                angle: .value(
                    Text(verbatim: Category.title),
                    Category.number
                ),
                innerRadius: .ratio(0.6),
                angularInset: 2
            )
            .foregroundStyle(
                by: .value(
                    Text(verbatim: Category.title),
                    Category.title
                )
            )
        }
        // Ajoute une légende sous le graphique
        .chartLegend(position: .bottom, alignment: .center)
        // Ajoute un arrière-plan au graphique avec du texte au centre
        .chartBackground { chartProxy in
            GeometryReader { geometry in
                if let anchor = chartProxy.plotFrame {
                    let frame = geometry[anchor]
                    VStack {
                        Text("&nbsp;&nbsp;Challenges\naccomplis par\n&nbsp;&nbsp;&nbsp;catégorie")
                            .font(.subheadline)
                            .position(x: frame.midX, y: frame.midY)
                    }
                }
            }
        }
        Spacer()
    }

}

#Preview {
    TrackingBalanceExtractedView()
}
