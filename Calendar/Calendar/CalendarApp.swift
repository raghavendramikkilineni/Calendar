//
//  CalendarApp.swift
//  Calendar
//
//  Created by Raghavendra Mikkilineni on 20/05/21.
//

import SwiftUI

@main
struct CalendarApp: App {
    
    private var calender: Calendar = Calendar(identifier: .gregorian)
    var body: some Scene {
        WindowGroup {
            let startDate = Date().getPreviousYear()
            let endDate = Date().getNextYear()
            CalendarView(viewModel: CalendarView.ViewModel(interval: DateInterval(start: startDate, end: endDate)))
        }
    }
}
