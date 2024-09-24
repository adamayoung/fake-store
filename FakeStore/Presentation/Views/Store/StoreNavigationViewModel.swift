//
//  StoreNavigationViewModel.swift
//  FakeStore
//
//  Created by Adam Young on 24/09/2024.
//

import Foundation
import Observation

@Observable
@MainActor
final class StoreNavigationViewModel {

    struct Dependencies: Sendable {
        var searchProducts: @Sendable (String) async throws -> [Product]

        init(searchProducts: @Sendable @escaping (String) async throws -> [Product]) {
            self.searchProducts = searchProducts
        }
    }

    private(set) var products: [Product] = []

    private let dependencies: Dependencies

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }

    func search(for query: String) async {
        guard !query.isEmpty else {
            products = []
            return
        }

        do {
            print("seatching for \(query)")
            products = try await dependencies.searchProducts(query)
        } catch {
            products = []
        }
    }

}

extension StoreNavigationViewModel.Dependencies {

    static var mock: Self {
        .init(
            searchProducts: { _ in
                Product.mocks
            }
        )
    }

}
