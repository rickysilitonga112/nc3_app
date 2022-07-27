//
//  DashboardView.swift
//  nc3_app WatchKit Extension
//
//  Created by Ricky Silitonga on 15/07/22.
//

import SwiftUI
import CoreLocation

struct DashboardView: View {
	
//	@State var cityName: String?

    private let gradient = Gradient(colors: [.green, .yellow, .red, .purple])
    
    @StateObject var vm = BaseViewModel.shared
    @StateObject var locationManager = LocationManager.shared
    
    var uvi: Double {
        return vm.currentCondition.uvi.rounded(.up)
    }
    
    var todayWear: [String] {
        return vm.getTodayWear(uvi: Int(uvi))
    }
    var weatherIcon: String {
        return vm.getConditionName(conditionId: vm.currentCondition.weather.first?.id ?? 0)
    }
    
    var temperature: Int {
        return Int(vm.currentCondition.temp)
    }
    
    var cityName: String {
       return "City Name"
    }
    
    @State var isLoadLocation = false
    
//    init() {
//		let locationManager = LocationManager()
//
//        locationManager.requestAuthorisation()
//        let userLatitude = locationManager.lastLocation?.coordinate.latitude ?? 0
//        let userLongitude = locationManager.lastLocation?.coordinate.longitude ?? 0
//
//        vm.fetchData(lat: userLatitude, lon: userLongitude)
//
//		let location = CLLocation(latitude: userLatitude, longitude: userLongitude)
//
//		location.fetchCityName { city, error in guard let city = city, error == nil else { return }
//			cityName = city
//		}
//
//    }
    
    var body: some View {
        ScrollView {
            // MARK: - CODE HERE
            HStack {
//                HStack(spacing: 6) {
//                    Image(systemName: weatherIcon)
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 34)
//                    Text("\(temperature)°")
//                        .font(.title2)
//                }
                
//                Spacer()
                
                HStack(spacing: 15) {
                    Gauge(value: uvi, in:0.0 ... 11.0)  {
                        Image(systemName: "sun.max.fill")
                            .font(.footnote)
                            .foregroundColor(Color.orange)
                    } currentValueLabel: {
                        Text("\(Int(uvi))")
                            .foregroundColor(Color.white)
                    } .gaugeStyle(CircularGaugeStyle(tint: gradient))
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text("UV INDEX")
                            .foregroundColor(.gray)
                        .font(.body)
                        
                        Text(vm.getIndex(uvi: Int(uvi)))
                            .font(.title3)
                            .fontWeight(.bold)
                    }
                }
                Spacer()
            } .padding(.horizontal)
            Divider()
            VStack(alignment: .leading, spacing: 2) {
                Text("SKIN WILL BURN AFTER")
                    .font(.footnote)
                    .foregroundColor(.gray)
                Text(vm.getBurninTime(uvi: Int(uvi)))
                    .font(.title3)
                    .fontWeight(.bold)
            }.frame(maxWidth: .infinity, alignment: .leading)
            Divider()
            VStack(alignment: .leading, spacing: 2) {
                Text("TEMPERATURE")
                    .font(.footnote)
                    .foregroundColor(.gray)
                Text("\(temperature)°")
                    .font(.title3)
                    .fontWeight(.bold)
            }.frame(maxWidth: .infinity, alignment: .leading)
            Divider()
            VStack(alignment: .leading, spacing: 2){
                Text("Today Wear")
                    .font(.footnote)
                    .foregroundColor(.gray)
                ForEach(0 ..< todayWear.count, id: \.self) { index in
                    HStack{
                        Image(systemName: "circle.fill")
                            .resizable()
                            .frame(width: 8, height: 8)
                        Text(todayWear[index])
                            .font(.body)
                    } .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
		}
//        .navigationTitle("\(cityName)")
			.navigationBarTitleDisplayMode(.inline)
            .onAppear {
                if isLoadLocation == false {
                    locationManager.requestAuthorisation()
                    isLoadLocation.toggle()
                    
                    
                }
                
            }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}

// MARK: - TESTING
//        VStack {
//            Text("Latitude: \(vm.latitude)")
//            Text("Longitude: \(vm.longitude)")
//            Text("UVI: \(vm.currentUvi)")
//            Text("Time: \(vm.getFormatTime())")
//
//            Button {
//                withAnimation {
//                    vm.fetchData()
//                }
//            } label: {
//                Text("Fetch")
//            }
//
//        }
//        .onAppear {
//            print("Appear")
////            vm.fetchData()
//        }
