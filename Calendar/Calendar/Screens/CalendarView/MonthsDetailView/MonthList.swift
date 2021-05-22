//
//  MonthView.swift
//  Calendar
//
//  Created by Raghavendra Mikkilineni on 21/05/21.
//

import SwiftUI

struct MonthList: View {
    @ObservedObject private(set) var viewModel: MonthViewModel
    var dayTapped: (Date) -> Void
    
    private func header(for month: Date) -> some View {
        return VStack(alignment: .trailing, spacing: 10) {
            HStack {
                Spacer()
                let formatter = DateFormatter.monthAndYear
                Text(formatter.string(from: month))
                    .font(.headline)
                    .foregroundColor(month.isCurrentMonth() ? Assests.Color.monthTitle : Assests.Color.defaultColor)
            }
            .padding(.horizontal, 15)
        }
        .padding(10)
    }
    
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible(minimum: 40, maximum: 100), spacing: 0, alignment: .top), count: 7),
                  spacing: 0) {
            ForEach(viewModel.months, id: \.self) { month in
                Section(header: header(for: month)) {
                    ForEach(0..<viewModel.days(for: month).count) { index in
                        DayView(month: month, date: viewModel.days(for: month)[index])
                            .onTapGesture {
                                self.dayTapped(viewModel.days(for: month)[index])
                            }
                    }
                }
            }
        }
    }
}

struct MonthView_Previews: PreviewProvider {
    static var previews: some View {
        MonthList(viewModel: MonthList.MonthViewModel(months: Array<Date>()), dayTapped: { date in } )
    }
}
