//
//  OnBoardingSetTime.swift
//  nc3_app WatchKit Extension
//
//  Created by Hisyam sanusi on 18/07/22.
//

import SwiftUI

struct OnBoardingSetTime: View {
    var body: some View {
        ScrollView{
            VStack(spacing: 10){
                ForEach(0..<1){_ in
                    HStack{
                        Image("time2")
                            .resizable()
                            .frame(width: 30, height: 26)
                            .padding()
                        Spacer()
                    }
                    Text("Setting the first time to use sunscreen to schedule a reminder on your apple watch")
                    
                    Capsule()
                        .frame(width: 184, height: 48, alignment: .center)
                        .foregroundColor(.gray)
                        .overlay {
                            Text("Set Time")
                        }
                    Capsule()
                        .frame(width: 184, height: 48, alignment: .center)
                        .foregroundColor(.gray)
                        .overlay {
                            Text("Set Time later")
                        }
                }
            }
        }
    }
}

struct OnBoardingSetTime_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingSetTime()
    }
}
