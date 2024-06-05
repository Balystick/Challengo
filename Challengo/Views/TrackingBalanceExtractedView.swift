//
//  TrackingBalanceExtractedView.swift
//  Challengo
//
//  Created by Apprenant 143 on 04/06/2024.
//

import SwiftUI
import Charts

struct Category: Identifiable {
    let id = UUID()
    let title: String
    let number: Int
}

struct TrackingBalanceExtractedView: View {
    @State private var category: [Category] = [
        .init(title: "Courage existentiel", number: 53),
        .init(title: "Ouverture à l”expérience et au changement          ", number: 37),
        .init(title: "Compassion pour soi", number: 28),
        .init(title: "Autonomie", number: 9),
        .init(title: "Conscience de soi", number: 17),
        .init(title: "Compassion pour les autres", number: 13),
        .init(title: "Responsabilité de soi", number: 23),
    ]
    
    var body: some View {
        Chart(category) { Category in
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
        .chartLegend(position: .bottom, alignment: .center)
        .chartBackground { chartProxy in
            GeometryReader { geometry in
                if let anchor = chartProxy.plotFrame {
                    let frame = geometry[anchor]
                    VStack {
                        Text("&nbsp;&nbsp;Challenges\naccomplis par\n&nbsp;&nbsp;&nbsp;catégorie")
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
