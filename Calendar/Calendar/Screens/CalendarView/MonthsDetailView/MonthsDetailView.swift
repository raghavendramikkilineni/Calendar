//
//  MonthsDetailView.swift
//  Calendar
//
//  Created by Raghavendra Mikkilineni on 22/05/21.
//

import SwiftUI

struct MonthsDetailView: View {
    @ObservedObject private(set) var viewModel: MonthsDetailViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    private var weekdays: some View {
        HStack(alignment: .top, spacing: UIScreen.main.bounds.size.width / 8) {
            ForEach(Date.daysOfTheWeek, id: \.self) { weekDay in
                Text(weekDay)
                    .foregroundColor(weekDay == "S" ? Assests.Color.monthTitle : Assests.Color.defaultColor)
                    .font(.system(size: 10, weight: .light, design: .default))
            }
        }
        .padding()
    }
    
    private var monthList: some View {
        ScrollView(showsIndicators: false) {
            ScrollViewReader { scrollProxy in
                MonthList(viewModel: MonthList.MonthViewModel(months: viewModel.months),
                          dayTapped: { date in
                            dateTapped(for: date)
                          })
                    .onAppear {
                        scrollProxy.scrollTo(viewModel.months[viewModel.getSelectedMonthIndex()])
                    }
                NavigationLink(destination: ReminderList(viewModel: ReminderList.ReminderListViewModel(selectedReminder: viewModel.reminderSelected ?? Reminder.getMock())),
                               isActive: $viewModel.isReminderPresented) {
                    EmptyView()
                }
            }
        }
    }
    
    private var content: some View {
        VStack {
            weekdays
            monthList
        } 
    }
    
    private var backButton: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }, label: {
            HStack {
                Image(systemName: "chevron.backward")
                    .foregroundColor(viewModel.selectedMonth.isCurrentMonth() ? Assests.Color.monthTitle : Assests.Color.defaultColor)
                Text(viewModel.selectedMonth.displayMonthYear())
                    .foregroundColor(viewModel.selectedMonth.isCurrentMonth() ? Assests.Color.monthTitle : Assests.Color.defaultColor)
            }
        })
    }
    
    var body: some View {
        content
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: backButton)
            .navigationBarTitleDisplayMode(.inline)
    }
    
    //MARK: Actions
    func dateTapped(for date: Date) {
        viewModel.reminderSelected = nil
        let (_, reminderDetail) = Reminder.isRemindersExists(for: date)
        if let reminderObject = reminderDetail {
            viewModel.reminderSelected = reminderObject
            withAnimation {
                viewModel.isReminderPresented.toggle()
            }
        }
    }
}

struct MonthsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MonthsDetailView(viewModel: MonthsDetailView.MonthsDetailViewModel(selectedMonth: Date(), months: Array<Date>()))
    }
}
