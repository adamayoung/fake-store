//
//  ProductCategoryGroup.swift
//  FakeStore
//
//  Created by Adam Young on 24/09/2024.
//

import Foundation

public struct ProductCategoryGroup: Identifiable, Sendable {

    public var id: String {
        category.id
    }

    public let category: ProductCategory
    public let products: [Product]

    public init(
        category: ProductCategory,
        products: [Product]
    ) {
        self.category = category
        self.products = products
    }

}
