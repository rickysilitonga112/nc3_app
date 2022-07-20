//
//  OnBoardingSPF.swift
//  nc3_app WatchKit Extension
//
//  Created by Hisyam sanusi on 18/07/22.
//

import SwiftUI

struct OnBoardingSPF: View {
    var body: some View {
        NavigationView{
            ScrollView {
                VStack(spacing: 10){
                    HStack{
                        Image(systemName: "sun.max")
                            .font(.title)
                        Spacer()
                        }
                        Text("Choose your SPF sunscreen for us to determine how long the sunscreen will last")
                    
                    NavigationLink(destination: OnBoardingSetTime()
                    ) {
                        Text("Choose")
                            .foregroundColor(.black)
                    }.buttonStyle(BorderedButtonStyle(tint: Color.orange.opacity(255)))
                    
                    NavigationLink(destination: ParentView()
                    ) {
                        Text("Choose Later")
                            .foregroundColor(.white)
                    }
                }
                
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct OnBoardingSPF_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingSPF()
    }
}
