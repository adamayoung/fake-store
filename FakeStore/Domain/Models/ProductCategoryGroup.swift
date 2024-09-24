//
//  ProductCategoryGroup.swift
//  FakeStore
//
//  Created by Adam Young on 24/09/2024.
//

import Foundation

struct ProductCategoryGroup: Identifiable, Sendable {

    var id: String {
        category.id
    }

    let category: ProductCategory
    let products: [Product]

}
