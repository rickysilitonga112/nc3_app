//
//  ActifityPageView.swift
//  nc3_app WatchKit Extension
//
//  Created by Hisyam sanusi on 19/07/22.
//

import SwiftUI

struct ActifityPageView: View {
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
                    //print(selection)
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
        }
    }
}

struct ActifityPageView_Previews: PreviewProvider {
    static var previews: some View {
        ActifityPageView()
    }
}
