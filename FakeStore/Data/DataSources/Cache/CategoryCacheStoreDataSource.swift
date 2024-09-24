//
//  CategoryCacheStoreDataSource.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import Foundation

final class CategoryCacheStoreDataSource: CategoryCacheDataSource {

    private let cache: any CacheStore

    init(cache: some CacheStore) {
        self.cache = cache
    }

    func categories() async -> [ProductCategory]? {
        await cache.get(forKey: CacheKey.categories)
    }

    func setCategories(_ categories: [ProductCategory]) async {
        await cache.set(categories, forKey: CacheKey.categories)
    }

}

extension CategoryCacheStoreDataSource {

    private enum CacheKey {
        static let categories = "categories"
    }

}
