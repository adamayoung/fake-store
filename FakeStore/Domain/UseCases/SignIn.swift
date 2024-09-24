//
//  SignIn.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import Foundation

final class SignIn: SignInUseCase {

    private let repository: any AuthenticationRepository

    init(repository: some AuthenticationRepository) {
        self.repository = repository
    }

    func execute(credential: SignInCredential) async throws -> AccessToken {
        try await repository.authenticate(credential: credential)
    }

}
