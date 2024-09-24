//
//  UserFastStoreAPIDataSource.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import Foundation

final class UserFastStoreAPIDataSource: UserRemoteDataSource {

    private let urlSession: URLSession

    init(urlSession: URLSession) {
        self.urlSession = urlSession
    }

    func user(withUsername username: String) async throws -> User? {
        let url = FakeStoreAPIEndpoint.users.url
        let (data, _) = try await urlSession.data(from: url)
        let userDataModels = try JSONDecoder().decode([UserDataModel].self, from: data)

        guard
            let matchingUserDataModel = (userDataModels.first { $0.username.lowercased() == username.lowercased() })
        else {
            return nil
        }

        let user = UserMapper.map(from: matchingUserDataModel)

        return user
    }

}
