//
//  CartView.swift
//  Foodie
//
//  Created by S, Praveen (Cognizant) on 11/10/25.
//

import SwiftUI

struct CartView: View {
    @State var showOrderScreen = false
    @EnvironmentObject var order : OrderModel
    var body: some View {
        VStack {
            List {
                ForEach($order.orderItems) { $item in
                    HStack {
                        VStack{
                            Image(systemName: item.image)
                            Text(item.name)
                            
                            
                        }
                        VStack {
                            Text("\(item.price)")
                            
                        }
                        
                        Text("\(item.quantity)")
                        QuantityControlView(quantity: $item.quantity)
                            
                        
                    }
                    
                    
                }
                .onDelete(perform: order.deleteItems)
            }
            Spacer()
            Text("Total : \(order.totalPrize)")
            Button ("Place Order") {
                Task {
                     await PersistenceController.shared.addOrder(orderItems: order)
                    order.maketheOrderEmpty()
                }
                showOrderScreen = true
            }
        }
        .sheet(isPresented: $showOrderScreen) {
            OrdersView()
        }
        
    }
}


#Preview {
    CartView()
        .environmentObject(OrderModel())
}
