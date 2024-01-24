//
//  GroceryApp.swift
//  Grocery
//
//  Created by Luan.Lima on 19/01/24.
//

import SwiftUI
import Firebase

@main
struct GroceryApp: App {

    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
