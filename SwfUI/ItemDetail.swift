//
//  ItemDetail.swift
//  SwfUI
//
//  Created by Sung Min Park on 2021/12/07.
//

import SwiftUI

struct ItemDetail: View {
    let item: MenuItem
    @EnvironmentObject var order:Order
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -10, y: -3)
            }
            Text(item.description)
                .padding()
            Button("Order This") {
                order.add(item: item)
                presentationMode.wrappedValue.dismiss()
            }
            .font(.headline)
            .frame(width: 190, height: 58, alignment: .center)
            .foregroundColor(.white)
            .background(
                LinearGradient(gradient: Gradient(stops: [.init(color: Color.purple, location: 0), .init(color: Color.cyan, location: 1)]), startPoint: UnitPoint(x: 0.8, y: 3.0), endPoint: UnitPoint(x: -0.1, y: 0.9)))
            .cornerRadius(20)
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemDetail(item: MenuItem.example).environmentObject(Order())
        }
    }
}
