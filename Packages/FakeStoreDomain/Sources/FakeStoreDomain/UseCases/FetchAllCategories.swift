//
//  FetchAllCategories.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import Foundation

final class FetchAllCategories: FetchAllCategoriesUseCase {

    private let repository: any CategoryRepository

    init(repository: some CategoryRepository) {
        self.repository = repository
    }

    func execute() async throws -> [ProductCategory] {
        let categories = try await repository.categories()
            .sorted { $0.name.localizedCompare($1.name) == .orderedAscending }

        return categories
    }

}
