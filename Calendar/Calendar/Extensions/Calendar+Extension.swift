//
//  Calendar+Extension.swift
//  Calendar
//
//  Created by Raghavendra Mikkilineni on 20/05/21.
//

import Foundation

extension Calendar {
    func generateDates(inside interval: DateInterval,
                       matching components: DateComponents) -> Array<Date> {
        var dates: Array<Date> = Array<Date>()
        
        dates.append(interval.start)
        enumerateDates(startingAfter: interval.start,
                       matching: components,
                       matchingPolicy: .nextTime) { (date, _, stop) in
            
            if let date = date {
                if date < interval.end {
                    dates.append(date)
                }else {
                    stop = true
                }
            }
        }
        return dates
    }
}

extension Date {
    func isCurrentYear() -> Bool {
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        let currentYearStr = formatter.string(from: currentDate)
        let forDateStr = formatter.string(from: self)
        return currentYearStr == forDateStr
    }
    
    func isCurrentDate() -> Bool {
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        let currentDateStr = formatter.string(from: currentDate)
        let forDateStr = formatter.string(from: self)
        return currentDateStr == forDateStr
    }
    
    func isCurrentMonth() -> Bool {
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MM.yyyy"
        let currentDateStr = formatter.string(from: currentDate)
        let forDateStr = formatter.string(from: self)
        return currentDateStr == forDateStr
    }
    
    var dayofTheWeek: String {
        let dayNumber = Calendar.current.component(.weekday, from: self)
        return Date.daysOfTheWeek[dayNumber - 1]
    }
    
    static var daysOfTheWeek: [String] {
        return  ["S", "M", "T", "W", "T", "F", "S"]
    }
    
    var isWeekend: Bool {
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents([.weekday], from: self)
        if components.weekday == 1 || components.weekday == 7 {
            return true
        }
        return false
    }
    
    func isSameDates(date: Date) -> Bool {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        let inputDateStr = formatter.string(from: date)
        let forDateStr = formatter.string(from: self)
        return inputDateStr == forDateStr
    }
    
    func displayDateStr() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        return formatter.string(from: self)
    }
    
    func displayYear() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        return formatter.string(from: self)
    }
    
    func displayMonth() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM"
        return formatter.string(from: self)
    }
    
    func displayMonthYear() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM yyyy"
        return formatter.string(from: self)
    }
    
    func getPreviousYear() -> Date {
        Calendar.current.date(byAdding: .year, value: -1, to: self) ?? Date()
    }
    
    func getNextYear() -> Date {
        Calendar.current.date(byAdding: .year, value: 1, to: self) ?? Date()
    }
}

