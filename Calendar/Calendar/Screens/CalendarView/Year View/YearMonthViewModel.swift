//
//  YearMonthViewModel.swift
//  Calendar
//
//  Created by Raghavendra Mikkilineni on 21/05/21.
//

import Foundation

extension YearMonthView {
    class YearMonthViewModel: ObservableObject {
        var months: Array<Date>
        var calendar: Calendar = Calendar(identifier: .gregorian)
        
        init(months: Array<Date>) {
            self.months = months
        }
        
        func daysForMonth(for month: Date) -> Array<Date> {
            guard
                let monthInterval = calendar.dateInterval(of: .month, for: month),
                let monthFirstWeek = calendar.dateInterval(of: .weekOfMonth, for: monthInterval.start),
                let monthLastWeek = calendar.dateInterval(of: .weekOfMonth, for: monthInterval.end) else { return [] }
            
            return calendar.generateDates(inside: DateInterval(start: monthFirstWeek.start, end: monthLastWeek.end),
                                          matching: DateComponents(hour: 0, minute: 0, second: 0))
        }
    }
}
