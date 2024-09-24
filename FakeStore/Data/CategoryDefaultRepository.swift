//
//  CategoryDefaultRepository.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import Foundation

final class CategoryDefaultRepository: CategoryRepository {

    private let remoteDataSource: any CategoryRemoteDataSource
    private let cacheDataSource: any CategoryCacheDataSource

    init(
        remoteDataSource: some CategoryRemoteDataSource,
        cacheDataSource: some CategoryCacheDataSource
    ) {
        self.remoteDataSource = remoteDataSource
        self.cacheDataSource = cacheDataSource
    }

    func categories() async throws -> [ProductCategory] {
        if let cachedCategories = await cacheDataSource.categories() {
            return cachedCategories
        }

        let categories = try await remoteDataSource.categories()
        await cacheDataSource.setCategories(categories)

        return categories
    }

}
