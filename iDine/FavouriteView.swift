//
//  FavouriteView.swift
//  iDine
//
//  Created by Attique Ullah on 28/05/2021.
//

import SwiftUI

struct FavouriteView: View {
    
    @EnvironmentObject var favourites: Favourite
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(favourites.items) { item in
                    NavigationLink(destination: ItemDetail(item: item)){
                        ItemRow(item: item)
                    }
                }
                .onDelete { indexSet in
                    deleteFavouriteItem(at: indexSet)
                }
            }
            .navigationTitle("Favourite")
            .listStyle(GroupedListStyle())
        }
    }
    
    func deleteFavouriteItem(at offsets: IndexSet) {
        favourites.items.remove(atOffsets: offsets)
    }
}

struct FavouriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteView().environmentObject(Favourite())
    }
}
