//
//  TrackingCalendarExtractedView.swift
//  Challengo
//
//  Created by Haiying on 04/06/2024.
//

import SwiftUI

struct TrackingCalendarExtractedView: View {
    @State private var date = Date()
    @State private var completedDates: [Date] = [Date]() // Les dates accomplies
//    @State private var navigateToStartView = false
    
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: 2024, month: 6, day: 10)
        let endComponents = DateComponents(year: 2024, month: 6, day: 30, hour: 23, minute: 59, second: 59)
        return calendar.date(from:startComponents)!
        ...
        calendar.date(from:endComponents)!
    }()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                HStack {
                    Button(action: {
                        changeMonth(by: -1)
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(Color.colorGreenDark)
                            .padding()
                    }
                    Spacer()
                    Text(monthAndYear(from: date))
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.colorGreenDark)
                    Spacer()
                    Button(action: {
                        changeMonth(by: 1)
                    }) {
                        Image(systemName: "chevron.right")
                            .foregroundColor(Color.colorGreenDark)
                            .padding()
                    }
                }
                CustomDatePicker(
                    selection: $date,
                    dateRange: dateRange,
                    completedDates: completedDates
                )
                .padding()
                .accentColor(.colorGreenDark)
                Spacer()
            }
            .navigationBarHidden(true)
        }
    }
    
    private func monthAndYear(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM yyyy"
        return dateFormatter.string(from: date)
    }
    
    private func changeMonth(by value: Int) {
        if let newDate = Calendar.current.date(byAdding: .month, value: value, to: date) {
            date = newDate
        }
    }
}

struct CustomDatePicker: View {
    @Binding var selection: Date
    let dateRange: ClosedRange<Date>
    let completedDates: [Date]
    
    var body: some View {
        DatePicker(
            "",
            selection: $selection,
            in: dateRange,
            displayedComponents: [.date]
        )
        .datePickerStyle(.graphical)
        .labelsHidden() // Masquer les étiquettes par défaut
        .foregroundColor(.white)
        .background(
            RoundedRectangle(cornerRadius: 5)
                .fill(backgroundColor(for: selection))
        )
        .onChange(of: selection) { newDate, _ in
            // Mettre à jour la couleur de fond en fonction de la nouvelle date sélectionnée
        }
    }
    
    private func backgroundColor(for date: Date) -> Color {
        if completedDates.contains(date) {
            return Color.colorGreenDark
        } else {
            return .clear
        }
    }
}


#Preview {
    TrackingCalendarExtractedView()
}
