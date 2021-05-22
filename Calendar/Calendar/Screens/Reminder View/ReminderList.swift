//
//  ReminderList.swift
//  Calendar
//
//  Created by Raghavendra Mikkilineni on 21/05/21.
//

import SwiftUI

struct ReminderList: View {
    @ObservedObject private(set) var viewModel: ReminderList.ReminderListViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    private var reminderList: some View {
        ScrollView {
            ScrollViewReader { scrollProxy in
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(viewModel.reminderList, id: \.self) { reminder in
                        ReminderCell(reminder: reminder)
                        Divider()
                    }
                }
                .padding(.vertical, 10)
                .onAppear {
                    scrollProxy.scrollTo(viewModel.reminderList[viewModel.indexToScroll()])
                }
            }
        }
    }
    
    private var backButton: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }, label: {
            HStack {
                Image(systemName: "chevron.backward")
                    .foregroundColor(viewModel.selectedReminder.date.isCurrentDate() ? Assests.Color.monthTitle : Assests.Color.defaultColor)
                Text(viewModel.selectedReminder.date.displayDateStr())
                    .foregroundColor(viewModel.selectedReminder.date.isCurrentDate() ? Assests.Color.monthTitle : Assests.Color.defaultColor)
            }
        })
    }
    
    var body: some View {
        NavigationView {
            reminderList
                .navigationBarHidden(true)
        }
        .navigationTitle("Reminders")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }
}

struct ReminderList_Previews: PreviewProvider {
    static var previews: some View {
        ReminderList(viewModel: ReminderList.ReminderListViewModel(selectedReminder: Reminder.getMock()))
    }
}
