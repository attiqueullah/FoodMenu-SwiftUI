//
//  iDineApp.swift
//  iDine
//
//  Created by Attique Ullah on 26/05/2021.
//

import SwiftUI

@main
struct iDineApp: App {
    
    @StateObject var order = Order()
    @StateObject var favourite = Favourite()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
                .environmentObject(favourite)
        }
    }
}
