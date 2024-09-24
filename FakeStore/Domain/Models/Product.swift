//
//  Product.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import Foundation

struct Product: Identifiable, Sendable, Hashable {

    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: ProductCategory
    let imageURL: URL
    let rating: Rating

}
