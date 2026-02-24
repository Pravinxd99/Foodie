//
//  DetailedFoodView.swift
//  Foodie
//
//  Created by S, Praveen (Cognizant) on 11/10/25.
//

import SwiftUI

struct DetailedFoodView: View {
    @EnvironmentObject var order : OrderModel
    @ObservedObject var viewModel : ViewModel
    var selectedFoodItem : Foods?
    var body: some View {
        VStack {
            VStack(alignment: .center) {
                Image(systemName: selectedFoodItem?.image ?? "")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100 , height: 100)
                Text(selectedFoodItem?.name ?? "default")
                Text("\(selectedFoodItem?.price ?? 0.0)")
                Text(selectedFoodItem?.describe ?? "default")
            }
            .padding(.top , 100)
                Spacer()
                VStack {
                    Button ("Add to Cart") {
                        order.addItemsToOrder(param: selectedFoodItem ?? Foods.defaultItem)
                        viewModel.showCartScreen = true
                    }
                }
                .padding(.bottom , 50)
            }
        .sheet(isPresented: $viewModel.showCartScreen) {
            CartView()
        }
        
    }
        
}

#Preview {
    DetailedFoodView(viewModel: ViewModel(), selectedFoodItem: Foods.food)
        .preferredColorScheme(.dark)
}
