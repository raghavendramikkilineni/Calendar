//
//  DayView.swift
//  Calendar
//
//  Created by Raghavendra Mikkilineni on 21/05/21.
//

import SwiftUI

struct DayView: View {
    var month: Date
    var date: Date
    var calendar: Calendar = Calendar(identifier: .gregorian)
    
    private func reminder(for reminder: Reminder) -> some View {
        Circle()
            .foregroundColor(Assests.Color.reminderColor(for: reminder.priority))
            .frame(width: 7, height: 7, alignment: .center)
            .padding(.bottom, 10)
    }
    
    private func day(for date: Date) -> some View {
        let formatter = DateFormatter.day
        return Text(formatter.string(from: date))
            .font(.subheadline)
            .foregroundColor(date.isCurrentDate() ? Assests.Color.invertedColor : date.isWeekend ? Assests.Color.monthTitle : Assests.Color.defaultColor)
            .background(date.isCurrentDate() ? Circle()
                            .foregroundColor(Assests.Color.circleColor)
                            .frame(width: 30, height: 30, alignment: .center) : nil)
            .padding()
    }
    
    private var content: some View {
        VStack(spacing: 0) {
            Divider()
            day(for: date)
            let (isReminderExists, reminderDetail) = Reminder.isRemindersExists(for: date)
            if isReminderExists {
                if let reminderObject = reminderDetail {
                    reminder(for: reminderObject)
                }
            }
        }
    }
    
    private var divider: some View {
        VStack (spacing: 0) {
            Divider()
        }
    }
    
    var body: some View {
        if calendar.isDate(date, equalTo: month, toGranularity: .month) {
            content
        }else {
            divider
        }
    }
}

struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        DayView(month: Date(), date: Date())
    }
}
