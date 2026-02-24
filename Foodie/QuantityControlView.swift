//
//  QuantityControlView.swift
//  Foodie
//
//  Created by S, Praveen (Cognizant) on 11/10/25.
//

import SwiftUI

struct QuantityControlView: View {
    @EnvironmentObject var order : OrderModel
  
    @Binding var quantity : Int
    var body: some View {
        HStack {
            
            Button ("+") {
                
                quantity += 1
            }
            .buttonStyle(.plain)
            Text("\(quantity)")
            Button ("-") {
                quantity -= 1
                    
            }
                .buttonStyle(.plain)
        }
    }
}

#Preview {
    QuantityControlView(quantity: .constant(0))
}
