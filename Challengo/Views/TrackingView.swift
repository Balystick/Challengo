import SwiftUI
/**
 Cette vue  affiche les informations de suivi segmentées en trois catégories : Calendrier, Balance et Win/Fail.
 - Author: Aurélien
 - Date: 04/06/2024
 */
struct TrackingView: View {
    /// Variable d'état pour suivre le segment actuellement sélectionné dans le picker.
    @State private var segmentedSelection = 0
    /// Variable d'état pour gérer la navigation vers la vue de démarrage.
    @State private var navigateToStartView = false
    
    var body: some View {

        // Section segmentée
        VStack {
            HStack {
               Button(action: {
                   // Action pour retourner à la vue précédente (StartView)
                   navigateToStartView = true
               }) {
                   Image(systemName: "arrow.left")
                       .foregroundColor(Color.black)
                       .padding()
               }
               Spacer()
           }
            // Picker pour sélectionner Calendrier, Balance et Win/Fail
            Picker("", selection: $segmentedSelection) {
                Text("CALENDAR").tag(0)
                Text("BALANCE").tag(1)
                Text("WIN / FAIL").tag(2)
            }
            .pickerStyle(.segmented)
            .colorMultiply(.raspberry)
            .padding(.bottom, 30)
            
            // Affiche la vue correspondant au segment sélectionné
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
