//
//  ParentView.swift
//  nc3_app WatchKit Extension
//
//  Created by MOHAMAD IRVAN on 19/07/22.
//

import SwiftUI

struct ParentView: View {
    @State var currentView = 2
    
    @StateObject var vm = BaseViewModel.shared
    @StateObject var locationManager = LocationManager.shared
    
    var body: some View {
        TabView(selection: $currentView) {
            ActifityPageView().tag(1)
            DashboardView().tag(2)
            DailyConditionView().tag(3)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                print("Tabview is appear")
                
                if locationManager.authorisationStatus == .notDetermined {
                    locationManager.requestAuthorisation()
                } else {
                    print("Location is: \(locationManager.statusString)")
                }
                
                if let lat = locationManager.lastLocation?.coordinate.latitude {
                    if let lon = locationManager.lastLocation?.coordinate.longitude {
                        vm.latitude = lat
                        vm.longitude = lon
                        
                        DispatchQueue.main.async {
                            vm.fetchData(lat: lat, lon: lon)
                        }
                    }
                }
            }
            
            
        }
    }
}

struct ParentView_Previews: PreviewProvider {
    static var previews: some View {
        ParentView()
    }
}
