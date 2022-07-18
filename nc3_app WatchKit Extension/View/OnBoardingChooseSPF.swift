//
//  OnBoardingChooseSPF.swift
//  nc3_app WatchKit Extension
//
//  Created by Hisyam sanusi on 18/07/22.
//

import SwiftUI

struct OnBoardingChooseSPF: View {
    var body: some View {
        ScrollView{
            VStack{
                ForEach(0..<1){_ in
                    Text("Choose your SPF Sunscreen")
                        .frame(width: 165, alignment: .leading)
                    
                    
                    
                    Capsule()
                        .frame(width: 184, height: 48, alignment: .center)
                        .foregroundColor(.orange)
                        .overlay {
                            Text("Save")
                        }
                }
            }
        }
    }
}

struct OnBoardingChooseSPF_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingChooseSPF()
    }
}
