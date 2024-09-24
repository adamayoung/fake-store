//
//  ProductMapper.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import Foundation

struct ProductMapper {

    private init() {}

    static func map(from dataModel: ProductDataModel) -> Product {
        let category = ProductCategoryMapper.map(from: dataModel.category)
        let rating = RatingMapper.map(from: dataModel.rating)

        let product = Product(
            id: dataModel.id,
            title: dataModel.title.localizedCapitalized,
            price: dataModel.price,
            description: dataModel.description.localizedCapitalized,
            category: category,
            imageURL: dataModel.image,
            rating: rating
        )

        return product
    }

}
