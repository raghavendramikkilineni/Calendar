//
//  YearView.swift
//  Calendar
//
//  Created by Raghavendra Mikkilineni on 21/05/21.
//

import SwiftUI

struct YearsList: View {
    @ObservedObject private(set) var viewModel: YearsViewModel
    var monthTapped: (Date) -> Void
    private func header(for year: Date) -> some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(year.displayYear())
                .font(.system(size: 25, weight: .heavy, design: .default))
                .foregroundColor(year.isCurrentYear() ? Assests.Color.monthTitle : Assests.Color.defaultColor)
            Divider()
        }
    }
    
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 5, alignment: .top), count: 3),
                  alignment: .trailing,
                  spacing: 10) {
            ForEach(viewModel.years, id: \.self) { year in
                Section(header: header(for: year)) {
                    YearMonthView(viewModel: YearMonthView.YearMonthViewModel(months: viewModel.monthsForYear(year)),
                                  monthTapped: { month in
                                    monthTapped(month)
                                  })
                }
            }
        }
        .padding(.horizontal, 10)
    }
}

struct YearView_Previews: PreviewProvider {
    static var previews: some View {
        YearsList(viewModel: YearsList.YearsViewModel(years: Array<Date>()), monthTapped: { date in })
    }
}
