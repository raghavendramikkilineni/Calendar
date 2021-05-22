//
//  Reminder.swift
//  Calendar
//
//  Created by Raghavendra Mikkilineni on 20/05/21.
//

import Foundation

enum Priority: String {
    case low = "Low"
    case medium = "Medium"
    case high = "High"
}

struct Reminder: Hashable {
    let title: String
    let notes: String
    let date: Date
    let location: String
    let priority: Priority
    
    static func isRemindersExists(for today: Date) -> (Bool, Reminder?) {
        let reminders = getReminders()
        for reminder in reminders {
            if reminder.date.isSameDates(date: today) {
                return (true, reminder)
            }
        }
        return (false, nil)
    }
}

extension Reminder {
    static func getReminders() -> Array<Reminder> {
        let currentDate = Date()
        return [Reminder(title: "Birthday 🎂",
                         notes: "Today's your best friend Narayana's birthday 🎉💐", date: currentDate,
                         location: "Hyderabad, India",
                         priority: .high),
                Reminder(title: "Wedding Aniversary❤️",
                         notes: "It's my wedding date, time to celebrate 🥂",
                         date: Calendar.current.date(byAdding: .day, value: 4, to: currentDate) ?? currentDate,
                         location: "Bangalore, India",
                         priority: .high),
                Reminder(title: "iOS interview",
                         notes: "Interview time, 3o'clock sharp - be sharp.",
                         date: Calendar.current.date(byAdding: .day, value: 12, to: currentDate) ?? currentDate,
                         location: "Bangalore, India",
                         priority: .medium),
                Reminder(title: "Take the dog for a walk",
                         notes: "walk O'clock 🐕",
                         date: Calendar.current.date(byAdding: .day, value: -5, to: currentDate) ?? currentDate,
                         location: "Jaya Nagara",
                         priority: .low),
                Reminder(title: "Meeting with Ashley 3PM 👩🏻‍🦰",
                         notes: "Bitch time",
                         date:Calendar.current.date(byAdding: .day, value: 35, to: currentDate) ?? currentDate,
                         location: "Swedan",
                         priority: .high),
                Reminder(title: "Dental appointment",
                         notes: "Tooth filling at 11 AM",
                         date: Calendar.current.date(byAdding: .day, value: 40, to: currentDate) ?? currentDate,
                         location: "Kormangala",
                         priority: .medium),
                Reminder(title: "Group call",
                         notes: "Attend the school friends group call 7PM",
                         date: Calendar.current.date(byAdding: .day, value: 20, to: currentDate) ?? currentDate,
                         location: "Home",
                         priority: .low),
                Reminder(title: "Unpack the tent",
                         notes: "unpack the tent and move on for next destination,.",
                         date: Calendar.current.date(byAdding: .day, value: -17, to: currentDate) ?? currentDate,
                         location: "India",
                         priority: .low),
                Reminder(title: "Life on Mars",
                         notes: "Watch the tv show on Netflix at 4pm",
                         date: Calendar.current.date(byAdding: .day, value: 6, to: currentDate) ?? currentDate,
                         location: "Bangalore, India",
                         priority: .high),
                Reminder(title: "African Maasai",
                         notes: "Watch the tv show on Nat Geo at 8pm",
                         date: Calendar.current.date(byAdding: .day, value: 19, to: currentDate) ?? currentDate,
                         location: "Bangalore, India",
                         priority: .low),
                Reminder(title: "Birthday 🎂",
                         notes: "Today's your best friend Maddy's birthday 🎉💐",
                         date: Calendar.current.date(byAdding: .day, value: -6, to: currentDate) ?? currentDate,
                         location: "Bangalore, India",
                         priority: .high),
                Reminder(title: "Generate Calender Github Code",
                         notes: "Write code to generate the dynamic calender with years passed.",
                         date: Calendar.current.date(byAdding: .day, value: -25, to: currentDate) ?? currentDate,
                         location: "Bangalore, India",
                         priority: .low)]
    }
    
    static func getMock() -> Reminder {
        return Reminder(title: "Birthday 🎂",
                        notes: "Today's your best friend Narayana's birthday 🎉💐", date: Date(),
                        location: "Hyderabad, India",
                        priority: .high)
    }
}
