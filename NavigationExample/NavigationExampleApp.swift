//
//  NavigationExampleApp.swift
//  NavigationExample
//
//  Created by Marcel Mravec on 01.09.2023.
//

import SwiftUI

@main
struct NavigationExampleApp: App {
    @StateObject var userInfo = UserInfo()
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
