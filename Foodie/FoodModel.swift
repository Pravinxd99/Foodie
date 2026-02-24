//
//  FoodModel.swift
//  Foodie
//
//  Created by S, Praveen (Cognizant) on 11/10/25.
//

import Foundation

class Foods : Identifiable {
    let foodId = UUID()
    let name : String
    let describe : String
    var quantity : Int = 1
    let image : String
    let price : Double
    init(name: String, describe: String, image: String, price: Double) {
        self.name = name
        self.describe = describe
        self.image = image
        self.price = price
    }
    static let defaultItem : Foods = Foods(name: "Apple" , describe: "Red tatstiest apples", image: "apple.logo", price: 12)
    static let food : Foods = Foods(name: "Apple" , describe: "Red tatstiest apples", image: "apple.logo", price: 12)
    static let foods : [Foods] = [Foods(name: "Apple" , describe: "Red tatstiest apples", image: "apple.logo", price: 12),
                                  Foods(name: "Carrot", describe: "Healthy carrots", image: "carrot", price: 13),
                                  Foods(name: "Tea", describe: "Refreshing tea", image: "cup.and.heat.waves", price: 14),
                                  Foods(name: "Candy", describe: "Tasty candies", image: "seal.fill", price: 15),
                                  Foods(name: "HotChocolate", describe: "Immersive chocolate", image: "sun.max.trianglebadge.exclamationmark", price: 16),
                                  Foods(name: "IceTea", describe: "Freezes you", image: "sun.snow", price: 20),
                                  Foods(name: "IceCoffee", describe: "Freezes you", image: "sun.snow", price: 20)]
                                  
    
}
