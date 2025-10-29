//
//  CategoryModel.swift
//  Snack App
//
//  Created by Air on 29/10/25.
//

import SwiftUI

struct CategoryModel: Identifiable, Hashable {
    var id: UUID = .init()
    var icon: String
    var title: String
}

var categoryList: [CategoryModel] = [
    CategoryModel(icon: "", title: "All"),
    CategoryModel(icon: "sweet", title: "Choco"),
    CategoryModel(icon: "sweet", title: "Pasta"),
    CategoryModel(icon: "sweet", title: "Sushi"),
    CategoryModel(icon: "sweet", title: "Pancakes"),
]
