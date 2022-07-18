//
//  OnBoardingSPF.swift
//  nc3_app WatchKit Extension
//
//  Created by Hisyam sanusi on 18/07/22.
//

import SwiftUI

struct OnBoardingSPF: View {
    var body: some View {
        ScrollView{
            VStack(spacing: 10){
                ForEach(0..<1){_ in
                    HStack{
                        Image("sun2")
                            .resizable()
                            .frame(width: 26, height: 26)
                            .padding()
                        Spacer()
                    }
                    Text("Choose your SPF sunscreen for us to determine how long the sunscreen will last")
                    
                    Capsule()
                        .frame(width: 184, height: 48, alignment: .center)
                        .foregroundColor(.gray)
                        .overlay {
                            Text("Choose")
                        }
                    Capsule()
                        .frame(width: 184, height: 48, alignment: .center)
                        .foregroundColor(.gray)
                        .overlay {
                            Text("Choose later")
                        }
                }
            }
        }
    }
}

struct OnBoardingSPF_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingSPF()
    }
}
