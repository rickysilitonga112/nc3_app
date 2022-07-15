//
//  ChooseSunscreenView.swift
//  nc3_app WatchKit Extension
//
//  Created by Ricky Silitonga on 14/07/22.
//

import SwiftUI

struct ChooseSunscreenView: View {
    @ObservedObject var locationManager = LocationManager.shared
    
    var body: some View {
        VStack {
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
