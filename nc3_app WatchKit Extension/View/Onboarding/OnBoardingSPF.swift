//
//  OnBoardingSPF.swift
//  nc3_app WatchKit Extension
//
//  Created by Hisyam sanusi on 18/07/22.
//

import SwiftUI

struct OnBoardingSPF: View {
    @State var showChooseSpfSheet: Bool = false
    
    var body: some View {
        ScrollView {
            HStack{
                Image(systemName: "sun.max")
                    .font(.title)
                Spacer()
            }
            Text("Choose your SPF sunscreen for us to determine how long the sunscreen will last")
            
            Button {
                showChooseSpfSheet = true
            } label: {
                Text("Select")
                    .foregroundColor(.black)
            }
            .buttonStyle(BorderedButtonStyle(tint: Color.orange.opacity(255)))
            
            NavigationLink(destination: ParentView().navigationBarHidden(true)) {
                Text("Choose Later")
                    .foregroundColor(.white)
            }
        }
        .sheet(isPresented: $showChooseSpfSheet) {
            OnBoardingChooseSPF(showChooseSpfSheet: $showChooseSpfSheet)
        }
    }
}

struct OnBoardingSPF_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingSPF(showChooseSpfSheet: true)
    }
}
