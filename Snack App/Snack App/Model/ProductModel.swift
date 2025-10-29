//
//  ProductModel.swift
//  Snack App
//
//  Created by Air on 29/10/25.
//

import SwiftUI

struct Product: Identifiable {
    var id: UUID = .init()
    var name: String
    var category: String
    var image: String
    var color: Color
    var price: Int
}


//sample products
var productList = [
    Product(name: "Kurkure", category: "Chips",image: "image1", color: .red, price: 20),
    Product(name: "Lays ", category: "Chips",image: "image2", color: .blue, price: 50),
    Product(name: "Punjabi Tadka", category: "Namkeen",image: "image3", color: .purple, price: 45),
    Product(name: "Choco Lava Cake", category: "Choco",image: "image4", color: .brown, price: 85),
    Product(name: "Banana Chips", category: "Chips",image: "image5", color: .green, price: 40),
    Product(name: "Dhokla", category: "Chips",image: "image6", color: .blue, price: 40),
    Product(name: "Cheese Cake", category: "Bakery", image: "image7", color: .teal, price: 100),
    Product(name: "Poha ", category: "Snacks",image: "image8", color: .yellow, price: 35)
]
