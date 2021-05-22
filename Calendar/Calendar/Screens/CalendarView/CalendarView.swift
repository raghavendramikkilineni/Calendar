//
//  CalendarView.swift
//  Calendar
//
//  Created by Raghavendra Mikkilineni on 20/05/21.
//

import SwiftUI

struct CalendarView: View {
    @ObservedObject private(set) var viewModel: ViewModel
    
    private var navigation: some View {
        NavigationView {
            content
                .navigationBarTitle("Calendar")
                .edgesIgnoringSafeArea(.bottom)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private var yearsList: some View {
        ScrollView(showsIndicators: false) {
            ScrollViewReader { scrollProxy in
                YearsList(viewModel: YearsList.YearsViewModel(years: viewModel.years), monthTapped: { month in
                    monthTapped(for: month)
                })
                .padding(.bottom, 40)
                .onAppear {
                    scrollProxy.scrollTo(viewModel.years[viewModel.getCurrentYearIndex(for: viewModel.years)])
                }
                NavigationLink(destination: MonthsDetailView(viewModel: MonthsDetailView.MonthsDetailViewModel(selectedMonth: viewModel.selectedMonth, months: viewModel.months)),
                               isActive: $viewModel.isDetailShown) {
                    EmptyView()
                }
            }
        }
    }
    
    private var content: some View {
        yearsList
    }
    
    var body: some View {
        navigation
    }
    
    //MARK: Actions
    func monthTapped(for month: Date) {
        viewModel.selectedMonth = month
        withAnimation {
            viewModel.isDetailShown.toggle()
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(viewModel: CalendarView.ViewModel(interval: DateInterval(start: Date(), duration: TimeInterval(60))))
    }
}
