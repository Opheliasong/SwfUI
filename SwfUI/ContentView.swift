//
//  ContentView.swift
//  SwfUI
//
//  Created by Sung Min Park on 2021/12/07.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello")
            .padding()
    }
}

/**
 * Navigation View를 가진 List view
 */
struct HelloListedView: View {
    var body: some View {
        NavigationView {
            List {
                Text("Hello World")
                Text("Hello World")
                Text("Hello World")
            }
            .navigationTitle("Menu")
        }
    }
}

/**
 * bundle에 포함된 menu.json 파일을 고정적으로 parsing하여 ListView를 동적으로 제작하는 list view
 */
struct SpecifyMenuListedView : View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    var body: some View {
        NavigationView {
            List {
                ForEach(menu) { section in
                    Section(header: Text(section.name)) {
                        ForEach(section.items) { item in
                            Text(item.name)
                        }
                    }
                }
            }
            .navigationTitle("Menu_Specify")
        }
    }
}

/**
 * bundle에 포함된 json 파일중 하나를 생성자에서 파일명을 입력 받도록 하여, 해당 파일을 parsing하여 ListView를 동적으로 제작하는 list view
 */
struct MenuListedView : View {
    enum ArgError : Error {
        case nameIsEmpty
    }
    var fileName: String = ""
    var body: some View {
        let menu = Bundle.main.decode([MenuSection].self, from: fileName)
        NavigationView {
            List {
                ForEach(menu) { section in
                    Section(header: Text(section.name)) {   
                        ForEach(section.items) { item in
//                            Text(item.name)
                            ItemRow(item: item)
                        }
                    }
                }
            }
            .navigationTitle("Menu_Loaded")
        }
    }
    init(jsonName:String) {
        self.fileName = jsonName
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        //        ContentView()
        //        HelloListedView()
        //        SpecifyMenuListedView()
        MenuListedView(jsonName: "menu.json")
    }
}
