//
//  AuthenticationFastStoreAPIDataSource.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import FakeStoreDomain
import Foundation

final class AuthenticationFastStoreAPIDataSource: AuthenticationRemoteDataSource {

    private let urlSession: URLSession

    init(urlSession: URLSession) {
        self.urlSession = urlSession
    }

    func authenticate(credential: SignInCredential) async throws -> AccessToken {
        let loginBodyModel = LoginBodyDataModel(username: credential.username, password: credential.password)

        let url = FakeStoreAPIEndpoint.login.url
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try JSONEncoder().encode(loginBodyModel)
        request.addValue("application/json", forHTTPHeaderField: "Content-type")

        let (data, _) = try await urlSession.data(for: request)
        let loginDataModel = try JSONDecoder().decode(LoginDataModel.self, from: data)

        let accessToken = AccessToken(value: loginDataModel.token)

        return accessToken
    }

}
