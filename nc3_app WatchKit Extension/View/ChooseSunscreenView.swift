//
//  ChooseSunscreenView.swift
//  nc3_app WatchKit Extension
//
//  Created by Ricky Silitonga on 14/07/22.
//

import SwiftUI

struct ChooseSunscreenView: View {
    @ObservedObject var fetchManager = FetchRequest()
    
    @State var uvi: Double = 0
    @State var lat: Double = 0
    @State var lon: Double = 0
    
    var body: some View {
        VStack {
            
            VStack {
                Text("Current UVI: \(uvi)")
                Text("Lat: \(lat)")
                Text("Lon: \(lon)")
                
            }
            
            
            Button {
                
                // MARK: - TESTING
//                fetchManager.fetchData()
//                if let data = fetchManager.oneCallApiData {
//                    uvi = data.current.uvi
//                    lat = data.lat
//                    lon = data.lon
//
//                    print("=================================================")
//                    print(uvi)
//                    print(lat)
//                    print(lon)
//                    print("=================================================")
//                }
            } label: {
                Text("Fetch Request")
            }
            .padding()
        }

    }
}

struct ChooseSunscreenView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseSunscreenView()
    }
}
