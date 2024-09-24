//
//  FetchProductsInCategory.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import Foundation

final class FetchProductsInCategory: FetchProductsInCategoryUseCase {

    private let repository: any ProductRepository

    init(repository: some ProductRepository) {
        self.repository = repository
    }

    func execute(categoryID: ProductCategory.ID) async throws -> [Product] {
        let products = try await repository.products(for: categoryID)
        return products
    }

}
