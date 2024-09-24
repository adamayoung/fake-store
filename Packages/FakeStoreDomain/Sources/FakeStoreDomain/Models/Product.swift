//
//  Product.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import Foundation

public struct Product: Identifiable, Sendable, Hashable {

    public let id: Int
    public let title: String
    public let price: Double
    public let description: String
    public let category: ProductCategory
    public let imageURL: URL
    public let rating: Rating

    public init(
        id: Int,
        title: String,
        price: Double,
        description: String,
        category: ProductCategory,
        imageURL: URL,
        rating: Rating
    ) {
        self.id = id
        self.title = title
        self.price = price
        self.description = description
        self.category = category
        self.imageURL = imageURL
        self.rating = rating
    }

}
