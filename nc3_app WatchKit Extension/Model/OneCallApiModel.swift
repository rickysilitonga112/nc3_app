//
//  UVModel.swift
//  nc3_app WatchKit Extension
//
//  Created by Ricky Silitonga on 14/07/22.
//

import Foundation

struct OneCallApiModel: Codable {
    let lat: Double
    let lon: Double
    let current: Condition
    let hourly: [Condition]
}

struct Condition: Codable {
    let dt: Int
    let temp: Double
    let uvi: Double
    let weather: [Weather]
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
}

// notification center buat kasih tau tiap berapa detik sekali call api
