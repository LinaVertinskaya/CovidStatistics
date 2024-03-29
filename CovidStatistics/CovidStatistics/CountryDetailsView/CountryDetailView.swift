//
//  CountryDetailView.swift
//  CovidStatistics
//
//  Created by Лина Вертинская on 15.12.22.
//

import SwiftUI

struct CountryDetailView: View {

    @ObservedObject var viewModel: CountryDetailViewModel
    
    var body: some View {
        VStack {
            if viewModel.reports.count > 1 {
                List {
                    ForEach(viewModel.reports) { report in

                        NavigationLink(destination: ReportView(report: report)) {
                            Text(report.region.province)
                        }
                    }
                }
                .listStyle(.plain)
                .navigationTitle(viewModel.reports.first?.region.name ?? "Unknown country")
                .navigationBarTitleDisplayMode(.inline)
            } else {
                ReportView(report: viewModel.reports.first ?? RegionReport.dummyData)
                    .ignoresSafeArea()
            }
        }
        .alert(item: $viewModel.alertItem, content: { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        })
        .onAppear {
            if viewModel.reports.count == 0 {
                viewModel.fetchReport()
            }
        }
    }
}

struct CountryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailView(viewModel: CountryDetailViewModel(country: Country.dummyData))
    }
}
