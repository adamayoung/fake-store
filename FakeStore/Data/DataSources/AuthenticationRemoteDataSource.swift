//
//  AuthenticationRemoteDataSource.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import Foundation

protocol AuthenticationRemoteDataSource {

    func authenticate(credential: SignInCredential) async throws -> AccessToken

}
