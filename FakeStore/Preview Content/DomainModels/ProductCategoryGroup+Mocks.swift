//
//  ProductCategoryGroup+Mocks.swift
//  FakeStore
//
//  Created by Adam Young on 24/09/2024.
//

import FakeStoreDomain
import Foundation

extension ProductCategoryGroup {

    static var mocks: [Self] {
        [
            ProductCategoryGroup(
                category: ProductCategory.mocks[0],
                products: Product.mocks
            ),
            ProductCategoryGroup(
                category: ProductCategory.mocks[1],
                products: Product.mocks
            )
        ]
    }

}
