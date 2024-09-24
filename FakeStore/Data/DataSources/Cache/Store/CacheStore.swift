//
//  CacheStore.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import Foundation

protocol CacheStore {

    func get<CacheItem>(forKey key: String) async -> CacheItem?

    func set<CacheItem>(_ value: CacheItem?, forKey key: String) async

}
