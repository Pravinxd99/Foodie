//
//  OrdersView.swift
//  Foodie
//
//  Created by S, Praveen (Cognizant) on 11/10/25.
//

import SwiftUI

struct OrdersView: View {
    @FetchRequest(sortDescriptors: []) private var fetchResults : FetchedResults<Orders>
    @State var showContentView : Bool = false
    
  
    var body: some View {
        NavigationStack {
            List {
                ForEach(fetchResults) { item in
                    NavigationLink {
                        OrdersSummaryView(order: item)
                    } label: {
                        Text(
                        "\(item.totalAmount)")
                    }

                }
            }
            Button ("Go to Home") {
                showContentView = true
            }
            Button("View Order summary") {
                
            }
        }
        .fullScreenCover(isPresented: $showContentView) {
            ContentView()
        }
    }
}

#Preview {
    OrdersView()
}
