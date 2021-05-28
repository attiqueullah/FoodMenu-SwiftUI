//
//  ItemDetail.swift
//  iDine
//
//  Created by Attique Ullah on 26/05/2021.
//

import SwiftUI

struct ItemDetail: View {
    
    let item: MenuItem
    
    @EnvironmentObject var order : Order
    @EnvironmentObject var favorites : Favourite
    
    var body: some View {
        VStack {
            ZStack (alignment: .bottomTrailing){
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                        .background(Color.black)
                        .font(.caption)
                        .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
            Text(item.description)
                .padding()
            Button("Order This", action: {
                order.add(item: item)
            })
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(LinearGradient(gradient: Gradient(colors: [.black,.gray]), startPoint: .leading, endPoint: .trailing))
            .font(/*@START_MENU_TOKEN@*/.headline/*@END_MENU_TOKEN@*/)
            .cornerRadius(40)
            .padding(.horizontal, 20)
            
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button (action: {
                    if favorites.isExist(item: item){
                        favorites.remove(item: item)
                    }
                    else {
                        favorites.add(item: item)
                    }
                    
                }, label: {
                    if favorites.isExist(item: item){
                        Image(systemName: "hand.thumbsdown.fill")
                    }
                    else {
                        Image(systemName: "hand.thumbsup.fill")
                    }
                })
            }
        }
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetail(item: MenuItem.example).environmentObject(Order())
    }
}
