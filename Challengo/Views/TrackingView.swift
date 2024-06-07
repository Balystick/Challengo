//
//  TrackingView.swift
//  Challengo
//
//  Created by Aurélien on 04/06/2024.
//

import SwiftUI

struct TrackingView: View {
    @State private var segmentedSelection = 0
    @State private var navigateToStartView = false
    
    var body: some View {

        // Segmented section
        VStack {
            HStack {
               Button(action: {
                   navigateToStartView = true // Action pour retourner à la vue précédente (StartView)
               }) {
                   Image(systemName: "arrow.left")
                       .foregroundColor(Color.black)
                       .padding()
               }
               Spacer()
           }
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
        .navigationBarHidden(true)
        .navigationDestination(isPresented: $navigateToStartView) {
            StartView()
        }
    }
}

#Preview {
    TrackingView()
}
