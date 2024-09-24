//
//  CategoryMockRepository.swift
//  FakeStoreTests
//
//  Created by Adam Young on 23/09/2024.
//

@testable import FakeStoreDomain
import Foundation

final class CategoryMockRepository: CategoryRepository {

    var categoriesResult: Result<[ProductCategory], Error> = .success([])

    init() {}

    func categories() async throws -> [ProductCategory] {
        try categoriesResult.get()
    }

}
