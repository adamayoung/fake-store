//
//  UserDefaultRepository.swift
//  FakeStoreData
//
//  Created by Adam Young on 23/09/2024.
//

import FakeStoreDomain
import Foundation

final class UserDefaultRepository: UserRepository {

    private let remoteDataSource: any UserRemoteDataSource
    private let localDataSource: any UserLocalDataSource

    init(
        remoteDataSource: some UserRemoteDataSource,
        localDataSource: some UserLocalDataSource
    ) {
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
    }

    func user(withUsername username: String) async throws -> User? {
        if let cachedUser = await localDataSource.user(withUsername: username) {
            return cachedUser
        }

        let user = try await remoteDataSource.user(withUsername: username)
        await localDataSource.setUser(user, withUsername: username)

        return user
    }

}
