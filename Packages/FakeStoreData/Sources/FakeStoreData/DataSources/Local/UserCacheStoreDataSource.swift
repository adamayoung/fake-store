//
//  UserCacheStoreDataSource.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import FakeStoreDomain
import Foundation

final class UserCacheStoreDataSource: UserLocalDataSource {

    private let cache: any Cache

    init(cache: some Cache) {
        self.cache = cache
    }

    func user(withUsername username: String) async -> User? {
        await cache.get(forKey: username)
    }

    func setUser(_ user: User?, withUsername username: String) async {
        await cache.set(user, forKey: username)
    }

}

extension UserCacheStoreDataSource {

    private enum CacheKey {

        static func user(withUsername username: String) -> String {
            "user-username-\(username)"
        }

    }

}
