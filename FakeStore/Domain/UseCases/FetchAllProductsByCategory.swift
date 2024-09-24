//
//  FetchAllProductsByCategory.swift
//  FakeStore
//
//  Created by Adam Young on 24/09/2024.
//

import Foundation

final class FetchAllProductsByCategory: FetchAllProductsByCategoryUseCase {

    private let repository: any ProductRepository

    init(repository: some ProductRepository) {
        self.repository = repository
    }

    func execute() async throws -> [ProductCategoryGroup] {
        let products = try await repository.products()
        var productsMap = [ProductCategory: [Product]]()
        for product in products {
            productsMap[product.category, default: []].append(product)
        }

        let groups = productsMap
            .map { category, products in
                let sortedProducts = products.sorted { $0.title.localizedCompare($1.title) == .orderedAscending }
                return ProductCategoryGroup(category: category, products: sortedProducts)
            }
            .sorted { (lhs: ProductCategoryGroup, rhs: ProductCategoryGroup) in
                lhs.category.name.localizedCompare(rhs.category.name) == .orderedAscending
            }

        return groups
    }

}
