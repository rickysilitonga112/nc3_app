//
//  OnBoardingChooseSPF.swift
//  nc3_app WatchKit Extension
//
//  Created by Hisyam sanusi on 18/07/22.
//

import SwiftUI

struct OnBoardingChooseSPF: View {
    let screenWidth = WKInterfaceDevice.current().screenBounds.width
    @State private var selection = 1
    private let spfOption: [String] = [
        "Spf 15",
        "Spf 20",
        "Spf 25",
        "Spf 30",
    ]
    
    var body: some View {
        VStack {
            Picker(selection: $selection) {
                ForEach(0 ..< spfOption.count, id: \.self) { index in
                    HStack {
                        Text(spfOption[index])
                            .tag(index)
                            .font(index == selection ? .body : .title3)
                    }
                }

            } label: {
                Text("Choose your spf \nsunscreen")
                    .frame(width: screenWidth, alignment: .leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.leading)
            }
            .clipped()
            .frame(height: 110)
            
            Spacer()
            
            Button {
                print(selection)
            } label: {
                Text("Save")
                    .foregroundColor(.white)
            }
            .buttonStyle(BorderedButtonStyle(tint: Color.orange.opacity(255)))
        }
        
    }
}

struct OnBoardingChooseSPF_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingChooseSPF()
    }
}
