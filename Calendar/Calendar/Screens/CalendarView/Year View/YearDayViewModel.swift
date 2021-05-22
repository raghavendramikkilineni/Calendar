//
//  YearDayViewModel.swift
//  Calendar
//
//  Created by Raghavendra Mikkilineni on 21/05/21.
//

import Foundation

extension YearDayView {
    class YearDayViewModel: ObservableObject {
        var days: Array<Date> = Array<Date>()
        var month: Date
        var calendar: Calendar = Calendar(identifier: .gregorian)
        
        init(days: Array<Date>, month: Date) {
            self.days = days
            self.month = month
        }
        
        func isDisplay(for date: Date) -> Bool {
            return calendar.isDate(date, equalTo: month, toGranularity: .month) ? true : false
        }
    }
}
