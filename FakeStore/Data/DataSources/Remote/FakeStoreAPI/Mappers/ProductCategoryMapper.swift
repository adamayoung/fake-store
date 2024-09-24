//
//  ProductCategoryMapper.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import Foundation

struct ProductCategoryMapper {

    private init() {}

    static func map(from dataModel: String) -> ProductCategory {
        let imageName = Self.imageName(for: dataModel)

        return ProductCategory(
            id: dataModel,
            name: dataModel.localizedCapitalized,
            imageName: imageName
        )
    }

}

extension ProductCategoryMapper {

    private static func imageName(for categoryID: String) -> String {
        switch categoryID {
        case "electronics": "tv"
        case "jewelery": "suit.diamond"
        case "men's clothing": "tshirt"
        case "women's clothing": "tshirt"
        default: "shippingbox"
        }
    }

}
