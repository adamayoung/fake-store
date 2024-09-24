//
//  ProductCategory+Mocks.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import FakeStoreDomain
import Foundation

extension ProductCategory {

    static var mock: Self {
        ProductCategory(
            id: "men's clothing",
            name: "Men's clothing",
            imageName: "tshirt.fill"
        )
    }

    static var mocks: [Self] {
        [
            ProductCategory(
                id: "men's Clothes",
                name: "Men's Clothes",
                imageName: "tshirt.fill"
            ),
            ProductCategory(
                id: "jewelery",
                name: "Jewelery",
                imageName: "suit.diamond.fill"
            )
        ]
    }

}
