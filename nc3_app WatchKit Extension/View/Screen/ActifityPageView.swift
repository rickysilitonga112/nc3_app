//
//  ActifityPageView.swift
//  nc3_app WatchKit Extension
//
//  Created by Hisyam sanusi on 19/07/22.
//

import SwiftUI

struct ActifityPageView: View {
    @StateObject var vm = BaseViewModel.shared
    
    @State var spf: Int = 15
    
    let components = Calendar.current.dateComponents([.hour, .minute], from: .now)
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 5){
                Text("PERSONAL INFO")
                    .frame(width: 190, alignment: .leading)
                    .foregroundColor(.gray)
                    .font(.caption2)
                Divider()
                
                Text("RE-APPLY SUNSCREEN")
                    .frame(width: 190, alignment: .leading)
                    .foregroundColor(.gray)
                    .font(.footnote)
                Text("12:30")
                    .font(.body)
                Divider()
                
                Text("LAST SUNSCREEN APPLY")
                    .frame(width: 190, alignment: .leading)
                    .foregroundColor(.gray)
                    .font(.footnote)
                Text("07:40")
                    .font(.body)
                Divider()
                
                Button {
                    // test
                    
                    vm.fetchData(lat: vm.latitude ?? 0, lon: vm.longitude ?? 0)
                } label: {
                    Text("Apply Sunscreen")
                        .foregroundColor(.black)
                        .frame(width: 180, alignment: .center)
                }
                .buttonStyle(BorderedButtonStyle(tint: Color.orange.opacity(255)))
            }.padding(.bottom, 17)
            
            VStack(alignment: .leading, spacing: 5){
                Text("SETTING")
                    .frame(width: 190, alignment: .leading)
                    .foregroundColor(.gray)
                    .font(.caption2)
                
                Button {
                    
                } label: {
                    VStack {
                        Text("SPF 30")
                            .foregroundColor(.white)
                            .frame(width: 180, alignment: .leading)
                        Text("Change SPF")
                            .frame(width: 180, alignment: .leading)
                            .font(.footnote)
                        
                    }
                }
                
                Button {
                    
                } label: {
                    VStack {
                        Text("07:30")
                            .foregroundColor(.white)
                            .frame(width: 180, alignment: .leading)
                        Text("Change Reminder")
                            .frame(width: 180, alignment: .leading)
                            .font(.footnote)
                        
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .onAppear {
                print(components.hour)
            }
        }
    }
}

struct ActifityPageView_Previews: PreviewProvider {
    static var previews: some View {
        ActifityPageView()
    }
}
