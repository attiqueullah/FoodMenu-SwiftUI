//
//  OrderView.swift
//  iDine
//
//  Created by Attique Ullah on 26/05/2021.
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
                        .onDelete { indexSet in
                            deleteItems(at: indexSet)
                        }
                    }

                    Section {
                        NavigationLink(destination: CheckoutView()) {
                            Text("Place Order")
                        }
                    }
                    .disabled(order.items.isEmpty)
                }
                .navigationTitle("Order")
                .listStyle(InsetGroupedListStyle())
                .toolbar {
                    EditButton()
                        .disabled(order.items.isEmpty)
                }
            }
            
        }
    
    func deleteItems(at offsets: IndexSet) {
        order.items.remove(atOffsets: offsets)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView().environmentObject(Order())
    }
}
