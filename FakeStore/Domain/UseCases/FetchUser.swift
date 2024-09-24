//
//  FetchUser.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import Foundation

final class FetchUser: FetchUserUseCase {

    private let repository: any UserRepository

    init(repository: some UserRepository) {
        self.repository = repository
    }

    func execute(username: String) async throws -> User? {
        try await repository.user(withUsername: username)
    }

}
