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
    @StateObject var locationManager = LocationManager()
    
    var userLatitude: Double {
        return locationManager.lastLocation?.coordinate.latitude ?? 0
    }
    
    var userLongitude: Double {
        return locationManager.lastLocation?.coordinate.longitude ?? 0
    }
    
    var body: some View {
        TabView(selection: $currentView) {
            ActifityPageView().tag(1)
            DashboardView().tag(2)
            DailyConditionView().tag(3)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                print("Tabview is appear")
                
                
                vm.latitude = userLatitude
                vm.longitude = userLongitude
                
                DispatchQueue.main.async {
                    vm.fetchData(lat: userLatitude, lon: userLongitude)
                }
//
//                if let lat = locationManager.lastLocation?.coordinate.latitude {
//                    if let lon = locationManager.lastLocation?.coordinate.longitude {
//                        vm.latitude = lat
//                        vm.longitude = lon
//
//
//                    }
//                }
            }
            
            
        }
    }
}

struct ParentView_Previews: PreviewProvider {
    static var previews: some View {
        ParentView()
    }
}
