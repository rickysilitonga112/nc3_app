//
//  ChooseSpfView.swift
//  nc3_app WatchKit Extension
//
//  Created by Ricky Silitonga on 21/07/22.
//

import SwiftUI

struct ChooseSpfView: View {
    let screenWidth = WKInterfaceDevice.current().screenBounds.width
    private let spfOption: [Int] = [15, 20, 25, 30, 35, 40, 45, ]
    @StateObject var vm = BaseViewModel.shared
    @State private var selection = 0
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
            
            NavigationLink(destination: ActifityPageView()
            ) {
                Text("Choose Spf")
                    .foregroundColor(.black)
            }
            .buttonStyle(BorderedButtonStyle(tint: Color.orange.opacity(255)))
            .onTapGesture {
                vm.choosenSpf = spfOption[selection]
            }
        }
    }
}

struct ChooseSpfView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseSpfView()
    }
}
