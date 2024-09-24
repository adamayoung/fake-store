//
//  AuthenticationDefaultRepository.swift
//  FakeStoreData
//
//  Created by Adam Young on 23/09/2024.
//

import FakeStoreDomain
import Foundation

final class AuthenticationDefaultRepository: AuthenticationRepository {

    private let remoteDataSource: any AuthenticationRemoteDataSource

    init(remoteDataSource: any AuthenticationRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }

    func authenticate(credential: SignInCredential) async throws -> AccessToken {
        let accessToken = try await remoteDataSource.authenticate(credential: credential)

        return accessToken
    }

}
