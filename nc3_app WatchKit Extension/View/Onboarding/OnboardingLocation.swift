//
//  OnboardingLocation.swift
//  nc3_app WatchKit Extension
//
//  Created by MOHAMAD IRVAN on 19/07/22.
//

import SwiftUI

struct OnboardingLocation: View {
    @StateObject var locationManager = LocationManager.shared
    @State var nextPage: Bool = false
    
    var body: some View {
        VStack(spacing: 10){
            HStack{
                Image(systemName: "location.circle")
                    .font(.title)
                Spacer()
            }
            Text("Let us know your location for optimization of our services.")
            
            Button {
                print("Set Location")
                
                if locationManager.authorisationStatus == .notDetermined {
                    locationManager.requestAuthorisation()
                } else {
                    print("Location is: \(locationManager.statusString)")
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    nextPage.toggle()
                }
                
            } label: {
                Text("Set Location")
                    .foregroundColor(.white)
            }
            .buttonStyle(BorderedButtonStyle(tint: Color.orange.opacity(255)))
            .background(
                NavigationLink(destination: OnBoardingSPF().navigationBarHidden(true), isActive: $nextPage , label: {EmptyView()})
            )
        }
        
    }
}

struct OnboardingLocation_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingLocation()
    }
}
