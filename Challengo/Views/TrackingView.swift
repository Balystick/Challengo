//
//  TrackingView.swift
//  Challengo
//
//  Created by Aurélien on 04/06/2024.
//

import SwiftUI

struct TrackingView: View {
    @State private var segmentedSelection = 0
    
    var body: some View {
        // Segmented section
        VStack {
            Picker("", selection: $segmentedSelection) {
                Text("CALENDAR").tag(0)
                Text("BALANCE").tag(1)
                Text("WIN / FAIL").tag(2)
            }
            .pickerStyle(.segmented)
            .colorMultiply(.raspberry)
            .padding(.bottom, 30)

            switch segmentedSelection {
            case 0:
                TrackingCalendarExtractedView()
            case 1:
                TrackingBalanceExtractedView()
            case 2:
                TrackingWinFailExtractedView()
            default:
                TrackingCalendarExtractedView()
            }
            Spacer()
        }
        .padding([.leading, .trailing], 10)

    }
}

#Preview {
    TrackingView()
}
