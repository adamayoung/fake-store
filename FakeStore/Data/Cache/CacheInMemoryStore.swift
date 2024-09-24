//
//  CacheInMemoryStore.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import Foundation
import OSLog

actor CacheInMemoryStore: CacheStore {

    private let cache = NSCache<NSString, Box>()

    func get<CacheItem>(forKey key: String) async -> CacheItem? {
        let nsKey = key as NSString
        guard let cacheItem = cache.object(forKey: nsKey)?.value as? CacheItem else {
            print("Cache MISS: \(key)")
            return nil
        }

        print("Cache HIT: \(key)")
        return cacheItem
    }

    func set(_ value: (some Any)?, forKey key: String) async {
        let nsKey = key as NSString

        guard let value else {
            cache.removeObject(forKey: nsKey)
            return
        }

        cache.setObject(Box(value), forKey: nsKey)
    }

}

extension CacheInMemoryStore {

    private final class Box: AnyObject {
        let value: Any

        init(_ value: Any) {
            self.value = value
        }
    }

}
