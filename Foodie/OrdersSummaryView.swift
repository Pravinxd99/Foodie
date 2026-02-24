//
//  OrdersSummaryView.swift
//  Foodie
//
//  Created by S, Praveen (Cognizant) on 11/10/25.
//

import SwiftUI

struct OrdersSummaryView: View {
    
    var order : Orders?
    var resultsArray : [OrderItems] {
        guard let items = order?.orderItems as? Set<OrderItems> else {
            return []
            
        }
        return items.sorted { $0.item ?? "" < $1.item ?? "" }
    }
    var body: some View {
        List {
            ForEach(resultsArray) { item in
                Text(item.item ?? "default")
                Text(item.describe ?? "")
            }
        }
    }
}

#Preview {
    OrdersSummaryView()
}
