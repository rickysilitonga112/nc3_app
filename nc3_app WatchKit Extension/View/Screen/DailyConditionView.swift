//
//  DailyConditionView.swift
//  nc3_app WatchKit Extension
//
//  Created by Ricky Silitonga on 18/07/22.
//

import SwiftUI



struct DailyConditionView: View {
    @State var uvTime: [String] = ["06:00", "07:00", "08:00", "09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00"]
    @State var degree: [String] = ["18", "19", "20", "21","22", "23", "24", "25", "26", "27", "28", "29", "30"]
    @State var weather: [String] = ["sun.max.fill", "cloud.sun.fill", "cloud.rain.fill", "cloud.bolt.rain.fill", "wind"]
    @State var uvIndex: [String] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11"]
    
    
    @State var uvWeathers = [
        UVWeather(time: "06:00", degree: 18, weather: "sun", uvIndex: 0),
        UVWeather(time: "07:00", degree: 20, weather: "sun", uvIndex: 2),
        UVWeather(time: "08:00", degree: 20, weather: "sun", uvIndex: 5),
        UVWeather(time: "09:00", degree: 23, weather: "sun", uvIndex: 10),
        UVWeather(time: "10:00", degree: 25, weather: "sun", uvIndex: 7),
    ]

    
    var body: some View {
        List(uvWeathers, id: \.self) { item in
            HStack {
                //                        Text(uvTime[index])
                Text(item.time)
                
                Spacer()
                HStack {
                    
                    //                            Text("\(degree[index])°")
                    Text("\(item.degree)°")
                    //                            Image ("sun")
                    Image(systemName: "sun.max.fill")
                    //                        Image("\(item.weather)")
                        .foregroundColor(.orange)
                    
                    //                                .resizable()
                    //                                .frame(width: 28, height: 28)
                    Circle()
                        .frame(width: 22, height: 22)
                        .foregroundColor(getUVColor(uvIndex: item.uvIndex))
                        .overlay {
                            Text("\(item.uvIndex)")
                                .font(.headline)
                                .foregroundColor(.black)
                        }
                }
            }
            .navigationTitle("Today UV")
            .foregroundColor(.white)
            //                    Divider()
            //                }
            
            //            }
        }
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
