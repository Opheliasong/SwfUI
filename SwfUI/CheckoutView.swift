//
//  CheckoutView.swift
//  SwfUI
//
//  Created by Sung Min Park on 2021/12/08.
//

import SwiftUI

struct CheckoutView: View {
    let paymentTypes =  ["Cash", "Credit Card", "Points"]
    let tipamounts = [10, 15, 20, 25, 0]
    
    @EnvironmentObject var order:Order
    @State private var paymentType = "Cash"
    @State private var addLoyalyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tips = 0
    @State private var showPaymentAlert = false
    
    var totalPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tips)
        
        return formatter.string(from: NSNumber(value: total + tipValue)) ?? "$0"
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("How do you want to pay?", selection: $paymentType) {
                        ForEach(paymentTypes, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.automatic)
                    .padding()
                    Toggle("Add iDine Loyalty card", isOn: $addLoyalyDetails.animation())
                    if addLoyalyDetails {
                        TextField("Enter your iDine ID", text: $loyaltyNumber)
                    }
                }
                
                Section (header: Text("Add a tip?")) {
                    Picker("Percentage", selection: $tips) {
                        ForEach(tipamounts, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section(header:
                            Text("Total: \(totalPrice)")
                            .font(.title3)) {
                    Button("Confirm order") {
                        showPaymentAlert.toggle()
                    }
                }
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $showPaymentAlert) {
            Alert(title: Text("Order confirmed"), message: Text("Your total was \(totalPrice) - thank you"), dismissButton: .default(Text("OK")))
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView().environmentObject(Order())
    }
}
