//
//  OnBoardingSetTimeFirst.swift
//  nc3_app WatchKit Extension
//
//  Created by Hisyam sanusi on 18/07/22.
//

import SwiftUI

struct OnBoardingSetTimeFirst: View {
    
    var body: some View {
        VStack{
            Text("Set time first apply Sunscreen")
                .frame(width: 165, alignment: .leading)
            
            Spacer()
            
            HStack {
                
            }
            
            Spacer()
            
            
            NavigationLink(destination: ParentView()
            ) {
                Text("Set Time")
                    .foregroundColor(.black)
            }.buttonStyle(BorderedButtonStyle(tint: Color.orange.opacity(255)))
            
        }
    }
}

struct OnBoardingSetTimeFirst_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingSetTimeFirst()
    }
}
