//
//  ParentView.swift
//  nc3_app WatchKit Extension
//
//  Created by MOHAMAD IRVAN on 19/07/22.
//

import SwiftUI

struct ParentView: View {
    @State var currentView = 2
    
    var body: some View {
        TabView(selection: $currentView) {
            ActifityPageView().tag(1)
            DashboardView().tag(2)
            DailyConditionView().tag(3)
        }
    }
}

struct ParentView_Previews: PreviewProvider {
    static var previews: some View {
        ParentView()
    }
}
