//
//  TrackingCalendarExtractedView.swift
//  Challengo
//
//  Created by Haiying on 04/06/2024.
//

import SwiftUI

struct TrackingCalendarExtractedView: View {
    @State private var currentYear: Int = 2024
    @State private var currentMonth: Int = 6

    let successfulChallenges: [Date] = [
        getDate(year: 2024, month: 6, day: 1),
        getDate(year: 2024, month: 6, day: 5),
        getDate(year: 2024, month: 6, day: 6)
    ]
    
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
    
    var monthName: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        let date = TrackingCalendarExtractedView.getDate(year: currentYear, month: currentMonth, day: 1)
        return dateFormatter.string(from: date)
    }
    
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
    
    func previousMonth() {
        if currentMonth == 1 {
            currentMonth = 12
            currentYear -= 1
        } else {
            currentMonth -= 1
        }
    }
    
    func nextMonth() {
        if currentMonth == 12 {
            currentMonth = 1
            currentYear += 1
        } else {
            currentMonth += 1
        }
    }
    
    static func getDate(year: Int, month: Int, day: Int) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.date(from: "\(year)-\(month)-\(day)")!
    }
}

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
                    // Constantes inutilisées
                    // let isSuccessful = successfulChallenges.contains(where: { Calendar.current.isDate($0, inSameDayAs: date) })
                    // let isUnsuccessful = unsuccessfulChallenges.contains(where: { Calendar.current.isDate($0, inSameDayAs: date) })
                    let accentShape: AnyShape = isToday ? AnyShape(RoundedRectangle(cornerRadius: 10)) : AnyShape(Circle())
                    Text("\(day)")
                        .frame(width: 40, height: 40)
                        .background(backgroundColor(for: date, isToday: isToday))
                        .clipShape(accentShape)
                        .padding(2)
                        .foregroundColor(foregroundColor(for: date, isCurrentMonth: isCurrentMonth, isToday: isToday))
                }
            }
    
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
