//
//  TrackingWinFailExtractedView.swift
//  Challengo
//
//  Created by Aurélien on 04/06/2024.
//

import SwiftUI
import Charts

struct TrackingWinFailExtractedView: View {
    enum ChallengeType: String, CaseIterable {
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

    struct ChallengeData: Identifiable {
        let id: String = UUID().uuidString
        let date: String
        let month: Int
        let challengeType: ChallengeType
    }

    private var challengeData: [ChallengeData] = [
        .init(date: "Nov", month: 5, challengeType: .failed),
        .init(date: "Nov", month: 20, challengeType: .succeeded),
        .init(date: "Dec", month: 7, challengeType: .failed),
        .init(date: "Dec", month: 23, challengeType: .succeeded),
        .init(date: "Jan", month: 3, challengeType: .failed),
        .init(date: "Jan", month: 17, challengeType: .succeeded),
        .init(date: "Feb", month: 9, challengeType: .failed),
        .init(date: "Feb", month: 15, challengeType: .succeeded),
        .init(date: "Mar", month: 7, challengeType: .failed),
        .init(date: "Mar", month: 19, challengeType: .succeeded),
        .init(date: "Apr", month: 5, challengeType: .failed),
        .init(date: "Apr", month: 21, challengeType: .succeeded),
        .init(date: "May", month: 2, challengeType: .failed),
        .init(date: "May", month: 27, challengeType: .succeeded)
    ]

    var body: some View {
        Chart(challengeData) { item in
            BarMark(
                x: .value("Month", item.date),
                y: .value("Number", item.month),
                stacking: .standard
            )
            .annotation(position: .overlay, content: {
                VStack {
                    Text("\(item.month)")
                        .font(.system(size: 8, weight: .regular))
                        .foregroundStyle(.black)
                    Spacer()
                }
            })
            .foregroundStyle(item.challengeType.color)
            .foregroundStyle(by: .value("Nombre", item.challengeType.rawValue))
        }
        .chartLegend(position: .bottom, alignment: .leading, spacing: 24, content: {
            HStack(spacing: 6) {
                ForEach(ChallengeType.allCases, id: \.self) { type in
                    Circle()
                        .fill(type.color)
                        .frame(width: 8, height: 8)
                    Text(type.rawValue)
                        .font(.system(size: 11, weight: .medium))
                        .foregroundColor(type.color)
                }
            }
        })
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
