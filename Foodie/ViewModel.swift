//
//  ViewModel.swift
//  Foodie
//
//  Created by S, Praveen (Cognizant) on 11/10/25.
//

import Foundation
final class ViewModel : ObservableObject {
    var foods = Foods.foods
    @Published var showDetailedScreen : Bool = false
    @Published var selectedFoodItem : Foods?
    @Published var showCartScreen : Bool = false
}
