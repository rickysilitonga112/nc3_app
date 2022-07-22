//
//  OnBoardingSetTimeFirst.swift
//  nc3_app WatchKit Extension
//
//  Created by Hisyam sanusi on 18/07/22.
//

import SwiftUI

struct OnBoardingSetTimeFirst: View {
    @AppStorage("username") var showOnboarding: Bool = true

    @StateObject var vm = BaseViewModel.shared
    
    @State var minute: Int = 0
    @State var hour: Int = 0
    @State var nextPage: Bool = false
    
    var minuteArr: [Int] {
        var minuteArr: [Int] = []
        
        for i in 0...12 {
            minuteArr.append(i * 5)
        }
        return minuteArr
    }
    
    var hourArr: [Int] {
        var hourArr: [Int] = []
        
        for i in 7...16 {
            hourArr.append(i)
        }
        return hourArr
    }
    
    var body: some View {
        VStack{
            Text("Set time first apply Sunscreen")
                .frame(width: 165, alignment: .leading)
            
            Spacer()
            
            HStack {
                Picker("Select a hour", selection: $hour) {
                    ForEach(0 ..< hourArr.count, id: \.self) { i in
                        HStack {
                            Text("\(hourArr[i])")
                                .tag(i)
                        }
                    }
                }
                .frame(height: 40)
                .labelsHidden()
                
                Text(":")
                    .font(.title)
                    .fontWeight(.bold)
                
                
                Picker("Select a minute", selection: $minute) {
                    ForEach(0 ..< minuteArr.count, id: \.self) { i in
                        HStack {
                            Text("\(minuteArr[i])")
                                .tag(i)
                        }
                    }
                }
                .frame(height: 40)
                .labelsHidden()
            }
            
            Spacer()
                
            Button {
                vm.setHour = hourArr[hour]
                vm.setMinute = minuteArr[minute]
                
                showOnboarding.toggle()
                nextPage.toggle()
                
            } label: {
                Text("Set Time")
                    .foregroundColor(.white)
            }
            .buttonStyle(BorderedButtonStyle(tint: Color.orange.opacity(255)))
            .background(
                NavigationLink(destination: ParentView().navigationBarHidden(true), isActive: $nextPage , label: {EmptyView()})
            )
            
        }
    }
}

struct OnBoardingSetTimeFirst_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingSetTimeFirst()
    }
}
