//
//  ContentView.swift
//  Foodie
//
//  Created by S, Praveen (Cognizant) on 11/10/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(viewModel.foods) { item in
                        VStack {
                            cellView(item : item)
                            
                           
                        }
                    }
                }
            }.navigationTitle("Welcome")
                .sheet(isPresented: $viewModel.showDetailedScreen) {
                    
                    DetailedFoodView(viewModel: viewModel , selectedFoodItem: viewModel.selectedFoodItem)
                }
            
        }
    }
    private func cellView (item : Foods) -> some View {
        Button {
            viewModel.showDetailedScreen = true
                viewModel.selectedFoodItem = item
            
        }
        label : { HStack {
            Image(systemName: item.image)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
            Spacer()
            VStack {
                Text(item.name)
                Text("\(item.price)")
            }
            .padding(.trailing , 50)
        }
        }
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
