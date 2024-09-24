//
//  ProductDetailsViewModel.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import FakeStoreDomain
import Foundation
import Observation

@Observable
@MainActor
final class ProductDetailsViewModel {

    struct Dependencies {
        var fetchProduct: @Sendable (Product.ID) async throws -> Product?
    }

    private(set) var product: Product

    private let dependencies: Dependencies

    init(product: Product, dependencies: Dependencies) {
        self.product = product
        self.dependencies = dependencies
    }

    func fetchData() async {
        do {
            product = try await dependencies.fetchProduct(product.id) ?? product
        } catch let error {
            print("Error: \(error.localizedDescription)")
        }
    }

}

extension ProductDetailsViewModel.Dependencies {

    static var mock: Self {
        .init(
            fetchProduct: { _ in
                Product.mock
            }
        )
    }

}
