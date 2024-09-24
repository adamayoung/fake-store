//
//  AccountStore.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import Foundation
import Observation

@Observable
@MainActor
final class AccountStore {

    struct Dependencies {
        var signIn: @Sendable (SignInCredential) async throws -> AccessToken
        var fetchUser: @Sendable (String) async throws -> User?
    }

    private(set) var user: User?
    private(set) var accessToken: AccessToken?

    private let dependencies: Dependencies

    var isLoggedIn: Bool {
        accessToken != nil
    }

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }

    func signIn(username: String, password: String) async throws {
        let credential = SignInCredential(username: username, password: password)
        let accessToken = try await dependencies.signIn(credential)

        let user = try await dependencies.fetchUser(username)

        self.accessToken = accessToken
        self.user = user
    }

    func signOut() {
        accessToken = nil
        user = nil
    }

}

extension AccountStore {

    convenience init(user: User?, accessToken: AccessToken?, dependencies: Dependencies) {
        self.init(dependencies: dependencies)
        self.user = user
        self.accessToken = accessToken
    }

}

extension AccountStore.Dependencies {

    static var mock: Self {
        .init(
            signIn: { _ in
                AccessToken.mock
            },
            fetchUser: { _ in
                User.mock
            }
        )
    }

}
