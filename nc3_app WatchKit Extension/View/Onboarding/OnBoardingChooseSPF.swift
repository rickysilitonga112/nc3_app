//
//  OnBoardingChooseSPF.swift
//  nc3_app WatchKit Extension
//
//  Created by Hisyam sanusi on 18/07/22.
//

import SwiftUI

struct OnBoardingChooseSPF: View {
    let screenWidth = WKInterfaceDevice.current().screenBounds.width
    @Binding var showChooseSpfSheet: Bool
    
    @State private var selection = 0
    private let spfOption: [Int] = [15, 20, 25, 30, 35, 40, 45, ]
    @StateObject var vm = BaseViewModel.shared
    @State var nextPage: Bool = false
    
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("Choose your SPF \nsunscreen")
                    Spacer()
                }
                
                Picker("Select a number", selection: $selection) {
                    ForEach(0 ..< spfOption.count, id: \.self) { index in
                        HStack {
                            Text("Spf \(spfOption[index])")
                                .tag(index)
                                .font(index == selection ? .title2 : .body)
                        }
                    }
                }
                .frame(height: 60)
                .labelsHidden()
            }
            
            Spacer()
            
            Button {
                vm.choosenSpf = spfOption[selection]
                nextPage.toggle()
                
            } label: {
                Text("Save")
                    .foregroundColor(.black)
            }
            .buttonStyle(BorderedButtonStyle(tint: Color.orange.opacity(255)))
            .background(
                NavigationLink(destination: OnBoardingSetTime().navigationBarHidden(true), isActive: $nextPage , label: {EmptyView()})
            )
        }
    }
}

struct OnBoardingChooseSPF_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingChooseSPF(showChooseSpfSheet: .constant(true))
    }
}
