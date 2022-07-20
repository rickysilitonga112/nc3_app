//
//  DashboardView.swift
//  nc3_app WatchKit Extension
//
//  Created by Ricky Silitonga on 15/07/22.
//

import SwiftUI

struct DashboardView: View {
    @StateObject var vm = BaseViewModel.shared
    private let gradient = Gradient(colors: [.green, .yellow, .red, .purple])
    
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
    
    var body: some View {
        ScrollView {
            // MARK: - CODE HERE
            HStack {
                HStack(spacing: 6) {
                    Image(systemName: weatherIcon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 34)
                    Text("\(temperature)")
                        .font(.title2)
                }
                
                Spacer()
                
                HStack(spacing: 6) {
                    Gauge(value: uvi, in:0.0 ... 11.0)  {
                        Image(systemName: "sun.max.fill")
                            .font(.footnote)
                            .foregroundColor(Color.orange)
                    } currentValueLabel: {
                        Text("UV")
                            .foregroundColor(Color.white)
                    } .gaugeStyle(CircularGaugeStyle(tint: gradient))
                    
                    Text("\(Int(uvi))")
                        .font(.title2)
                }
                
            } .padding(.horizontal)
            Divider()
            HStack{
                Image(systemName: "sun.max")
                    .font(.title2)
                Spacer()
                    .frame(width: 17)
                VStack(alignment: .leading) {
                    Text("UV INDEX")
                        .frame(width: 80, alignment: .leading)
                        .font(.footnote)
                        .foregroundColor(.gray)
                    Text(vm.getIndex(uvi: Int(uvi)))
                        .fontWeight(.bold)
                }
                Spacer()
            }
            Divider()
            HStack{
                Image(systemName: "timer")
                    .font(.title2)
                Spacer()
                    .frame(width: 17)
                VStack(alignment: .leading) {
                    Text("BURN IN")
                        .frame(width: 80, alignment: .leading)
                        .font(.footnote)
                        .foregroundColor(.gray)
                    Text(vm.getBurninTime(uvi: Int(uvi)))
                        .fontWeight(.bold)
                }
                Spacer()
            }
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
