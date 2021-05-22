//
//  MonthsDetailViewModel.swift
//  Calendar
//
//  Created by Raghavendra Mikkilineni on 22/05/21.
//

import Foundation

extension MonthsDetailView {
    
    class MonthsDetailViewModel: ObservableObject {
        @Published var months: Array<Date>
        @Published var isReminderPresented: Bool = false
        var selectedMonth: Date
        
        var reminderSelected: Reminder?
        var calendar: Calendar = Calendar(identifier: .gregorian)
        
        init(selectedMonth: Date, months: Array<Date>) {
            self.selectedMonth = selectedMonth
            self.months = months
        }
        
        func getSelectedMonthIndex() -> Int {
            let formatter = DateFormatter()
            formatter.dateFormat = "MM.yyyy"
            let selectedDateStr = formatter.string(from: selectedMonth)
            for (index, date) in months.enumerated() {
                let formattedStr = formatter.string(from: date)
                if formattedStr == selectedDateStr {
                    return index
                }
            }
            return 0
        }
        
        func getCurrentMonthIndex() -> Int {
            let currentDate = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "MM.yyyy"
            let currentDateStr = formatter.string(from: currentDate)
            
            for (index, date) in months.enumerated() {
                let formattedStr = formatter.string(from: date)
                if formattedStr == currentDateStr {
                    return index
                }
            }
            return 0
        }
    }
}
