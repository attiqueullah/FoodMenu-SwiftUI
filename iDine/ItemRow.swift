//
//  ItemRow.swift
//  iDine
//
//  Created by Attique Ullah on 26/05/2021.
//

import SwiftUI

struct ItemRow: View {
    
    let item : MenuItem
    @EnvironmentObject var favorites : Favourite
    
    let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]
    
    var body: some View {
        HStack {
            Image(item.thumbnailImage)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 2))
            VStack(alignment: .leading){
                Text(item.name)
                    .font(.headline)
                Text("$\(item.price)")
            }
            Spacer()
            ForEach(item.restrictions, id: \.self) { restriction in
                Text(restriction)
                    .font(.caption)
                        .fontWeight(.black)
                        .padding(5)
                        .background(colors[restriction, default: .black])
                        .clipShape(Circle())
                        .foregroundColor(.white)
            }
            
        }
        .contextMenu(ContextMenu(menuItems: {
            Button (action: {
                if favorites.isExist(item: item){
                    favorites.remove(item: item)
                }
                else {
                    favorites.add(item: item)
                }
                
            }, label: {
                if favorites.isExist(item: item){
                    Text("UnLike")
                    Image(systemName: "hand.thumbsdown.fill")
                }
                else {
                    Text("Like")
                    Image(systemName: "hand.thumbsup.fill")
                }
            })
        }))
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}
