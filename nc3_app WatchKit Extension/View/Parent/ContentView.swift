//
//  ContentView.swift
//  nc3_app WatchKit Extension
//
//  Created by Ricky Silitonga on 14/07/22.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("username") var showOnboarding: Bool = false
    var body: some View {
        NavigationView {
            if showOnboarding {
                OnboardingLocation()
            } else {
                ParentView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
