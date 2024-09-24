//
//  CategoryListViewModel.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import Foundation
import Observation

@Observable
@MainActor
final class CategoryListViewModel {

    struct Dependencies: Sendable {
        var fetchCategories: @Sendable () async throws -> [ProductCategory]

        init(fetchCategories: @Sendable @escaping () async throws -> [ProductCategory]) {
            self.fetchCategories = fetchCategories
        }
    }

    private(set) var categories: [ProductCategory] = []

    private let dependencies: Dependencies

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }

    func fetchData() async {
        do {
            categories = try await dependencies.fetchCategories()
        } catch let error {
            print("Error: \(error.localizedDescription)")
        }
    }

}

extension CategoryListViewModel.Dependencies {

    static var mock: Self {
        .init(
            fetchCategories: {
                ProductCategory.mocks
            }
        )
    }

}
