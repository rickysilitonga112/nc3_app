//
//  DashboardView.swift
//  nc3_app WatchKit Extension
//
//  Created by Ricky Silitonga on 15/07/22.
//

import SwiftUI

struct DashboardView: View {
    @ObservedObject var vm = ViewModel()
    let gradient = Gradient(colors: [.green, .yellow, .red, .purple])
    @State var todayWear: [String] = ["Sunscreen", "Sunglasses", "Hat", "Longshirt"]
    
    
    var body: some View {
        
        ScrollView {
            // MARK: - CODE HERE
            HStack(spacing: 12) {
                Image("sun")
                    .resizable()
                    .frame(width: 45
                           , height: 45)
                Text("31")
                    .font(.title2)
                    .bold()
                Spacer()
                Gauge(value: 8, in:0.0...11.0)  {
                    Image(systemName: "sun.max.fill")
                        .font(.footnote)
                        .foregroundColor(Color.orange)
                } currentValueLabel: {
                    Text("UV")
                        .foregroundColor(Color.white)
                }
            .gaugeStyle(CircularGaugeStyle(tint: gradient))
                Text("8")
                    .font(.title2)
                    .bold()
            }
            Divider()

            HStack{
                Image(systemName: "sun.max")
                    .font(.title2)
                Spacer()
                    .frame(width: 17)
                VStack{
                    Text("UV INDEX")
                        .frame(width: 80, alignment: .leading)
                        .font(.footnote)
                        .foregroundColor(.gray)
                    Text("Very High")
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
                VStack{
                    Text("BURN IN")
                        .frame(width: 80, alignment: .leading)
                        .font(.footnote)
                        .foregroundColor(.gray)
                    Text("20 Minute")
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
