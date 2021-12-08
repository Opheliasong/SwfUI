//
//  MainView.swift
//  SwfUI
//
//  Created by Sung Min Park on 2021/12/07.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            MenuListedView(jsonName: "menu.json")
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            OrderView()
                .tabItem {
                    Label("Order", systemImage: "square.and.pencil")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(Order())
    }
}
