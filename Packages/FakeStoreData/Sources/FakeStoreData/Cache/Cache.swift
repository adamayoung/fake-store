//
//  Cache.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import Foundation

public protocol Cache {

    func get<CacheItem: Sendable>(forKey key: String) async -> CacheItem?

    func set<CacheItem: Sendable>(_ value: CacheItem?, forKey key: String) async

}
