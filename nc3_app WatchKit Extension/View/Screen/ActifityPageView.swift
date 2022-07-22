//
//  ActifityPageView.swift
//  nc3_app WatchKit Extension
//
//  Created by Hisyam sanusi on 19/07/22.
//

import SwiftUI

struct ActifityPageView: View {
    @StateObject var vm = BaseViewModel.shared
    
    var spf: Int {
        return vm.choosenSpf
    }
    @State var isApplySunscreen: Bool = false
    
    @State var components = Calendar.current.dateComponents([.hour, .minute], from: .now)
    @State var reapplyHour: Int = 0
    @State var reapplyMinute: Int = 0
    
    @State var lastApplyHour: Int = 0
    @State var lastApplyMinute: Int = 0
    
    @State var goToChooseSpf: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 5){
                // sunscreen info
                if isApplySunscreen {
                    VStack {
                        VStack {
                            HStack {
                                Spacer()
                                Text("RE-APPLY SUNSCREEN")
                                    .frame(width: 190, alignment: .leading)
                                    .foregroundColor(.gray)
                                    .font(.footnote)
                            }
                            HStack {
                                Spacer()
                                Text("\(reapplyHour) : \(reapplyMinute)")
                                    .frame(width: 190, alignment: .leading)
                                    .font(.body)
                            }
                        }
                        
                        Divider()
                        
                        VStack {
                            HStack {
                                Spacer()
                                Text("LAST APPLY SUNSCREEN ")
                                    .frame(width: 190, alignment: .leading)
                                    .foregroundColor(.gray)
                                    .font(.footnote)
                            }
                            HStack {
                                Spacer()
                                Text("\(lastApplyHour) : \(lastApplyMinute)")
                                    .font(.body)
                                    .frame(width: 190, alignment: .leading)
                            }
                        }
                        
                        Divider()
                    }
                }
                
                
                HStack {
                    Spacer()
                    Button {
                        withAnimation {
                            isApplySunscreen = true
                        }
                        // test
                        if let hour = components.hour,
                           let minute = components.minute {
                            lastApplyHour = hour
                            lastApplyMinute = minute
                        }
                        
                        let spfToTime = spf * 10 * 60
                        components =  Calendar.current.dateComponents([.hour, .minute], from: .now + Double(spfToTime))
                        
                        if let hour = components.hour,
                           let minute = components.minute {
                            reapplyHour = hour
                            reapplyMinute = minute
                        }
                        
                        
                    } label: {
                        Text("Apply Sunscreen")
                            .foregroundColor(.black)
                            .frame(width: 180, alignment: .center)
                    }
                    .buttonStyle(BorderedButtonStyle(tint: !isApplySunscreen ? Color.orange.opacity(255) : Color.gray.opacity(255)))
                    .frame(width: 170)
                    Spacer()
                }
            }
            .padding(.bottom, 17)
            
            
            
            // action button
            VStack(alignment: .leading, spacing: 5){
                // title
                
                HStack {
                    Spacer()
                    Text("SETTING")
                        .frame(width: 190, alignment: .leading)
                        .foregroundColor(.gray)
                        .font(.caption2)
                }
                
                Button {
                    goToChooseSpf.toggle()
                } label: {
                    VStack {
                        HStack {
                            Text("07:30")
                                .foregroundColor(.white)
                            
                            Spacer()
                        }
                        HStack {
                            Text("Change Reminder")
                                .font(.footnote)
                                .foregroundColor(.white)
                            
                            Spacer()
                        }
                    }
                }
                .buttonStyle(BorderedButtonStyle(tint: Color.gray.opacity(255)))
                .background(
                    NavigationLink(destination: ChooseSpfView().navigationBarHidden(true), isActive: $goToChooseSpf , label: {EmptyView()})
                )
                
                
            }
            .frame(width: 170, alignment: .leading)
         
            .navigationTitle("Activity")
        }
    }
}

struct ActifityPageView_Previews: PreviewProvider {
    static var previews: some View {
        ActifityPageView()
        
    }
}
