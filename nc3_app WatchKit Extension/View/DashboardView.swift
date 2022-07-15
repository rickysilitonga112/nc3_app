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
//
//        .onAppear {
//            print("Appear")
////            vm.fetchData()
//        }
        
        VStack {
            // MARK: - CODE HERE
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
