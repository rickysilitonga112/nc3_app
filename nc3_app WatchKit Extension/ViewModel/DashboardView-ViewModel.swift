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
        @Published var latitude: Double = 1
        @Published var longitude: Double = 0
        @Published var currentDate: Int = 0
        @Published var currentUvi: Double = 0
        @Published var hourlyConditionArr: [Condition]?
        
        
        @Published var currentCondition: Condition?
        
        
        private let completeUrlTest: String = "https://api.openweathermap.org/data/2.5/onecall?lat=1.082828&lon=104.030457&exclude=minutely,daily&appid=a9deed7fe4a75cac2ac745df80c7e8aa"
        private let baseURL: String = "https://api.openweathermap.org/data/2.5/onecall"
        private let apiKey: String = "a9deed7fe4a75cac2ac745df80c7e8aa"
        
        init() {
            fetchData()
        }
        
        
        func getTodayWear() -> [String] {
            if currentUvi < 3 {
                return ["payung", "baju panjang"]
            } else if currentUvi < 6 {
                return ["this", "thus"]
            } else if currentUvi < 9 {
                return ["dfd"]
            } else {
                return ["rfdsfsf"]
            }
        }
        
        func getFormatTime() -> String {
            if currentDate == 0 {
                return "0"
            }
            
            let time = Double(currentDate)
            
            let date = Date(timeIntervalSince1970: time)
            let dateFormatter = DateFormatter()
            dateFormatter.timeStyle = DateFormatter.Style.medium //Set time style
            dateFormatter.dateStyle = DateFormatter.Style.medium //Set date style
            dateFormatter.timeZone = .current
            let localDate = dateFormatter.string(from: date)
            
            return localDate
        }
        
        // api request
        func fetchData() {
            let url: String = baseURL + "?appid=\(apiKey)" + "&exclude=minutely,daily" + "&lat=1.082828&lon=104.030457"
            performRequest(with: url)
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
                                    self.latitude = result.lat
                                    self.longitude = result.lon
                                    self.currentDate = result.current.dt
                                    self.currentUvi = result.current.uvi
                                    self.hourlyConditionArr = result.hourly
                                    
                                    
                                    self.currentCondition = result.current
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
                return decodeData
            } catch {
                print("Error decode data \(error.localizedDescription)")
                return nil
            }
        }
        
    }
}
