//
//  CheckoutView.swift
//  iDine
//
//  Created by Attique Ullah on 27/05/2021.
//

import SwiftUI

struct CheckoutView: View {
    
    @EnvironmentObject var order : Order
    @State private var paymentType = "Cash"
    @State private var pickupTime = "Now"
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 15
    @State private var showingPaymentAlert = false
    
    let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    let pickupTimes = ["Now", "Tonight", "Tomorrow Morning"]
    let tipAmounts = [10, 15, 20, 25, 0]
    
    var totalPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)

        return formatter.string(from: NSNumber(value: total + tipValue)) ?? "$0"
    }
    
    var body: some View {
        
        Form {
            Section {
                Picker(selection: $paymentType, label: Text("How do you want to pay?")) {
                    
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                    }
                    
                }
                Toggle("Add iDine loyalty card", isOn: $addLoyaltyDetails.animation())
                if addLoyaltyDetails {
                    TextField("Enter your iDine ID", text: $loyaltyNumber)
                }
            }
            Section(header: Text("Add a tip?")) {
                Picker(selection: $tipAmount, label: Text("Percentage:")) {
                    ForEach(tipAmounts, id: \.self) {
                        Text("\($0)%")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("Add a pickup time?")) {
                Picker(selection: $pickupTime, label: Text("Percentage:")) {
                    ForEach(pickupTimes, id: \.self) {
                        Text("\($0)")
                    }
                }
            }
            
            Section(header: Text("TOTAL: \(totalPrice)")
                        .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)) {
                Button("Confirm Order", action: {
                    showingPaymentAlert.toggle()
                })
            }
        }
        .navigationTitle(/*@START_MENU_TOKEN@*/"Payment"/*@END_MENU_TOKEN@*/)
        .navigationBarTitleDisplayMode(/*@START_MENU_TOKEN@*/.inline/*@END_MENU_TOKEN@*/)
        .alert(isPresented: $showingPaymentAlert) {
            Alert(title: Text("Order confirmed"), message: Text("Your total was \(totalPrice) – thank you!"), dismissButton: .default(Text("OK")))
        }
        
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView().environmentObject(Order())
    }
}
