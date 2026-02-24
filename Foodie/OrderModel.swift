//
//  OrderModel.swift
//  Foodie
//
//  Created by S, Praveen (Cognizant) on 11/10/25.
//

import Foundation
import SwiftUI
final class OrderModel : ObservableObject {
    
    @Published var orderItems : [Foods] = []
     var totalPrize : Double {
         var total : Double = 0
        for items in orderItems {
            total = total + items.price * Double (items.quantity)
        }
         return total
    }
    
    
    func addItemsToOrder (param : Foods) {
        orderItems.append(param)
    }
    func deleteItems (param : IndexSet) {
        orderItems.remove(atOffsets: param)
        }
    
    
    func maketheOrderEmpty () {
        orderItems = []
    }
}


func converter (param : Binding<String?>) -> Binding<String> {
    return Binding {
        param.wrappedValue ?? ""
    } set: { value in // -> when i type the text box takes the input but param is marked with optional is this right
        param.wrappedValue = value
    }

}

func converter1 (param : Bool?) -> Bool {
    guard let value = param else {
        return false
    }
    return true
}

func converter2 (param : Binding<String?>) -> Binding<String> {
    return Binding {
        param.wrappedValue ?? ""
    } set: { value in
        param.wrappedValue = value
    }

}
func converter3 (param : Binding<Int>) -> Binding<String> {
    
    return Binding {
        String(param.wrappedValue)
    } set: { value in //"5"
        param.wrappedValue = Int(value) ?? 0
        
    }
}

func converter4 (param : Binding<Int?>) -> Binding<Int> {
    
    return Binding {
        param.wrappedValue ?? 0
    } set: { value in
        param.wrappedValue = value
    }


}
