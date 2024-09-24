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
        ProductCategory(id: dataModel, name: dataModel.localizedCapitalized)
    }

}
