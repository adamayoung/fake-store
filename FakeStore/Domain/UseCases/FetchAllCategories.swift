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
        try await repository.categories()
    }

}
