//
//  FetchProductsInCategoryUseCase.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import Foundation

protocol FetchProductsInCategoryUseCase {

    func execute(categoryID: ProductCategory.ID) async throws -> [Product]

}
