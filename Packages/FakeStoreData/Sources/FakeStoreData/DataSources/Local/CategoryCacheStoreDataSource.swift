//
//  CategoryCacheStoreDataSource.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import FakeStoreDomain
import Foundation

final class CategoryCacheStoreDataSource: CategoryLocalDataSource {

    private let cache: any Cache

    init(cache: some Cache) {
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
