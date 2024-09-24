//
//  FakeStoreDataCacheAdapter.swift
//  FakeStore
//
//  Created by Adam Young on 24/09/2024.
//

import CachingStore
import FakeStoreData
import Foundation

final class FakeStoreDataCacheAdapter: FakeStoreData.Cache {

    private let cache: CachingStore.KeyValueCache

    init(cache: CachingStore.KeyValueCache) {
        self.cache = cache
    }

    func get<CacheItem: Sendable>(forKey key: String) async -> CacheItem? {
        await cache.get(forKey: key)
    }

    func set(_ value: (some Sendable)?, forKey key: String) async {
        await cache.set(value, forKey: key)
    }

}
