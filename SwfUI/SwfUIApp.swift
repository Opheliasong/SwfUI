//
//  SwfUIApp.swift
//  SwfUI
//
//  Created by Sung Min Park on 2021/12/07.
//

import SwiftUI

@main
struct SwfUIApp: App {
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
//            ContentView()
//            let menuView = try? MenuListedView(jsonName: "menu.json")
//            if menuView == nil {
//                SpecifyMenuListedView()
//            }
            MainView()
                .environmentObject(order)
        }
    }
}
