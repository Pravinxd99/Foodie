//
//  FoodieApp.swift
//  Foodie
//
//  Created by S, Praveen (Cognizant) on 11/10/25.
//

import SwiftUI

@main
struct FoodieApp: App {
    @StateObject var order = OrderModel()
    var persistentController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(order)
                .environment(\.managedObjectContext,persistentController.container.viewContext)
                
           
        }
    }
}
