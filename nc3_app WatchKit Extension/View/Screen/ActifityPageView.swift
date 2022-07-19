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
            VStack(spacing: 10){
                Text("PERSONAL INFO")
                    .frame(width: 190, alignment: .leading)
                    .foregroundColor(.gray)
                    .font(.caption2)
                Divider()
                
                Text("Re-Apply Sunscreen")
                    .frame(width: 190, alignment: .leading)
                    .foregroundColor(.gray)
                    .font(.footnote)
                Divider()
                
                Text("Last Sunscreen Apply")
                    .frame(width: 190, alignment: .leading)
                    .foregroundColor(.gray)
                    .font(.footnote)
                Divider()
                
                Button {
                    //print(selection)
                } label: {
                    Text("Apply Sunscreen")
                        .foregroundColor(.white)
                        .frame(width: 180, alignment: .leading)
                }
                .buttonStyle(BorderedButtonStyle(tint: Color.gray.opacity(255)))
                Spacer()
                    .frame(height: 30)
                VStack(spacing: 10){
                    Text("SETTINGS")
                        .frame(width: 190, alignment: .leading)
                        .foregroundColor(.gray)
                        .font(.caption2)
                    Divider()
                    
                    Button {
                        //print(selection)
                    } label: {
                        VStack{
                            Text("SPF 50")
                                .foregroundColor(.white)
                                .frame(width: 180, alignment: .leading)
                            Text("Sunscreen SPF")
                                .font(.footnote)
                                .foregroundColor(.white)
                                .frame(width: 180, alignment: .leading)
                        }
                  
                    }
                    .buttonStyle(BorderedButtonStyle(tint: Color.gray.opacity(255)))
                    
                    Button {
                        //print(selection)
                    } label: {
                        Text("Sunscreen Reminder")
                            .foregroundColor(.white)
                            .frame(width: 180, alignment: .leading)
                    }
                    .buttonStyle(BorderedButtonStyle(tint: Color.gray.opacity(255)))


                }

            }
        }
    }
}

struct ActifityPageView_Previews: PreviewProvider {
    static var previews: some View {
        ActifityPageView()
    }
}
