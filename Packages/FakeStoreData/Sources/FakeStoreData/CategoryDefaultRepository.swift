//
//  CategoryDefaultRepository.swift
//  FakeStoreData
//
//  Created by Adam Young on 23/09/2024.
//

import FakeStoreDomain
import Foundation

final class CategoryDefaultRepository: CategoryRepository {

    private let remoteDataSource: any CategoryRemoteDataSource
    private let localDataSource: any CategoryLocalDataSource

    init(
        remoteDataSource: some CategoryRemoteDataSource,
        localDataSource: some CategoryLocalDataSource
    ) {
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
    }

    func categories() async throws -> [ProductCategory] {
        if let cachedCategories = await localDataSource.categories() {
            return cachedCategories
        }

        let categories = try await remoteDataSource.categories()
        await localDataSource.setCategories(categories)

        return categories
    }

}
