//
//  ReminderView.swift
//  Calendar
//
//  Created by Raghavendra Mikkilineni on 20/05/21.
//

import SwiftUI

struct ReminderCell: View {
    let reminder: Reminder
    
    var body: some View {
        VStack (alignment: .leading, spacing: 5){
            Text(reminder.title)
                .foregroundColor(reminder.date.isCurrentDate() ? Assests.Color.monthTitle : Assests.Color.defaultColor)
                .font(.headline)
            Text(reminder.date.displayDateStr())
                .foregroundColor(reminder.date.isCurrentDate() ? Assests.Color.monthTitle : Assests.Color.defaultColor)
                .font(.headline)
            Text(reminder.notes)
                .font(.subheadline)
            Text(reminder.location)
                .font(.subheadline)
            HStack {
                Circle()
                    .frame(width: 15, height: 15)
                    .foregroundColor(Assests.Color.reminderColor(for: reminder.priority))
                Text("\(reminder.priority.rawValue) priority.")
                    .font(.subheadline)
            }
        }
        .padding(.horizontal, 15)
    }
}

struct ReminderView_Previews: PreviewProvider {
    static var previews: some View {
        ReminderCell(reminder: Reminder.getMock())
    }
}
