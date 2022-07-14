//
//  nc3_appApp.swift
//  nc3_app WatchKit Extension
//
//  Created by Ricky Silitonga on 14/07/22.
//

import SwiftUI

@main
struct nc3_appApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
