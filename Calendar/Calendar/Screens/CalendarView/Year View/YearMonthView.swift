//
//  YearMonthView.swift
//  Calendar
//
//  Created by Raghavendra Mikkilineni on 21/05/21.
//

import SwiftUI

struct YearMonthView: View {
    @ObservedObject  private(set) var viewModel: YearMonthViewModel
    var monthTapped: (Date) -> Void
    private func monthText(_ month: Date) -> some View {
        Text(month.displayMonth())
            .font(.headline)
            .foregroundColor(month.isCurrentMonth() ? Assests.Color.monthTitle : Assests.Color.defaultColor)
    }
    
    private func days(_ month: Date) -> some View {
        YearDayView(viewModel: YearDayView.YearDayViewModel(days: viewModel.daysForMonth(for: month), month: month))
    }
    
    var body: some View {
        ForEach(viewModel.months, id: \.self) { month in
            VStack(alignment: .leading, spacing: 2) {
                monthText(month)
                days(month)
            }
            .onTapGesture {
                monthTapped(month)
            }
        }
    }
}

struct YearMonthView_Previews: PreviewProvider {
    static var previews: some View {
        YearMonthView(viewModel: YearMonthView.YearMonthViewModel(months: [Date()]), monthTapped: { date in })
    }
}
