//
//  DailyConditionView.swift
//  nc3_app WatchKit Extension
//
//  Created by Ricky Silitonga on 18/07/22.
//

import SwiftUI



struct DailyConditionView: View {
    private let gradient = Gradient(colors: [.green, .yellow, .red, .purple])
    
    @StateObject var vm = BaseViewModel.shared
    private let screenWidth = WKInterfaceDevice.current().screenBounds.width
    
    @State var uvWeathers = [
        UVWeather(time: "06:00", degree: 18, weather: "sun", uvIndex: 0),
        UVWeather(time: "07:00", degree: 20, weather: "sun", uvIndex: 2),
        UVWeather(time: "08:00", degree: 20, weather: "sun", uvIndex: 5),
        UVWeather(time: "09:00", degree: 23, weather: "sun", uvIndex: 10),
        UVWeather(time: "10:00", degree: 25, weather: "sun", uvIndex: 7),
    ]
    
    var hourlyCondition: [Condition] {
        var twelveHour: [Condition] = []
        
        for i in 1...12 {
            twelveHour.append(vm.hourlyConditionArr![i])
        }
        print("data dalam hourly: \(vm.hourlyConditionArr?.count ?? 0)")
        return twelveHour
    }
    
    var body: some View {
        List(hourlyCondition, id: \.self) { condition in
            HStack {
                Text("\(vm.getFormatTime(time: condition.dt))")
                    .font(.title3)
                
                Spacer()
                Spacer()
                Gauge(value: condition.uvi, in:0.0 ... 11.0)  {
                    Image(systemName: "sun.max.fill")
                        .font(.footnote)
                        .foregroundColor(Color.orange)
                } currentValueLabel: {
                    Text("\(Int(condition.uvi))")
                        .foregroundColor(Color.white)
                } .gaugeStyle(CircularGaugeStyle(tint: gradient))
                Spacer()
                Text("\(Int(condition.temp))°")
                    .bold()
                    .font(.title3)
                
//                Spacer()
//
//                Image(systemName: "\(vm.getConditionName(conditionId: condition.weather.first?.id ?? 0))")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 28)
//
//                Spacer()
                
//                Circle()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 28)
//                    .foregroundColor(getUVColor(uvIndex: Int(condition.uvi.rounded(.up))))
//                    .overlay(
//                        Text("\(Int(condition.uvi.rounded(.up)))")
//                            .font(.headline)
//                            .foregroundColor(.black)
//                            .fontWeight(.bold)
//                    )
                
            }
            .frame(maxWidth: .infinity)
            .onAppear {
//                if let lat = vm.latitude,
//                   let lon = vm.longitude {
//                    vm.fetchData(lat: lat, lon: lon)
//                }
            }
        }
        
        //        List(uvWeathers, id: \.self) { item in
        //            HStack {
        //                Text(item.time)
        //
        //                Spacer()
        //                HStack {
        //                    Text("\(item.degree)°")
        //                    Image(systemName: "sun.max.fill")
        //                        .foregroundColor(.orange)
        //                    Circle()
        //                        .frame(width: 22, height: 22)
        //                        .foregroundColor(getUVColor(uvIndex: item.uvIndex))
        //                        .overlay {
        //                            Text("\(item.uvIndex)")
        //                                .font(.headline)
        //                                .foregroundColor(.black)
        //                        }
        //                }
        //            }
        //            .navigationTitle("Today UV")
        //            .foregroundColor(.white)
        //        }
        
        .navigationTitle("Today UVI")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    
    func getUVColor(uvIndex: Int) -> Color {
        if uvIndex < 3 {
            return Color.green
        } else if uvIndex < 6 {
            return Color.yellow
        } else if uvIndex < 9 {
            return Color.orange
        } else if uvIndex < 12 {
            return Color.purple
        }
        return Color.clear
    }
}

struct UVWeather: Hashable {
    var time : String
    var degree : Int
    var weather : String
    var uvIndex : Int
}

struct DailyConditionView_Previews: PreviewProvider {
    static var previews: some View {
        DailyConditionView()
    }
}
