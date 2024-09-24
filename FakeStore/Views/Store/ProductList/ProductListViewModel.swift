//
//  ProductListViewModel.swift
//  FakeStore
//
//  Created by Adam Young on 24/09/2024.
//

import FakeStoreDomain
import Foundation
import Observation

@Observable
@MainActor
final class ProductListViewModel {

    struct Dependencies: Sendable {
        var fetchProductsByCategory: @Sendable () async throws -> [ProductCategoryGroup]

        init(fetchProductsByCategory: @Sendable @escaping () async throws -> [ProductCategoryGroup]) {
            self.fetchProductsByCategory = fetchProductsByCategory
        }
    }

    private(set) var groups: [ProductCategoryGroup] = []

    private let dependencies: Dependencies

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }

    func fetchData() async {
        do {
            groups = try await dependencies.fetchProductsByCategory()
        } catch let error {
            print("Error: \(error.localizedDescription)")
        }
    }

}

extension ProductListViewModel.Dependencies {

    static var mock: Self {
        .init(
            fetchProductsByCategory: {
                ProductCategoryGroup.mocks
            }
        )
    }

}
