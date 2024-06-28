//
//  TrackingCalendarExtractedView.swift
//  Challengo
//
//  Created by Haiying on 04/06/2024.
//

import SwiftUI

/// Cette vue représente un calendrier de suivi des défis avec la possibilité de naviguer entre les mois.
///
/// Cette vue affiche les jours du mois courant ainsi que les jours de défis réussis et non réussis.
struct TrackingCalendarExtractedView: View {
    /// L'année actuellement affichée dans le calendrier.
    @State private var currentYear: Int = 2024
    /// Le mois actuellement affiché dans le calendrier.
    @State private var currentMonth: Int = 6
    
    /// Les dates des défis réussis.
    let successfulChallenges: [Date] = [
        getDate(year: 2024, month: 6, day: 1),
        getDate(year: 2024, month: 6, day: 5),
        getDate(year: 2024, month: 6, day: 6)
    ]

    /// Les dates des défis échoués
    let unsuccessfulChallenges: [Date] = [
        getDate(year: 2024, month: 5, day: 28),
        getDate(year: 2024, month: 5, day: 31),
        getDate(year: 2024, month: 6, day: 4)
    ]
    
    var body: some View {
         VStack {
            VStack {
                HStack {
                    Button(action: {
                        previousMonth()
                    }) {
                        Image(systemName: "arrow.left")
                            .foregroundColor(Color("ColorGreenDark"))
                    }
                    Text("\(monthName) \(currentYear)")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(Color("ColorGreenDark"))
                        .padding(.horizontal, 40)
                    Button(action: {
                        nextMonth()
                    }) {
                        Image(systemName: "arrow.right")
                            .foregroundColor(Color("ColorGreenDark"))
                    }
                }
                Spacer().frame(height: 40)
                HStack {
                    Text("LU")
                    Spacer().frame(width: 26)
                    Text("MA")
                    Spacer().frame(width: 26)
                    Text("ME")
                    Spacer().frame(width: 26)
                    Text("JE")
                    Spacer().frame(width: 26)
                    Text("VE")
                    Spacer().frame(width: 26)
                    Text("SA")
                    Spacer().frame(width: 26)
                    Text("DI")
                }
                .padding([.top, .bottom], 5)
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7)) {
                    ForEach(getAllDaysWithPadding(year: currentYear, month: currentMonth), id: \.self) { date in
                        CalendarDayView(date: date,
                                        successfulChallenges: successfulChallenges,
                                        unsuccessfulChallenges: unsuccessfulChallenges)
                    }
                }
            }
            .padding()
            .background(Color.white)
            .shadow(color: Color.black.opacity(0.1), radius: 2, x: 2, y: 2)
        }
        .padding()
    }
    /// Retourne le nom du mois actuel.
    var monthName: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        let date = TrackingCalendarExtractedView.getDate(year: currentYear, month: currentMonth, day: 1)
        return dateFormatter.string(from: date)
    }
    
    /// Retourne tous les jours du mois avec les jours de la semaine précédents ajoutés pour compléter la première semaine.
    ///
    /// - Parameters:
    ///   - year: L'année du mois à récupérer.
    ///   - month: Le mois à récupérer.
    /// - Returns: Une liste de dates avec les jours précédents ajoutés pour compléter la première semaine.
    func getAllDaysWithPadding(year: Int, month: Int) -> [Date] {
        var dates: [Date] = []
        let calendar = Calendar.current
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        guard let startDate = dateFormatter.date(from: "\(year)-\(month)-01"),
              let range = calendar.range(of: .day, in: .month, for: startDate) else {
            return dates
        }
        let startDayOfWeek = calendar.component(.weekday, from: startDate) - calendar.firstWeekday
        let paddedStartDate = calendar.date(byAdding: .day, value: -startDayOfWeek, to: startDate)!
        var currentDate = paddedStartDate
        while currentDate < startDate {
            dates.append(currentDate)
            currentDate = calendar.date(byAdding: .day, value: 1, to: currentDate)!
        }
        dates.append(contentsOf: range.map { day -> Date in
            return calendar.date(byAdding: .day, value: day - 1, to: startDate)!
        })
        currentDate = calendar.date(byAdding: .day, value: range.count, to: startDate)!
        while dates.count % 7 != 0 {
            dates.append(currentDate)
            currentDate = calendar.date(byAdding: .day, value: 1, to: currentDate)!
        }

        return dates
    }
    
    /// Passe au mois précédent dans le calendrier.
    func previousMonth() {
        if currentMonth == 1 {
            currentMonth = 12
            currentYear -= 1
        } else {
            currentMonth -= 1
        }
    }
    
    /// Passe au mois suivant dans le calendrier.
    func nextMonth() {
        if currentMonth == 12 {
            currentMonth = 1
            currentYear += 1
        } else {
            currentMonth += 1
        }
    }
    
    /// Crée une date à partir des paramètres spécifiés.
    ///
    /// - Parameters:
    ///   - year: L'année de la date.
    ///   - month: Le mois de la date.
    ///   - day: Le jour de la date.
    /// - Returns: Une instance de `Date` correspondant aux paramètres.
    static func getDate(year: Int, month: Int, day: Int) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.date(from: "\(year)-\(month)-\(day)")!
    }
}

/// Une vue représentant un jour dans le calendrier.
///
/// Cette vue affiche un jour avec différentes couleurs de fond et de texte en fonction des défis réussis ou non réussis.
///
/// - Parameters:
///   - date: La date à afficher.
///   - successfulChallenges: Les dates des défis réussis.
///   - unsuccessfulChallenges: Les dates des défis non réussis.
struct CalendarDayView: View {
    let date: Date
    let successfulChallenges: [Date]
    let unsuccessfulChallenges: [Date]
    
    var body: some View {
        let day = Calendar.current.component(.day, from: date)
        let isCurrentMonth = Calendar.current.component(.month, from: date) == Calendar.current.component(.month, from: Date())
        let isToday = Calendar.current.isDateInToday(date)
        
        if day == 0 {
                    Color.clear.frame(width: 40, height: 40)
                } else {
                    let accentShape: AnyShape = isToday ? AnyShape(RoundedRectangle(cornerRadius: 10)) : AnyShape(Circle())
                    Text("\(day)")
                        .frame(width: 40, height: 40)
                        .background(backgroundColor(for: date, isToday: isToday))
                        .clipShape(accentShape)
                        .padding(2)
                        .foregroundColor(foregroundColor(for: date, isCurrentMonth: isCurrentMonth, isToday: isToday))
                }
            }
    
    /// Retourne la couleur de fond pour une date donnée.
    ///
    /// - Parameters:
    ///   - date: La date à vérifier.
    ///   - isToday: Booléen indiquant si la date est aujourd'hui.
    /// - Returns: La couleur de fond appropriée.
    func backgroundColor(for date: Date, isToday: Bool) -> Color {
        if isToday {
            return Color.colorGreenLight
        } else if successfulChallenges.contains(where: { Calendar.current.isDate($0, inSameDayAs: date) }) {
            return Color.colorGreenDark
        } else if unsuccessfulChallenges.contains(where: { Calendar.current.isDate($0, inSameDayAs: date) }) {
            return Color.colorRose
        } else {
            return Color.clear
        }
    }
    
    /// Retourne la couleur de texte pour une date donnée.
    ///
    /// - Parameters:
    ///   - date: La date à vérifier.
    ///   - isCurrentMonth: Booléen indiquant si la date appartient au mois actuel.
    ///   - isToday: Booléen indiquant si la date est aujourd'hui.
    /// - Returns: La couleur de texte appropriée.
    func foregroundColor(for date: Date, isCurrentMonth: Bool, isToday: Bool) -> Color {
        if isToday {
            return Color.black
        } else if successfulChallenges.contains(where: { Calendar.current.isDate($0, inSameDayAs: date) }) ||
                  unsuccessfulChallenges.contains(where: { Calendar.current.isDate($0, inSameDayAs: date) }) {
            return Color.white
        } else {
            return isCurrentMonth ? .primary : .gray
        }
    }
}
     
#Preview {
    TrackingCalendarExtractedView()
}
