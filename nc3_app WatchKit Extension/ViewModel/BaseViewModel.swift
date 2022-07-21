//
//  BaseViewModel.swift
//  nc3_app WatchKit Extension
//
//  Created by MOHAMAD IRVAN on 20/07/22.
//

import Foundation

class BaseViewModel: ObservableObject {
    static let shared = BaseViewModel()
    
    @Published var latitude: Double?
    @Published var longitude: Double?
    
    @Published var currentCondition: Condition = Condition(dt: 0, temp: 0, uvi: 0, weather: [Weather(id: 0, main: "Unknown", description: "Unknown")])
    @Published var hourlyConditionArr: [Condition]?
    
    
    private let completeUrlTest: String = "https://api.openweathermap.org/data/2.5/onecall?lat=1.082828&lon=104.030457&exclude=minutely,daily&appid=a9deed7fe4a75cac2ac745df80c7e8aa"
    private let baseURL: String = "https://api.openweathermap.org/data/2.5/onecall"
    private let apiKey: String = "a9deed7fe4a75cac2ac745df80c7e8aa"
    
    init() {
       fetchData()
    }
    
    
    func getTodayWear(uvi: Int) -> [String] {
        if uvi < 3 {
            return ["Sunscreen", "Sunglasses"]
        } else if uvi < 6 {
            return ["Sunscreen", "Sunglasses", "Sunhat"]
        } else {
            return ["Sunscreen", "Sunglasses", "Sunhat", "Long-sleeved clothes"]
        }
    }
    
    func getIndex(uvi: Int) -> String {
        if uvi <= 2 {
            return "Low"
        } else if uvi <= 5 {
            return "Moderate"
        } else if uvi <= 7 {
            return "High"
        } else if uvi <= 10 {
            return "Very High"
        } else {
            return "Extreme"
        }
    }
    
    func getBurninTime(uvi: Int) -> String {
        if uvi == 0 {
            return "0 minutes"
        }
        else if uvi <= 2 {
            return "60 minutes"
        } else if uvi <= 4 {
            return "45 minutes"
        } else if uvi <= 6 {
            return "30 minutes"
        } else if uvi <= 10 {
            return "15 - 24 minutes"
        } else {
            return "10 minutes or less"
        }
    }
    
    func getConditionName(conditionId: Int) -> String {
        switch conditionId {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
    
    func getFormatTime(time: Int) -> String {
        if time == 0 {
            return "0"
        }
        
        let time = Double(time)
        
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
        
        if let latitude = latitude {
            if let longitude = longitude {
                let url: String = baseURL + "?appid=\(apiKey)" + "&exclude=minutely,daily" + "&lat=\(latitude)" + "&lon=\(longitude)" + "&units=metric"
                performRequest(with: url)
            }
        }
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
                                self.currentCondition = result.current
                                self.hourlyConditionArr = result.hourly
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

