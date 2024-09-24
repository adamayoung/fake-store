//
//  UserDefaultRepository.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import Foundation

final class UserDefaultRepository: UserRepository {

    private let remoteDataSource: any UserRemoteDataSource
    private let cacheDataSource: any UserCacheDataSource

    init(
        remoteDataSource: some UserRemoteDataSource,
        cacheDataSource: some UserCacheDataSource
    ) {
        self.remoteDataSource = remoteDataSource
        self.cacheDataSource = cacheDataSource
    }

    func user(withUsername username: String) async throws -> User? {
        if let cachedUser = await cacheDataSource.user(withUsername: username) {
            return cachedUser
        }

        let user = try await remoteDataSource.user(withUsername: username)
        await cacheDataSource.setUser(user, withUsername: username)

        return user
    }

}
