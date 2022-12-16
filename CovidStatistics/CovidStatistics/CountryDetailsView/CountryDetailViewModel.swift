//
//  CountryDetailViewModel.swift
//  CovidStatistics
//
//  Created by Лина Вертинская on 15.12.22.
//

import Foundation

final class CountryDetailViewModel: ObservableObject {

    @Published var reports: [RegionReport] = []
    @Published var alertItem: AlertItem?

    private var iso: String

    init(country: Country) {
        iso = country.iso
    }

    func fetchReport() {

        APIService.shared.fetchReport(for: iso) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let reports):
                    self.reports = reports
                case .failure(_):
                    self.alertItem = AlertContext.unableToFetchCountryStats
                }
            }
        }
    }
}
