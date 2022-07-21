//
//  ActifityPageView.swift
//  nc3_app WatchKit Extension
//
//  Created by Hisyam sanusi on 19/07/22.
//

import SwiftUI

struct ActifityPageView: View {
    @StateObject var vm = BaseViewModel.shared
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 5){
                
                HStack {
                    Spacer()
                    Text("PERSONAL INFO")
                        .frame(width: 190, alignment: .leading)
                        .foregroundColor(.gray)
                    .font(.footnote)
                }
                Divider()
                
                HStack {
                    Spacer()
                    Text("RE-APPLY SUNSCREEN")
                        .frame(width: 190, alignment: .leading)
                        .foregroundColor(.gray)
                    .font(.footnote)
                }
                HStack {
                    Spacer()
                    Text("12:30")
                        .frame(width: 190, alignment: .leading)
                        .font(.body)
                }
                Divider()
                
                HStack {
                    Spacer()
                    Text("LAST SUNSCREEN APPLY")
                        .frame(width: 190, alignment: .leading)
                        .foregroundColor(.gray)
                    .font(.footnote)
                }
                HStack {
                    Spacer()
                    Text("07:40")
                        .font(.body)
                        .frame(width: 190, alignment: .leading)
                }
                Divider()
                
                Button {
                    // test
                } label: {
                    Text("Apply Sunscreen")
                        .foregroundColor(.black)
                        .frame(width: 180, alignment: .center)
                }
                .buttonStyle(BorderedButtonStyle(tint: Color.orange.opacity(255)))
            }
            .padding(.bottom, 17)
            
            VStack(alignment: .leading, spacing: 5){
                HStack {
                    Spacer()
                    Text("SETTING")
                        .frame(width: 190, alignment: .leading)
                        .foregroundColor(.gray)
                    .font(.caption2)
                }
                
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
        }
    }
}

struct ActifityPageView_Previews: PreviewProvider {
    static var previews: some View {
        ActifityPageView()
            
    }
}
