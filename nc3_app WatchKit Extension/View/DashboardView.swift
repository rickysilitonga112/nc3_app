//
//  DashboardView.swift
//  nc3_app WatchKit Extension
//
//  Created by Ricky Silitonga on 15/07/22.
//

import SwiftUI

struct DashboardView: View {
    @ObservedObject var vm = ViewModel()
    
    
    
    var body: some View {
        // MARK: - TESTING
        VStack {
            Text("Latitude: \(vm.latitude)")
            Text("Longitude: \(vm.longitude)")
            Text("UVI: \(vm.currentUvi)")
            Text("Time: \(vm.getFormatTime())")

            Button {
                withAnimation {
                    vm.fetchData()
                }
            } label: {
                Text("Fetch")
            }

        }
        .onAppear {
            print("Appear")
//            vm.fetchData()
        }
        
//        VStack {
//            // MARK: - CODE HERE
//            HStack(spacing: 3){
//                Image("sun")
//                    .resizable()
//                    .frame(width: 40, height: 40)
//                    .padding()
//                Text("31")
//                    .font(.title3)
//                    .fontWeight(.bold)
//                Spacer()
//                Image("uv")
//                    .resizable()
//                    .frame(width: 40, height: 40)
//                    .padding()
//                Text("8")
//                    .font(.title3)
//                    .fontWeight(.bold)
//                Spacer()
//            }
//            Divider()
//
//            HStack{
//                Image("sun2")
//                    .resizable()
//                    .frame(width: 40, height: 40)
//                    .padding()
//                Spacer()
//                    .frame(width: 17)
//                VStack{
//                    Text("UV INDEX")
//                        .frame(width: 80, alignment: .leading)
//                        .font(.caption2)
//                        .foregroundColor(.gray)
//                    Text("Very High")
//                        .fontWeight(.bold)
//                }
//                Spacer()
//            }
//            Divider()
//
//            HStack{
//                Image("time")
//                    .resizable()
//                    .frame(width: 40, height: 40)
//                    .padding()
//                Spacer()
//                    .frame(width: 17)
//                VStack{
//                    Text("BURN IN")
//                        .frame(width: 80, alignment: .leading)
//                        .font(.caption2)
//                        .foregroundColor(.gray)
//                    Text("20 Minute")
//                        .fontWeight(.bold)
//                }
//                Spacer()
//            }
//            Divider()
//            Text("\(vm.latitude)")
//        }
    }
    
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
