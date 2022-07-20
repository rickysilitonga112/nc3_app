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
        NavigationView{
            ScrollView {
                VStack(spacing: 10){
                    HStack{
                        Image(systemName: "sun.max")
                            .font(.title)
                        Spacer()
                    }
                    Text("Choose your SPF sunscreen for us to determine how long the sunscreen will last")
                    
                    Button {
                        showChooseSpfSheet = true
                    } label: {
                        Text("Choose")
                            .foregroundColor(.white)
                    }
                    .buttonStyle(BorderedButtonStyle(tint: Color.orange.opacity(255)))
                    
                    NavigationLink(destination: ParentView()
                    ) {
                        Text("Choose Later")
                            .foregroundColor(.white)
                    }
                }
                
            }
            .sheet(isPresented: $showChooseSpfSheet) {
                OnBoardingChooseSPF(showChooseSpfSheet: $showChooseSpfSheet)
            }
            
            .navigationBarBackButtonHidden(true)   
        }
    }
}

struct OnBoardingSPF_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingSPF(showChooseSpfSheet: true)
    }
}
