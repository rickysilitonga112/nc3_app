//
//  TodayUvView.swift
//  nc3_app WatchKit Extension
//
//  Created by Arma Qurrota Ayuni on 19/07/22.
//

import SwiftUI

struct TodayUV_View: View {

    @State var uvTime: [String] = ["06:00", "07:00", "08:00", "09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00"]
    @State var degree: [String] = ["18","19","20", "21","22", "23", "24", "25", "26", "27", "28", "29", "30"]
    @State var degree: [String] = ["sun"]
    
    var body: some View {
        
        ScrollView{
            VStack{
                ForEach(0 ..< 13) { index in
                    
                HStack {
                    Text("08.00")
                    
                    Spacer()
                    HStack (spacing: 10) {
      
                        Text("25°")
                        Image ("sun")
                            .resizable()
                            .frame(width: 28, height: 28)
                        Circle()
                            .frame(width: 22, height: 22)
                            .foregroundColor(.green)
                            .overlay {
                                Text("2")
                                    .font(.headline)
                                    .foregroundColor(.black)
                            }
                    }
                }
                    Divider()
                }

            }
        }
    }
}

struct TodayUvView_Previews: PreviewProvider {
    static var previews: some View {
        TodayUvView()
    }
}
