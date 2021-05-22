//
//  CalendarViewModel.swift
//  Calendar
//
//  Created by Raghavendra Mikkilineni on 20/05/21.
//

import Foundation

extension CalendarView {
    class ViewModel: ObservableObject {
        
        @Published var years: Array<Date> = Array<Date>()
        @Published var isDetailShown: Bool = false
        @Published var months: Array<Date> = Array<Date>()
        
        var calendar: Calendar = Calendar(identifier: .gregorian)
        var selectedMonth: Date = Date()
        let interval: DateInterval
        
        init(interval: DateInterval) {
            self.interval = interval
            DispatchQueue.global().async {
                self.makeYears()
            }
        }
        
        func makeYears() {
            let startDate = interval.start
            let endDate = interval.end
            let calendar = Calendar.current
            let components = calendar.dateComponents(Set([.year]), from: startDate, to: endDate)
            
            for i in 0...components.year! {
                guard let date = calendar.date(byAdding: .year, value: i, to: startDate) else {
                    continue
                }
                years.append(date)
                makeMonth(year: date)
            }
        }
    }
}

extension CalendarView.ViewModel {
    func getCurrentYearIndex(for years: Array<Date>) -> Int {
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        let currentDateStr = formatter.string(from: currentDate)
        
        for (index, date) in years.enumerated() {
            let formattedStr = formatter.string(from: date)
            if formattedStr == currentDateStr {
                return index
            }
        }
        return 0
    }
}

extension CalendarView.ViewModel {
    func makeMonth(year: Date) {
        let monthInterval = calendar.dateInterval(of: .year, for: year)
        let startDate = monthInterval?.start
        let endDate = monthInterval?.end
        guard let startDateValue = startDate, let endDateValue = endDate else {
            return
        }
        let calendar = Calendar.current
        let components = calendar.dateComponents(Set([.month]), from: startDateValue, to: endDateValue)
        
        for i in 0..<components.month! {
            guard let month = calendar.date(byAdding: .month, value: i, to: startDateValue) else { continue }
            months.append(month)
        }
    }
    
    //MARK: Unused Code
    
    /* private func generateMonthsForDetail() {
     months = calendar.generateDates(inside: interval,
     matching: DateComponents(day: 1, hour: 0, minute: 0, second: 0))
     }
     
     func days(for month: Date) -> Array<Date> {
     guard
     let monthInterval = calendar.dateInterval(of: .month, for: month),
     let monthFirstWeek = calendar.dateInterval(of: .weekOfMonth, for: monthInterval.start),
     let monthLastWeek = calendar.dateInterval(of: .weekOfMonth, for: monthInterval.end) else { return [] }
     
     return calendar.generateDates(inside: DateInterval(start: monthFirstWeek.start, end: monthLastWeek.end),
     matching: DateComponents(hour: 0, minute: 0, second: 0))
     } */
}
