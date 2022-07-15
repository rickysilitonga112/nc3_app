//
//  DashboardView+ViewModel.swift
//  nc3_app WatchKit Extension
//
//  Created by Ricky Silitonga on 15/07/22.
//

import Foundation
import SwiftUI

extension DashboardView {
    @MainActor class ViewModel: ObservableObject {
        @Published var latitude: Double = 0
        @Published var longitude: Double = 0
        @Published var currentCondition: Condition?
        @Published var hourlyConditionArr: [Condition]?
        
        
        private let completeUrlTest: String = "https://api.openweathermap.org/data/2.5/onecall?lat=1.082828&lon=104.030457&exclude=minutely,daily&appid=a9deed7fe4a75cac2ac745df80c7e8aa"
        private let baseURL: String = "https://api.openweathermap.org/data/2.5/onecall?exclude=minutely,daily"
        private let apiKey: String = "a9deed7fe4a75cac2ac745df80c7e8aa"
        
        func fetchData() {
            performRequest(with: completeUrlTest)
        }
        
        private func performRequest(with url: String) {
            if let url = URL(string: url) {
                let urlSession = URLSession(configuration: .default)
                
                let task = urlSession.dataTask(with: url) { data, response, error in
                    if error == nil {
                        if let safeData = data {
                            // use the data
                            if let result = self.decodeJson(safeData) {
                                DispatchQueue.main.async {
//                                    self.oneCallApiData = result
                                }
                            }
                        }
                    }
                }
                
                task.resume()
            }
        }
        
        
        private func decodeJson(_ safeData: Data) -> OneCallApiModel? {
            let decoder = JSONDecoder()
            do {
                let decodeData = try decoder.decode(OneCallApiModel.self, from: safeData)
                print(decodeData)
                return decodeData
            } catch {
                print("Error decode data \(error.localizedDescription)")
                return nil
            }
        }
        
    }
}
