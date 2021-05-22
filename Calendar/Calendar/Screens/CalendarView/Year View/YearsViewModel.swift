//
//  YearsViewModel.swift
//  Calendar
//
//  Created by Raghavendra Mikkilineni on 21/05/21.
//

import Foundation

extension YearsList {
    class YearsViewModel: ObservableObject {
        var years: Array<Date>
        var calendar: Calendar = Calendar(identifier: .gregorian)
        
        init(years: Array<Date>) {
            self.years = years
        }
        
        func monthsForYear(_ year: Date) -> Array<Date> {
            let monthInterval = calendar.dateInterval(of: .year, for: year)
            let startDate = monthInterval?.start
            let endDate = monthInterval?.end
            guard let startDateValue = startDate, let endDateValue = endDate else {
                return []
            }
            let calendar = Calendar.current
            let components = calendar.dateComponents(Set([.month]), from: startDateValue, to: endDateValue)
            var months: Array<Date> = Array<Date>()
            
            for i in 0..<components.month! {
                guard let month = calendar.date(byAdding: .month, value: i, to: startDateValue) else { continue }
                months.append(month)
            }
            return months
        }
    }
}
