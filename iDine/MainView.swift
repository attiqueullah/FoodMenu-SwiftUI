//
//  MainView.swift
//  iDine
//
//  Created by Attique Ullah on 26/05/2021.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView().tabItem { Label("Menu", systemImage: "list.dash") }.tag(1)
            
            OrderView().tabItem { Label("Order", systemImage: "square.and.pencil") }.tag(2)
            
            FavouriteView().tabItem { Label("Favourite", systemImage: "star.fill") }.tag(2)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(Order())
    }
}
