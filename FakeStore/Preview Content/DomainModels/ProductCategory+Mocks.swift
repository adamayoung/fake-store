//
//  ProductCategory+Mocks.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import Foundation

extension ProductCategory {

    static var mock: Self {
        ProductCategory(id: "men's clothing", name: "Men's clothing")
    }

    static var mocks: [Self] {
        [
            ProductCategory(id: "men's Clothes", name: "Men's Clothes"),
            ProductCategory(id: "jewelery", name: "Jewelery")
        ]
    }

}
