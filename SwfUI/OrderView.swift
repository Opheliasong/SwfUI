//
//  OrderView.swift
//  SwfUI
//
//  Created by Sung Min Park on 2021/12/07.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(order.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }
                }
                
                Section {
                    NavigationLink(destination: Text("Check Out")) {
                        Text("Place order")
                    }
                }
            }
        }
        .navigationTitle("Order")
        .listStyle(.insetGrouped)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
            .environmentObject(Order())
    }
}
