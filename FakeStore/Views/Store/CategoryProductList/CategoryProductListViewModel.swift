//
//  CategoryProductListViewModel.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import FakeStoreDomain
import Foundation
import Observation

@Observable
@MainActor
final class CategoryProductListViewModel {

    struct Dependencies: Sendable {
        var fetchProductsInCategory: @Sendable (ProductCategory.ID) async throws -> [Product]

        init(fetchProductsInCategory: @Sendable @escaping (ProductCategory.ID) async throws -> [Product]) {
            self.fetchProductsInCategory = fetchProductsInCategory
        }
    }

    let category: ProductCategory
    private(set) var products: [Product] = []

    private let dependencies: Dependencies

    init(category: ProductCategory, dependencies: Dependencies) {
        self.category = category
        self.dependencies = dependencies
    }

    func fetchData() async {
        do {
            products = try await dependencies.fetchProductsInCategory(category.id)
        } catch let error {
            print("Error: \(error.localizedDescription)")
        }
    }

}

extension CategoryProductListViewModel.Dependencies {

    static var mock: Self {
        .init(
            fetchProductsInCategory: { _ in
                Product.mocks
            }
        )
    }

}
