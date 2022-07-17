//
//  ChooseSunscreenView.swift
//  nc3_app WatchKit Extension
//
//  Created by Ricky Silitonga on 14/07/22.
//

import SwiftUI

struct ChooseSunscreenView: View {
    @ObservedObject var locationManager = LocationManager.shared
    
    var userLatitude: String {
        return "\(locationManager.lastLocation?.coordinate.latitude ?? 0)"
    }
    
    var userLongitude: String {
        return "\(locationManager.lastLocation?.coordinate.longitude ?? 0)"
    }
    
    var body: some View {
        VStack {
            Text("location status: \(locationManager.statusString)")
            Text("Latitude: \(userLatitude)")
            Text("Longitude: \(userLongitude)")
            
            
            Button {
                // request location
                if locationManager.authorisationStatus == .notDetermined {
                    locationManager.requestAuthorisation()
                } else {
                    print("Location is: \(locationManager.authorisationStatus.hashValue)")
                }
                
            } label: {
                Text("Req Location")
            }
        }

    }
}

struct ChooseSunscreenView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseSunscreenView()
    }
}
