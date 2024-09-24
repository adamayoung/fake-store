//
//  SearchProducts.swift
//  FakeStore
//
//  Created by Adam Young on 24/09/2024.
//

import Foundation

final class SearchProducts: SearchProductsUseCase {

    private let repository: any ProductRepository

    init(repository: some ProductRepository) {
        self.repository = repository
    }

    func execute(query: String) async throws -> [Product] {
        let products = try await repository.products()

        let filteredProducts = products.filter { product in
            product.title.localizedCaseInsensitiveContains(query) ||
                product.description.localizedCaseInsensitiveContains(query) ||
                product.category.name.localizedCaseInsensitiveContains(query)
        }

        return filteredProducts
    }

}
