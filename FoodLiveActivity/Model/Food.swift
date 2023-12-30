//
//  Food.swift
//  LiveActivitySample
//
//  Created by Inyene Etoedia on 22/12/2023.
//

import Foundation
import SwiftUI


enum FoodName: String, Hashable {
    case croissant = "Croissant"
    case burger = "Burger"
    case friedChicken = "Fried Chicken"
    case shawarma = "Shawarma"
    case sandwich = "Sandwich"


}

enum ImageName: String, Hashable {
    case croissant = "croissant"
    case burger = "burger"
    case friedChicken = "fried_chicken"
    case shawarma = "shawarma"
    case sandwich = "sandwich"


}

enum FoodPrice: Decimal, Hashable {
    case small = 1.9
    case medium = 3.6
    case large = 4.5
    case extraLarge = 5.5
    case doubleLarge = 8.9
}

struct FoodMenu: Hashable, Identifiable {
    let id = UUID()
    let name: FoodName
    let image: ImageName
    let price: FoodPrice
    var quantity: Int
    var totalPrice: Decimal {
        return Decimal(quantity) * price.rawValue
        }
}



