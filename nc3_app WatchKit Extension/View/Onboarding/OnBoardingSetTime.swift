//
//  OnBoardingSetTime.swift
//  nc3_app WatchKit Extension
//
//  Created by Hisyam sanusi on 18/07/22.
//

import SwiftUI

struct OnBoardingSetTime: View {
    var body: some View {
        NavigationView{
            ScrollView {
                VStack(spacing: 10){
                    HStack{
                        Image(systemName: "clock.badge.checkmark")
                            .font(.title)
                        Spacer()
                        }
                        Text("Set the first time you use sunscreen to schedule a reminder on your apple watch.")
                    
                    NavigationLink(destination: OnBoardingSetTimeFirst()
                    ) {
                        Text("Set Time")
                            .foregroundColor(.black)
                    }.buttonStyle(BorderedButtonStyle(tint: Color.orange.opacity(255)))
                    
                    NavigationLink(destination: ParentView()
                    ) {
                        Text("Set Time Later")
                            .foregroundColor(.white)
                    }
                }
                
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct OnBoardingSetTime_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingSetTime()
    }
}
