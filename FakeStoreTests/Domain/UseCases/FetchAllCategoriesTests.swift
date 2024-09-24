//
//  FetchAllCategoriesTests.swift
//  FakeStoreTests
//
//  Created by Adam Young on 23/09/2024.
//

@testable import FakeStore
import Foundation
import Testing

@Suite
struct FetchAllCategoriesTests {

    var sut: FetchAllCategories!
    var repository: CategoryMockRepository!

    init() {
        self.repository = CategoryMockRepository()
        self.sut = FetchAllCategories(repository: repository)
    }

    @Test
    func executeReturnsCategories() async throws {
        let expectedCategories = [
            ProductCategory(id: "1", name: "Category 1"),
            ProductCategory(id: "2", name: "Category 2")
        ]
        repository.categoriesResult = .success(expectedCategories)

        let categories = try await sut.execute()

        #expect(categories == expectedCategories)
    }

}
