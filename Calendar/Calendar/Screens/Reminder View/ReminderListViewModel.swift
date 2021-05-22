//
//  ReminderListViewModel.swift
//  Calendar
//
//  Created by Raghavendra Mikkilineni on 21/05/21.
//

import Foundation

extension ReminderList {
    class ReminderListViewModel: ObservableObject {
        @Published var reminderList: Array<Reminder> = Array<Reminder>()
        var selectedReminder: Reminder
        
        init(selectedReminder: Reminder) {
            self.selectedReminder = selectedReminder
            getAllReminders()
        }
        
        func getAllReminders() {
            reminderList = Reminder.getReminders()
            reminderList.sort { $0.date < $1.date }
        }
        
        func indexToScroll() -> Int {
            for (index, reminder) in reminderList.enumerated() {
                if reminder.title == selectedReminder.title {
                    return index
                }
            }
            return 0
        }
    }
}
