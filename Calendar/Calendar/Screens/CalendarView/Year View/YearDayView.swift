//
//  YearDayView.swift
//  Calendar
//
//  Created by Raghavendra Mikkilineni on 21/05/21.
//

import SwiftUI

struct YearDayView: View {
    @ObservedObject private(set) var viewModel: YearDayViewModel
    
    private func day(for date: Date) -> some View {
        let formatter = DateFormatter.day
        return Text(formatter.string(from: date))
            .font(.system(size: 8, weight: .medium, design: .default))
            .foregroundColor(viewModel.isDisplay(for: date) ? Assests.Color.defaultColor : .clear)
            .background(date.isCurrentDate() ? Circle()
                            .foregroundColor(Assests.Color.circleColor)
                            .frame(width: 14, height: 14, alignment: .center) : nil)
        
    }
    
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible(minimum: 10, maximum: 20), spacing: 0, alignment: .leading), count: 7),
                  alignment: .leading,
                  spacing: 3) {
            ForEach(viewModel.days, id: \.self) { date in
                day(for: date)
            }
        }
    }
}

struct YearDayView_Previews: PreviewProvider {
    static var previews: some View {
        YearDayView(viewModel: YearDayView.YearDayViewModel(days: Array<Date>(), month: Date()))
    }
}
