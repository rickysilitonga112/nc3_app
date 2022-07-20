//
//  OnboardingLocation.swift
//  nc3_app WatchKit Extension
//
//  Created by MOHAMAD IRVAN on 19/07/22.
//

import SwiftUI

struct OnboardingLocation: View {
    
    var body: some View {
        NavigationView {
            VStack(spacing: 10){
                HStack{
                    Image(systemName: "location.circle")
                        .font(.title)
                    Spacer()
                }
                Text("Let us know your location for optimization of our services.")
                NavigationLink(destination: OnBoardingSPF()
                ) {
                    Text("Set Location")
                        .foregroundColor(.black)
                }.buttonStyle(BorderedButtonStyle(tint: Color.orange.opacity(255)))
                
            }
        }
    }
}

struct OnboardingLocation_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingLocation()
    }
}
